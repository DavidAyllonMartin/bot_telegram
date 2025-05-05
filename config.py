import logging
import os

BOT_TOKEN = os.getenv("BOT_HEAT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")

def setup_logging():
    logging.basicConfig(
        level=logging.WARNING,
        format='%(asctime)s [%(levelname)s] %(name)s: %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )
