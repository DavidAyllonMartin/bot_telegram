import logging
import asyncio
from telegram.ext import (ApplicationBuilder, CommandHandler, CallbackQueryHandler, ConversationHandler, MessageHandler, filters)
from apscheduler.schedulers.background import BackgroundScheduler
from bot import (CONFIRM_ADD, championship_status, confirm_add_championship, disable_group_notifications, enable_group_notifications, help_command, link_player, start_command, unlink_player, link_buttons_handler, start_setlink, receive_link, cancel, enable_player_mentions, disable_player_mentions, delete_championship)
from service import bga_service
from config import BOT_TOKEN, setup_logging
from constants import *
from telegram import BotCommand

commands = [
    BotCommand(COMMAND_START, "Inicia la interacción con el bot"),
    BotCommand(COMMAND_HELP, "Muestra la ayuda con todos los comandos"),
    BotCommand(COMMAND_ESTABLISH_URL, "Vincula la URL del campeonato al grupo"),
    BotCommand(COMMAND_DELETE_CHAMPIONSHIP, "Elimina la URL del campeonato vinculada"),
    BotCommand(COMMAND_CHAMPIONSHIP_STATUS, "Muestra el estado del campeonato"),
    BotCommand(COMMAND_ENABLE_GROUP_NOTIFICATIONS, "Activa notificaciones del campeonato"),
    BotCommand(COMMAND_DISABLE_GROUP_NOTIFICATIONS, "Desactiva notificaciones del campeonato"),
    BotCommand(COMMAND_LINK_PLAYER, "Vincula tu usuario con tu nick de BGA"),
    BotCommand(COMMAND_UNLINK_PLAYER, "Desvincula tu usuario de tu nick de BGA"),
    BotCommand(COMMAND_ENABLE_MENTIONS, "Activa menciones cuando te toque jugar"),
    BotCommand(COMMAND_DISABLE_MENTIONS, "Desactiva menciones cuando te toque"),
]

async def set_bot_commands(app):
    await app.bot.set_my_commands(commands)

logger = logging.getLogger(__name__)

def main():
    DatabaseConstant.load_constants()
    setup_logging()

    app = ApplicationBuilder().token(BOT_TOKEN).build()

    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)

    loop.run_until_complete(set_bot_commands(app))

    conv_setlink = ConversationHandler(
        entry_points=[CommandHandler(COMMAND_ESTABLISH_URL, start_setlink)],
        states={
            ASK_LINK: [MessageHandler(filters.TEXT & ~filters.COMMAND, receive_link)],
            CONFIRM_ADD: [CallbackQueryHandler(confirm_add_championship)]
        },
        fallbacks=[CommandHandler(COMMAND_CANCEL, cancel)],
    )

    app.add_handler(CommandHandler(COMMAND_START, start_command))
    app.add_handler(CommandHandler(COMMAND_HELP, help_command))
    app.add_handler(CommandHandler(COMMAND_LINK_PLAYER, link_player))
    app.add_handler(CommandHandler(COMMAND_UNLINK_PLAYER, unlink_player))
    app.add_handler(CommandHandler(COMMAND_CHAMPIONSHIP_STATUS, championship_status))
    app.add_handler(CommandHandler(COMMAND_ENABLE_MENTIONS, enable_player_mentions))
    app.add_handler(CommandHandler(COMMAND_DISABLE_MENTIONS, disable_player_mentions))
    app.add_handler(CommandHandler(COMMAND_ENABLE_GROUP_NOTIFICATIONS, enable_group_notifications))
    app.add_handler(CommandHandler(COMMAND_DISABLE_GROUP_NOTIFICATIONS, disable_group_notifications))
    app.add_handler(CommandHandler(COMMAND_DELETE_CHAMPIONSHIP, delete_championship))
    app.add_handler(CallbackQueryHandler(link_buttons_handler))
    app.add_handler(conv_setlink)

    scheduler = BackgroundScheduler()

    def run_check_turns():
        try:
            loop.call_soon_threadsafe(
                asyncio.create_task, bga_service.check_all_championship_turns(app)
            )
        except Exception as e:
            logger.error(LOG_SCHEDULER_ERROR.format(error=e))

    scheduler.add_job(run_check_turns, "interval", seconds=DatabaseConstant.SCHEDULER_INTERVAL_SECONDS)
    scheduler.start()

    logger.info(LOG_BOT_RUNNING)
    app.run_polling()

if __name__ == "__main__":
    main()
