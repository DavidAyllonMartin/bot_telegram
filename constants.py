from database import get_session
from service import app_config_service

class DatabaseConstant:
    SCHEDULER_INTERVAL_SECONDS = None

    @classmethod
    def load_constants(cls):
        with get_session() as session:
            cls.SCHEDULER_INTERVAL_SECONDS = app_config_service.get_config_value(session, 'SCHEDULER_INTERVAL_SECONDS', default=60, cast_type=int)

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

COMMAND_START = "start"
COMMAND_HELP = "ayuda"
COMMAND_CANCEL = "cancelar"
COMMAND_CHAMPIONSHIP_STATUS = "estado_campeonato"

COMMAND_ESTABLISH_URL = "establecer_url"
COMMAND_DELETE_CHAMPIONSHIP = "eliminar_campeonato"
COMMAND_ENABLE_GROUP_NOTIFICATIONS = "activar_notificaciones_grupo"
COMMAND_DISABLE_GROUP_NOTIFICATIONS = "desactivar_notificaciones_grupo"

COMMAND_LINK_PLAYER = "vincular_jugador"
COMMAND_UNLINK_PLAYER = "desvincular_jugador"

COMMAND_ENABLE_MENTIONS = "activar_menciones_personales"
COMMAND_DISABLE_MENTIONS = "desactivar_menciones_personales"

ASK_LINK = range(1)
