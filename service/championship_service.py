from sqlalchemy.orm import Session, joinedload
from sqlalchemy.exc import SQLAlchemyError
from models import Championship

def save_championship(session: Session, champ_data: dict):
    champ_id = champ_data.get("idchampionship")

    try:
        if champ_id:
            champ = session.query(Championship).filter(Championship.idchampionship == champ_id).first()
            if champ:
                for key, value in champ_data.items():
                    setattr(champ, key, value)
            else:
                champ = Championship(**champ_data)
                session.add(champ)
        else:
            champ = Championship(**champ_data)
            session.add(champ)

        session.flush()
        session.commit()
        session.refresh(champ)
        return champ

    except SQLAlchemyError as e:
        session.rollback()
        raise e


def get_all_championships(session: Session):
    return session.query(Championship).options(joinedload(Championship.lastplayer)).all()


def get_championship_by_id(session: Session, champ_id: int):
    return session.query(Championship).options(joinedload(Championship.lastplayer)).filter(
        Championship.idchampionship == champ_id
    ).first()


def get_championship_by_idchat(session: Session, idchat: int):
    return session.query(Championship).options(joinedload(Championship.players)).filter(
        Championship.idchat == idchat
    ).first()

def get_championship_by_idchat_and_idtopic(session: Session, idchat: int, idtopic: int):
    return session.query(Championship).options(joinedload(Championship.players)).filter(
        Championship.idchat == idchat,
        Championship.idtopic == idtopic
    ).first()

def delete_championship(session: Session, champ_id: int):
    champ = get_championship_by_id(session, champ_id)
    if not champ:
        return False
    try:
        session.delete(champ)
        session.commit()
        return True
    except SQLAlchemyError:
        session.rollback()
        return False