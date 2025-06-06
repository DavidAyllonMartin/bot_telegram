from sqlalchemy import Boolean, Column, Integer, BigInteger, String, TIMESTAMP, ForeignKey, event
from sqlalchemy.orm import relationship
from datetime import datetime, timezone
from .base import Base
from .association import player_championship

class Championship(Base):
    __tablename__ = 'championship'

    idchampionship = Column(Integer, primary_key=True, autoincrement=True)
    idchat = Column(BigInteger)
    idtopic = Column(BigInteger, nullable=True)
    championshipurl = Column(String(255))
    notify = Column(Boolean, default=True)


    lastplayer_id = Column(Integer, ForeignKey('player.idplayer'), nullable=True)
    lastplayer = relationship('Player', foreign_keys=[lastplayer_id])

    lastupdated = Column(TIMESTAMP(timezone=True))

    players = relationship('Player', secondary=player_championship, back_populates='championships')

@event.listens_for(Championship, 'before_insert')
def set_lastupdated_on_insert(mapper, connection, target):
    target.lastupdated = datetime.now(timezone.utc)

@event.listens_for(Championship, 'before_update')
def set_lastupdated_on_update(mapper, connection, target):
    target.lastupdated = datetime.now(timezone.utc)