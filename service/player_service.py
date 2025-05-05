from sqlalchemy.orm import Session
from models import Player
from sqlalchemy.exc import SQLAlchemyError


def save_player(session: Session, player_data: dict):
    player_id = player_data.get("idplayer")

    try:
        if player_id:
            player = session.query(Player).filter(Player.idplayer == player_id).first()
            if player:
                for key, value in player_data.items():
                    setattr(player, key, value)
            else:
                player = Player(**player_data)
                session.add(player)
        else:
            player = Player(**player_data)
            session.add(player)

        session.flush()
        session.commit()
        return player

    except SQLAlchemyError as e:
        session.rollback()
        raise e


def get_all_players(session: Session):
    return session.query(Player).all()


def get_player_by_id(session: Session, player_id: int):
    return session.query(Player).filter(Player.idplayer == player_id).first()


def get_player_by_nickbga(session: Session, nickbga: str):
    return session.query(Player).filter(Player.nickbga == nickbga).first()


def get_player_by_telegram_id(session: Session, telegram_id: int):
    return session.query(Player).filter(Player.idtelegram == telegram_id).first()


def delete_player(session: Session, player_id: int):
    player = get_player_by_id(session, player_id)
    if not player:
        return False
    try:
        session.delete(player)
        session.commit()
        return True
    except SQLAlchemyError:
        session.rollback()
        return False