import logging
import asyncio
from telegram.ext import (ApplicationBuilder, CommandHandler, CallbackQueryHandler, ConversationHandler, MessageHandler, filters)
from apscheduler.schedulers.background import BackgroundScheduler
from bot import (status, link_player, unlink_player, link_buttons_handler, start_setlink, receive_link, cancel, activate_notifications, deactivate_notifications, delete_championship)
from service import bga_service
from config import BOT_TOKEN, setup_logging
from constants import *

logger = logging.getLogger(__name__)

def main():
    DatabaseConstant.load_constants()
    setup_logging()

    app = ApplicationBuilder().token(BOT_TOKEN).build()

    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)

    conv_setlink = ConversationHandler(
        entry_points=[CommandHandler(COMMAND_ESTABLISH_URL, start_setlink)],
        states={ASK_LINK: [MessageHandler(filters.TEXT & ~filters.COMMAND, receive_link)]},
        fallbacks=[CommandHandler(COMMAND_CANCEL, cancel)],
    )

    app.add_handler(CommandHandler(COMMAND_LINK_PLAYER, link_player))
    app.add_handler(CommandHandler(COMMAND_UNLINK_PLAYER, unlink_player))
    app.add_handler(CommandHandler(COMMAND_STATUS, status))
    app.add_handler(CommandHandler(COMMAND_ACTIVATE_NOTIFICATIONS, activate_notifications))
    app.add_handler(CommandHandler(COMMAND_DEACTIVATE_NOTIFICATIONS, deactivate_notifications))
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
