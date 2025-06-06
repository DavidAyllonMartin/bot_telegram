import json
from bs4 import BeautifulSoup
import requests
import asyncio
from telegram.constants import ParseMode
from database import get_session
from models.championship import Championship
from service import championship_service, player_service
import logging
from constants import (
    LOG_ERROR,
    LOG_JSON_DECODE_ERROR,
    LOG_JSON_MARKERS_NOT_FOUND,
    LOG_JSONS_NOT_FOUND
)

logger = logging.getLogger(__name__)

def get_current_players(championship: Championship):
    try:
        url = championship.championshipurl

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

        return active_players

    except Exception as e:
        logger.error(LOG_ERROR.format(error=e))
        return []

import asyncio
from telegram.constants import ParseMode
import logging

logger = logging.getLogger(__name__)

async def check_all_championship_turns(app):
    with get_session() as session:
        championships = championship_service.get_all_championships(session)
        championship_ids = [c.idchampionship for c in championships]

    async def process_championship(championship_id):
        try:
            with get_session() as session:
                championship = championship_service.get_championship_by_id(session, championship_id)

                if not championship.notify:
                    return

                active_players = get_current_players(championship)

                if not active_players:
                    return

                async def send_message(text):
                    send_kwargs = {
                        "chat_id": championship.idchat,
                        "text": text,
                        "parse_mode": ParseMode.HTML,
                    }
                    if championship.idtopic:
                        send_kwargs["message_thread_id"] = championship.idtopic
                    await app.bot.send_message(**send_kwargs)

                if len(active_players) == 1:
                    player = active_players[0]

                    if player == championship.lastplayer:
                        return

                    text = f"🎲 ¡Turno de {format_player_link(player)}!"

                    championship.lastplayer = player
                    session.commit()

                    await send_message(text)

                else:
                    player = player_service.get_player_by_nickbga(session, "ALL_PLAYERS")

                    if player == championship.lastplayer:
                        return

                    formatted_nicks = format_player_list(active_players)
                    text = f"🎲 ¡Turno de {formatted_nicks}!"

                    championship.lastplayer = player
                    session.commit()

                    await send_message(text)

        except Exception as e:
            logger.error(f"[ERROR procesando campeonato ID {championship_id}]: {e}")

    await asyncio.gather(*(process_championship(cid) for cid in championship_ids))


def get_html(url):
    try:
        response = requests.get(url)
        response.raise_for_status()
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
    
def get_championship_url(table_code: str) -> str | None:
    try:
        url = f"https://boardgamearena.com/heat?table={table_code}"
        response = requests.get(url)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, 'html.parser')

        view_end_btn = soup.find(id="view_end_btn")

        if view_end_btn and view_end_btn.has_attr('href'):
            href = view_end_btn['href']
            return f"https://boardgamearena.com{href}"
        else:
            return None
    except Exception as e:
        logger.error(f"No se pudo obtener la URL del campeonato: {e}")
        return None
