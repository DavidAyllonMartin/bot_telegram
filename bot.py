from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ContextTypes, ConversationHandler
from database import get_session
from service import championship_service, player_service, bga_service
from constants import DatabaseConstant

ASK_LINK = range(1)

async def link_player(update, context):
    telegram_id = update.message.from_user.id

    with get_session() as session:

        existing_player = player_service.get_player_by_telegram_id(session, telegram_id)

        if existing_player:
            await update.message.reply_text(DatabaseConstant.LINK_ALREADY_REGISTERED.format(nickbga=existing_player.nickbga))
            return
    
        championship = championship_service.get_championship_by_idchat(session, update.effective_chat.id)

        if not championship:
            await update.message.reply_text(DatabaseConstant.NO_CHAMPIONSHIP_FOUND)
            return

        unlinked_players = [player for player in championship.players if player.idtelegram is None]

        if not unlinked_players:
            await update.message.reply_text(DatabaseConstant.ALL_PLAYERS_LINKED)
            return

        keyboard = [
            [InlineKeyboardButton(player.nickbga, callback_data=player.idplayer)] for player in unlinked_players
        ]
        
        keyboard.append([InlineKeyboardButton("Cancelar", callback_data="cancel_link")])

        reply_markup = InlineKeyboardMarkup(keyboard)

        await update.message.reply_text(DatabaseConstant.ASK_WHICH_PLAYER, reply_markup=reply_markup)

async def link_buttons_handler(update, context):
    query = update.callback_query
    await query.answer()

    with get_session() as session:
        if query.data == "cancel_link":
            await query.edit_message_text(text=DatabaseConstant.CANCEL_OPERATION)
            return

        player = player_service.get_player_by_id(session, query.data)

        if not player:
            await query.edit_message_text(text=DatabaseConstant.PLAYER_NOT_FOUND)
            return

        player.idtelegram = query.from_user.id
        player.name = query.from_user.username

        session.commit()

        await query.edit_message_text(
            text=DatabaseConstant.THANKS_REGISTERED.format(first_name=query.from_user.first_name, nickbga=player.nickbga)
        )

async def unlink_player(update, context):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text(DatabaseConstant.NOT_LINKED)
            return

        player.idtelegram = None
        session.commit()

        await update.message.reply_text(DatabaseConstant.UNLINKED_SUCCESS.format(nickbga=player.nickbga))

async def start_setlink(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(DatabaseConstant.ASK_CHAMP_URL)
    return ASK_LINK

async def receive_link(update: Update, context: ContextTypes.DEFAULT_TYPE):
    url = update.message.text.strip()
    chat_id = update.effective_chat.id

    if not bga_service.is_valid_url(url):
        await update.message.reply_text(DatabaseConstant.INVALID_URL)
        return ConversationHandler.END

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)

        if championship:
            if championship.championshipurl == url:
                await update.message.reply_text(DatabaseConstant.URL_ALREADY_USED)
                return ConversationHandler.END

            champ_data = {
                "idchampionship": championship.idchampionship,
                "idchat": chat_id,
                "championshipurl": url,
                "lastplayer": None,
                "players": []
            }
        else:
            champ_data = {
                "idchat": chat_id,
                "championshipurl": url
            }

        championship = championship_service.save_championship(session, champ_data)

        jsonObj = bga_service.extract_json_from_url(url)
        players_json = jsonObj.get("players", {})

        existing_players = {
            player.nickbga: player for player in player_service.get_all_players(session)
        }

        for idbga, data in players_json.items():
            nickbga = data["name"]

            player = existing_players.get(nickbga)
            if not player:
                player_data = {
                    "idtelegram": None,
                    "idbga": idbga,
                    "nickbga": nickbga,
                    "name": None,
                    "notify": True
                }
                player = player_service.save_player(session, player_data)

            if player not in championship.players:
                championship.players.append(player)

        session.commit()

    await update.message.reply_text(DatabaseConstant.CHAMP_URL_SAVED)
    return ConversationHandler.END

async def cancel(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(DatabaseConstant.CANCEL_OPERATION)
    return ConversationHandler.END

async def status(update: Update, context: ContextTypes.DEFAULT_TYPE):
    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, update.effective_chat.id)

        if not championship:
            await update.message.reply_text(DatabaseConstant.NO_CAMPAIGN_REGISTERED)
            return

        text = DatabaseConstant.CAMPAIGN_HEADER.format(url=championship.championshipurl or 'No asignado')
        text += DatabaseConstant.PLAYER_LIST_HEADER

        for user in championship.players:
            player_name = user.name or "Nombre no asignado"
            text += DatabaseConstant.PLAYER_LINE.format(player_name=player_name, nickbga=user.nickbga)

        await update.message.reply_text(text)

async def activate_notifications(update, context):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text(DatabaseConstant.NOT_LINKED)
            return

        player.notify = True
        session.commit()

        await update.message.reply_text(DatabaseConstant.NOTIFICATIONS_ON.format(nickbga=player.nickbga))

async def deactivate_notifications(update, context):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text(DatabaseConstant.NOT_LINKED)
            return

        player.notify = False
        session.commit()

        await update.message.reply_text(DatabaseConstant.NOTIFICATIONS_OFF.format(nickbga=player.nickbga))

async def delete_championship(update, context):
    chat_id = update.effective_chat.id

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)
        championship_service.delete_championship(session, championship.idchampionship)
        session.commit()
