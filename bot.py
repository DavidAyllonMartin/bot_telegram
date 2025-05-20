from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ContextTypes, ConversationHandler
from telegram.helpers import escape_markdown
from database import get_session
from service import championship_service, player_service, bga_service
from constants import COMMAND_DELETE_CHAMPIONSHIP, COMMAND_DISABLE_GROUP_NOTIFICATIONS, COMMAND_DISABLE_MENTIONS, COMMAND_ENABLE_GROUP_NOTIFICATIONS, COMMAND_ENABLE_MENTIONS, COMMAND_ESTABLISH_URL, COMMAND_HELP, COMMAND_LINK_PLAYER, COMMAND_START, COMMAND_CHAMPIONSHIP_STATUS, COMMAND_UNLINK_PLAYER

ASK_LINK = range(1)

async def start_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = update.effective_chat.id
    message_lines = ["👋 ¡Hola! Soy el bot de la Liga Heat BGA España."]

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)

        if championship is None:
            message_lines.append("🚫 Este grupo todavía no tiene un campeonato vinculado.")
            message_lines.append(
                f"🔗 Usa /{COMMAND_ESTABLISH_URL} para vincular la URL del campeonato a este grupo y activar las notificaciones."
            )
            message_lines.append(f"Para más información, usa el comando /{COMMAND_HELP}.")
        else:
            message_lines.append("⚠️ Ya hay un campeonato vinculado a este chat.")
            if championship.notify:
                message_lines.append("✅ Las notificaciones están *activadas* para este grupo.")
                message_lines.append(f"Puedes desactivar las notificaciones para este grupo con el comando /{COMMAND_DISABLE_GROUP_NOTIFICATIONS}")
            else:
                message_lines.append("🔕 Las notificaciones están *desactivadas* para este grupo.")
                message_lines.append(f"Puedes activar las notificaciones para este grupo con el comando /{COMMAND_ENABLE_GROUP_NOTIFICATIONS}")

            message_lines.append(f"Usa /{COMMAND_HELP} para ver todos los comandos disponibles.")

    await update.message.reply_text(
        escape_markdown("\n".join(message_lines)),
        parse_mode="Markdown"
    )

async def help_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    help_text = (
        "📚 *Comandos disponibles:*\n\n"
        
        "🔹 *Inicio y configuración del grupo:*\n"
        f"/{COMMAND_START} - Arranca el bot y muestra información básica\n"
        f"/{COMMAND_CHAMPIONSHIP_STATUS} - Muestra el estado actual del campeonato\n"
        f"/{COMMAND_ESTABLISH_URL} - Vincula la URL del campeonato con el grupo\n"
        f"/{COMMAND_DELETE_CHAMPIONSHIP} - Elimina la URL del campeonato asociada a este grupo\n"
        f"/{COMMAND_ENABLE_GROUP_NOTIFICATIONS} - Activa las notificaciones automáticas del campeonato\n"
        f"/{COMMAND_DISABLE_GROUP_NOTIFICATIONS} - Desactiva las notificaciones del campeonato\n\n"
        
        "🔹 *Gestión de jugadores:*\n"
        f"/{COMMAND_LINK_PLAYER} - Vincula tu usuario con tu nick de BGA\n"
        f"/{COMMAND_UNLINK_PLAYER} - Desvincula tu usuario de tu nick de BGA\n\n"
        
        "🔹 *Menciones personales:*\n"
        f"/{COMMAND_ENABLE_MENTIONS} - Te mencionaremos en el grupo cuando sea tu turno\n"
        f"/{COMMAND_DISABLE_MENTIONS} - Dejaremos de mencionarte cuando te toque\n\n"

        "ℹ️ Usa estos comandos para gestionar tu campeonato y estar al día de tus partidas.\n"
        f"Puedes volver a consultar esta ayuda con /{COMMAND_HELP}."
    )

    await update.message.reply_text(escape_markdown(help_text), parse_mode="Markdown")

async def link_player(update: Update, context: ContextTypes.DEFAULT_TYPE):
    telegram_id = update.message.from_user.id

    with get_session() as session:

        existing_player = player_service.get_player_by_telegram_id(session, telegram_id)

        if existing_player:
            await update.message.reply_text(f"❌ Ya estás vinculado como ''{existing_player.nickbga}''. No puedes vincularte de nuevo.")
            return
    
        championship = championship_service.get_championship_by_idchat(session, update.effective_chat.id)

        if not championship:
            await update.message.reply_text("❌ No se encontró un campeonato para este chat.")
            return

        unlinked_players = [player for player in championship.players if player.idtelegram is None]

        if not unlinked_players:
            await update.message.reply_text("✅ Todos los jugadores del campeonato ya están vinculados con usuarios de Telegram.")
            return

        keyboard = [
            [InlineKeyboardButton(player.nickbga, callback_data=player.idplayer)] for player in unlinked_players
        ]
        
        keyboard.append([InlineKeyboardButton("Cancelar", callback_data="cancel_link")])

        reply_markup = InlineKeyboardMarkup(keyboard)

        await update.message.reply_text("👤 ¿Con qué jugador del campeonato quieres vincularte?", reply_markup=reply_markup)

async def link_buttons_handler(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    with get_session() as session:
        if query.data == "cancel_link":
            await query.edit_message_text(text="❌ Operación cancelada.")
            return

        player = player_service.get_player_by_id(session, query.data)

        if not player:
            await query.edit_message_text(text="Jugador no encontrado.")
            return

        player.idtelegram = query.from_user.id
        player.name = query.from_user.username

        session.commit()

        await query.edit_message_text(
            text=f"¡Gracias, {query.from_user.first_name}! Ahora estás registrado como ''{player.nickbga}''."
        )

async def unlink_player(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text("ℹ️ No estás vinculado a ningún jugador en este momento.")
            return

        player.idtelegram = None
        session.commit()

        await update.message.reply_text(f"🔓 Has sido desvinculado del jugador ''{player.nickbga}''.")

async def start_setlink(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(
        "Por favor, indícame el **código del campeonato**.\n\n"
        "Es el código numérico de 10 dígitos que aparece en la url de la partida en BGA.\n"
        "https://boardgamearena.com/heat?table=**0123456789** En este ejemplo el código sería **0123456789**",
        parse_mode="Markdown"
    )
    return ASK_LINK

from telegram import InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import ConversationHandler

CONFIRM_ADD = 1

async def receive_link(update: Update, context: ContextTypes.DEFAULT_TYPE):
    table_code = update.message.text.strip()

    if not table_code.isdigit() or len(table_code) < 8:
        await update.message.reply_text("❌ El código que has introducido no es válido.")
        return ConversationHandler.END

    url = bga_service.get_championship_url(table_code)
    chat_id = update.effective_chat.id

    if not url:
        await update.message.reply_text("❌ No se pudo encontrar el campeonato. ¿Estás seguro de que el código es correcto?")
        return ConversationHandler.END

    jsonObj = bga_service.extract_setup_json_from_url(url)
    players_json = jsonObj.get("players", {})

    if not players_json:
        await update.message.reply_text("❌ No se encontraron jugadores en el campeonato. No se puede continuar.")
        return ConversationHandler.END

    context.user_data["championship_url"] = url
    context.user_data["players_json"] = players_json

    player_list = "\n".join(f"• {data['name']}" for data in players_json.values())
    message = (
        f"✅ Se han encontrado los siguientes jugadores:\n\n"
        f"{player_list}\n\n"
        f"¿Quieres añadir el campeonato con estos jugadores?"
    )

    buttons = [
        [InlineKeyboardButton("✅ Sí", callback_data="confirm_add_yes")],
        [InlineKeyboardButton("❌ No", callback_data="confirm_add_no")],
    ]
    reply_markup = InlineKeyboardMarkup(buttons)

    await update.message.reply_text(message, reply_markup=reply_markup)
    return CONFIRM_ADD

async def confirm_add_championship(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    chat_id = query.message.chat_id
    data = query.data

    if data == "confirm_add_no":
        await query.edit_message_text("❌ Operación cancelada.")
        return ConversationHandler.END

    url = context.user_data.get("championship_url")
    players_json = context.user_data.get("players_json")

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)

        if championship and championship.championshipurl == url:
            await query.edit_message_text("❌ Este campeonato ya está vinculado a este grupo.")
            return ConversationHandler.END

        champ_data = {
            "idchampionship": championship.idchampionship if championship else None,
            "idchat": chat_id,
            "championshipurl": url,
            "lastplayer": None,
            "players": []
        }

        for idbga, data in players_json.items():
            nickbga = data["name"]

            player = player_service.get_player_by_nickbga(session, nickbga)
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

        championship = championship_service.save_championship(session, champ_data)
        session.commit()

    await update.message.reply_text("✅ ¡Campeonato vinculado correctamente! Ya puedes gestionar notificaciones o jugadores.")
    return ConversationHandler.END


async def cancel(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("❌ Operación cancelada.")
    return ConversationHandler.END

async def championship_status(update: Update, context: ContextTypes.DEFAULT_TYPE):
    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, update.effective_chat.id)

        if not championship:
            await update.message.reply_text("❌ No hay campeonato registrado en este chat.")
            return

        text = f"🏆 *Campeonato vinculado:*\n{championship.championshipurl}\n\n"
        text += "👥 *Jugadores registrados:*\n"
        for user in championship.players:
            player_name = user.name or "👤"
            text += f"• {user.nickbga} → {player_name}\n"

        await update.message.reply_text(text)

async def enable_player_mentions(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text("No estás vinculado a ningún jugador.")
            return
        
        if player.notify:
            await update.message.reply_text("Las menciones para este jugador ya están activadas")
            return

        player.notify = True
        session.commit()

        await update.message.reply_text(f"Menciones activadas para ''{player.nickbga}''.")

async def disable_player_mentions(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id

    with get_session() as session:
        player = player_service.get_player_by_telegram_id(session, user_id)

        if not player:
            await update.message.reply_text("No estás vinculado a ningún jugador.")
            return
        
        if not player.notify:
            await update.message.reply_text("Las menciones para este jugador ya están desactivadas")
            return

        player.notify = False
        session.commit()

        await update.message.reply_text(f"Menciones desactivadas para ''{player.nickbga}''.")

async def enable_group_notifications(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = update.effective_chat.id
    message_lines = ["👋 Has solicitado activar las notificaciones del bot para este chat."]

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)

        if championship is None:
            message_lines.append("⚠️ No hay ningún campeonato vinculado a este chat.")
        else:
            if not championship.notify:
                championship.notify = True
                session.commit()
                message_lines.append("✅ Las notificaciones han sido activadas para este campeonato.")
            else:
                message_lines.append("ℹ️ Las notificaciones ya estaban activadas para este campeonato.")

    await update.message.reply_text(
        escape_markdown("\n".join(message_lines)),
        parse_mode="Markdown"
    )

async def disable_group_notifications(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = update.effective_chat.id
    message_lines = ["👋 Has solicitado detener las notificaciones del bot para este chat."]

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)

        if championship is None:
            message_lines.append("⚠️ No hay ningún campeonato vinculado a este chat. No hay nada que detener.")
        else:
            if not championship.notify:
                message_lines.append("🔕 Las notificaciones ya estaban *desactivadas* para este campeonato.")
            else:
                championship.notify = False
                session.commit()
                message_lines.append("✅ Las notificaciones han sido *desactivadas* para este campeonato.")

    await update.message.reply_text(
        escape_markdown("\n".join(message_lines)),
        parse_mode="Markdown"
    )

async def delete_championship(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = update.effective_chat.id

    with get_session() as session:
        championship = championship_service.get_championship_by_idchat(session, chat_id)
        if not championship:
            await update.message.reply_text("❌ No hay ningún campeonato vinculado a este grupo.")
            return
        championship_service.delete_championship(session, championship.idchampionship)
        session.commit()

    await update.message.reply_text("🗑️ El campeonato ha sido eliminado de este grupo.")