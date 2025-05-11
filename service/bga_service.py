import json
import requests
import asyncio
from telegram.constants import ParseMode
from database import get_session
from models.championship import Championship
from service import championship_service, player_service
import logging
from constants import (
    LOG_ERROR,
    LOG_HTML_RETRIEVED,
    LOG_JSON_DECODE_ERROR,
    LOG_JSON_EXTRACTION_START,
    LOG_JSON_MARKERS_NOT_FOUND,
    LOG_JSONS_NOT_FOUND,
    LOG_NEW_TURN,
    LOG_TURN_PLAYER,
    DatabaseConstant,
    LOG_LOADING_URL,
)

logger = logging.getLogger(__name__)

def get_current_players(championship: Championship):
    try:
        url = championship.championshipurl
        logger.info(LOG_LOADING_URL.format(url=url))

        setup_json = extract_setup_json_from_url(url)
        if not setup_json:
            return []
        
        gamestate = setup_json.get("gamestate", {})
        multiactive_ids = gamestate.get("multiactive", None)
        
        if multiactive_ids is not None:
            active_ids = [int(pid) for pid in multiactive_ids]
        else:
            active_player = gamestate.get("active_player")
            active_ids = [int(active_player)] if active_player else []

        logger.info(f"Jugadores activos: {active_ids}")

        active_players = [
            player for player in championship.players if player.idbga in active_ids
        ]

        for player in active_players:
            logger.info(LOG_TURN_PLAYER.format(player_name=player.nickbga))

        return active_players

    except Exception as e:
        logger.error(LOG_ERROR.format(error=e))
        return []


async def check_all_championship_turns(app):
    with get_session() as session:
        championships = championship_service.get_all_championships(session)
        championship_ids = [c.idchampionship for c in championships]

    async def process_championship(championship_id):
        try:
            with get_session() as session:
                championship = championship_service.get_championship_by_id(session, championship_id)

                active_players = get_current_players(championship)

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
                    
                    formatted_nicks = format_player_list(active_players)

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

def extract_setup_json_from_url(url):
    html_content = get_html(url)
    if html_content:
        extracted_str = extract_str_json_raw(html_content)
        if extracted_str:
            json_strings = extract_jsons(extracted_str)
            if len(json_strings) > 1:
                json_object = transform_json(json_strings[1])
                return json_object
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
    
def format_player_list(players):
    names = [format_player_link(player) for player in players]
    if len(names) == 0:
        return ""
    elif len(names) == 1:
        return names[0]
    elif len(names) == 2:
        return f"{names[0]} y {names[1]}"
    else:
        return f"{', '.join(names[:-1])} y {names[-1]}"
