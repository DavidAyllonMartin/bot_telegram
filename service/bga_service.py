import json
import requests
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import asyncio
from telegram.constants import ParseMode
from database import get_session
from models.championship import Championship
from service import championship_service, player_service, bga_service
import logging
from constants import LOG_DRIVER_CREATION_SUCCESS, LOG_ERROR, LOG_GAME_STATUS, LOG_HTML_RETRIEVED, LOG_JSON_DECODE_ERROR, LOG_JSON_EXTRACTION_START, LOG_JSON_MARKERS_NOT_FOUND, LOG_JSONS_NOT_FOUND, LOG_NEW_TURN, LOG_TURN_PLAYER, DatabaseConstant, LOG_LOADING_URL

logger = logging.getLogger(__name__)

def get_current_players(championship: Championship):
    driver = bga_service.create_driver()
    try:
        logger.info(LOG_LOADING_URL.format(url=championship.championshipurl))
        driver.get(championship.championshipurl)

        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "player_boards"))
        )

        active_players = []

        for player in championship.players:
            idbga = player.idbga
            element_id = f"avatar_active_wrap_{idbga}"
            try:
                emblem_element = driver.find_element(By.ID, element_id)
                style = emblem_element.get_attribute("style")
                if "none" not in style:
                    logger.info(LOG_TURN_PLAYER.format(player_name=player.name))
                    active_players.append(player)
            except Exception as e:
                logger.warning(f"No se encontró el elemento con id {element_id}: {e}")

        return active_players

    except Exception as e:
        logger.error(LOG_ERROR.format(error=e))
        return []
    finally:
        driver.quit()

async def check_all_championship_turns(app):
    with get_session() as session:
        championships = championship_service.get_all_championships(session)
        championship_ids = [c.idchampionship for c in championships]

    async def process_championship(championship_id):
        try:
            with get_session() as session:
                championship = championship_service.get_championship_by_id(session, championship_id)

                active_players = bga_service.get_current_players(championship)

                if not active_players:
                    return

                elif len(active_players) == 1:
                    player = active_players[0]

                    if player == championship.lastplayer:
                        return

                    logger.info(LOG_NEW_TURN.format(championship_url=championship.championshipurl, nick=player.nickbga))
            
                    text = DatabaseConstant.TURN_NOTIFICATION.format(nick=format_player_link(player))

                    championship.lastplayer = player
                    session.commit()

                    await app.bot.send_message(
                    chat_id=championship.idchat,
                    text=text,
                    parse_mode=ParseMode.HTML
                    )

                else:
                    player = player_service.get_player_by_nickbga(session, "ALL_PLAYERS")

                    if player == championship.lastplayer:
                        return
                    
                    formatted_nicks = ' '.join(format_player_link(player) for player in active_players)

                    text = DatabaseConstant.TURN_NOTIFICATION.format(nick=formatted_nicks)

                    championship.lastplayer = player
                    session.commit()

                    await app.bot.send_message(
                        chat_id=championship.idchat,
                        text=text,
                        parse_mode=ParseMode.HTML
                    )

        except Exception as e:
            logger.error(f"[ERROR procesando campeonato ID {championship_id}]: {e}")

    await asyncio.gather(*(process_championship(cid) for cid in championship_ids))

def extract_json_from_url(url):
    html_content = get_html(url)
    if html_content:
        extracted_str = extract_str_json_raw(html_content)
        if extracted_str:
            json_strings = extract_jsons(extracted_str)
            json_object = transform_json(json_strings[1])
            return json_object
    return None

def create_driver():
    options = Options()
    options.add_argument("--headless")
    options.add_argument("--disable-gpu")
    options.add_argument("--no-sandbox")
    options.add_argument("--window-size=1920x1080")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--log-level=3")

    try:
        driver = webdriver.Chrome(options=options)
        logger.info(LOG_DRIVER_CREATION_SUCCESS)
        return driver
    except Exception as e:
        logger.error(LOG_ERROR.format(error=e))
        raise

def get_html(url):
    try:
        logger.info(f"📡 Obteniendo HTML de {url}")
        response = requests.get(url)
        response.raise_for_status()
        logger.info(LOG_HTML_RETRIEVED.format(url=url))
        return response.text
    except requests.exceptions.RequestException as e:
        logger.error(f"Error fetching the page: {e}")
        return None

def extract_str_json_raw(html):
    start = html.find('gameui.completesetup')
    end = html.find('gameui.setGroupList', start)

    if start == -1 or end == -1:
        logger.warning(LOG_JSON_MARKERS_NOT_FOUND)
        return ''

    logger.info(LOG_JSON_EXTRACTION_START)
    return html[start + len('gameui.completesetup'):end]

def extract_jsons(s):
    results = []
    balance = 0
    start = -1

    for i, char in enumerate(s):
        if char == '{':
            if balance == 0:
                start = i
            balance += 1
        elif char == '}':
            balance -= 1
            if balance == 0:
                results.append(s[start:i + 1])

    if not results:
        logger.warning(LOG_JSONS_NOT_FOUND)
    return results

def transform_json(json_str):
    try:
        logger.info("🔄 Transformando JSON.")
        return json.loads(json_str)
    except json.JSONDecodeError as e:
        logger.error(LOG_JSON_DECODE_ERROR.format(error=e))
        return None
    
from urllib.parse import urlparse

def is_valid_url(url: str) -> bool:
    parsed_url = urlparse(url)

    if not parsed_url.netloc.endswith('boardgamearena.com'):
        return False

    if 'heat' not in parsed_url.path.lower():
        return False

    if 'table=' not in parsed_url.query.lower():
        return False

    return True

def format_player_link(player) -> str:
    if not player.idtelegram or not player.notify:
        return player.nickbga
    else:
        return f"<a href='tg://user?id={player.idtelegram}'>{player.nickbga}</a>"
