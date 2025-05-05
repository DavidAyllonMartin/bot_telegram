from sqlalchemy.orm import Session
from models import AppConfig
from sqlalchemy.exc import SQLAlchemyError


def get_config_value(session: Session, key: str, default=None, cast_type=str):
    entry = session.query(AppConfig).filter_by(key=key).first()
    if not entry:
        return default
    try:
        return cast_type(entry.value)
    except (ValueError, TypeError):
        return default


def set_config_value(session: Session, key: str, value):
    value_str = str(value)
    try:
        entry = session.query(AppConfig).filter_by(key=key).first()
        if entry:
            entry.value = value_str
        else:
            entry = AppConfig(key=key, value=value_str)
            session.add(entry)
        session.commit()
        return entry
    except SQLAlchemyError as e:
        session.rollback()
        raise e


def delete_config_value(session: Session, key: str):
    entry = session.query(AppConfig).filter_by(key=key).first()
    if not entry:
        return False
    try:
        session.delete(entry)
        session.commit()
        return True
    except SQLAlchemyError:
        session.rollback()
        return False


def get_all_config(session: Session):
    return session.query(AppConfig).all()
