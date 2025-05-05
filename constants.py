from database import get_session
from service import app_config_service

class DatabaseConstant:
    SCHEDULER_INTERVAL_SECONDS = None
    LINK_ALREADY_REGISTERED = None
    NO_CHAMPIONSHIP_FOUND = None
    ALL_PLAYERS_LINKED = None
    ASK_WHICH_PLAYER = None
    CANCEL_OPERATION = None
    PLAYER_NOT_FOUND = None
    THANKS_REGISTERED = None
    NOT_LINKED = None
    UNLINKED_SUCCESS = None
    ASK_CHAMP_URL = None
    INVALID_URL = None
    URL_ALREADY_USED = None
    CHAMP_URL_SAVED = None
    NOTIFICATIONS_ON = None
    NOTIFICATIONS_OFF = None
    NO_CAMPAIGN_REGISTERED = None
    CAMPAIGN_HEADER = None
    PLAYER_LIST_HEADER = None
    PLAYER_LINE = None
    TURN_NOTIFICATION = None
    TURN_NOTIFICATION_WITH_LINK = None

    @classmethod
    def load_constants(cls):
        with get_session() as session:
            cls.SCHEDULER_INTERVAL_SECONDS = app_config_service.get_config_value(session, 'SCHEDULER_INTERVAL_SECONDS', default=60, cast_type=int)
            cls.LINK_ALREADY_REGISTERED = app_config_service.get_config_value(session, 'LINK_ALREADY_REGISTERED')
            cls.NO_CHAMPIONSHIP_FOUND = app_config_service.get_config_value(session, 'NO_CHAMPIONSHIP_FOUND')
            cls.ALL_PLAYERS_LINKED = app_config_service.get_config_value(session, 'ALL_PLAYERS_LINKED')
            cls.ASK_WHICH_PLAYER = app_config_service.get_config_value(session, 'ASK_WHICH_PLAYER')
            cls.CANCEL_OPERATION = app_config_service.get_config_value(session, 'CANCEL_OPERATION')
            cls.PLAYER_NOT_FOUND = app_config_service.get_config_value(session, 'PLAYER_NOT_FOUND')
            cls.THANKS_REGISTERED = app_config_service.get_config_value(session, 'THANKS_REGISTERED')
            cls.NOT_LINKED = app_config_service.get_config_value(session, 'NOT_LINKED')
            cls.UNLINKED_SUCCESS = app_config_service.get_config_value(session, 'UNLINKED_SUCCESS')
            cls.ASK_CHAMP_URL = app_config_service.get_config_value(session, 'ASK_CHAMP_URL')
            cls.INVALID_URL = app_config_service.get_config_value(session, 'INVALID_URL')
            cls.URL_ALREADY_USED = app_config_service.get_config_value(session, 'URL_ALREADY_USED')
            cls.CHAMP_URL_SAVED = app_config_service.get_config_value(session, 'CHAMP_URL_SAVED')
            cls.NOTIFICATIONS_ON = app_config_service.get_config_value(session, 'NOTIFICATIONS_ON')
            cls.NOTIFICATIONS_OFF = app_config_service.get_config_value(session, 'NOTIFICATIONS_OFF')
            cls.NO_CAMPAIGN_REGISTERED = app_config_service.get_config_value(session, 'NO_CAMPAIGN_REGISTERED')
            cls.CAMPAIGN_HEADER = app_config_service.get_config_value(session, 'CAMPAIGN_HEADER')
            cls.PLAYER_LIST_HEADER = app_config_service.get_config_value(session, 'PLAYER_LIST_HEADER')
            cls.PLAYER_LINE = app_config_service.get_config_value(session, 'PLAYER_LINE')
            cls.TURN_NOTIFICATION = app_config_service.get_config_value(session, 'TURN_NOTIFICATION')
            cls.TURN_NOTIFICATION_WITH_LINK = app_config_service.get_config_value(session, 'TURN_NOTIFICATION_WITH_LINK')

LOG_LOADING_URL = "🌐 Cargando: {url}"
LOG_TURN_PLAYER = "🎯 Le toca jugar a: {player_name}"
LOG_GAME_STATUS = "⌛ Estado de la partida: {status_message}"
LOG_ERROR = "[ERROR]: {error}"
LOG_NEW_TURN = "Nuevo turno en {championship_url}: {nick}"
LOG_DRIVER_CREATION_SUCCESS = "🚗 Driver creado exitosamente."
LOG_HTML_RETRIEVED = "🔽 HTML obtenido exitosamente de {url}"
LOG_JSON_EXTRACTION_START = "📝 Extrayendo JSON crudo."
LOG_JSON_DECODE_ERROR = "Error convirtiendo el JSON: {error}"
LOG_JSONS_NOT_FOUND = "No se encontraron JSONs en el string."
LOG_JSON_MARKERS_NOT_FOUND = "No se encontraron los marcadores esperados para extraer JSON."

LOG_BOT_RUNNING = "🤖 Bot corriendo..."
LOG_SCHEDULER_ERROR = "[Scheduler error]: {error}"

COMMAND_ESTABLISH_URL = "establecer_url"
COMMAND_LINK_PLAYER = "vincular_jugador"
COMMAND_UNLINK_PLAYER = "desvincular_jugador"
COMMAND_STATUS = "estado"
COMMAND_ACTIVATE_NOTIFICATIONS = "activar_notificaciones"
COMMAND_DEACTIVATE_NOTIFICATIONS = "desactivar_notificaciones"
COMMAND_CANCEL = "cancelar"
COMMAND_DELETE_CHAMPIONSHIP = "eliminar_campeonato"

ASK_LINK = range(1)
