from sqlalchemy import Column, Integer, BigInteger, String, Boolean
from sqlalchemy.orm import relationship
from .base import Base
from .association import player_championship

class Player(Base):
    __tablename__ = 'player'

    idplayer = Column(Integer, primary_key=True, autoincrement=True)
    idtelegram = Column(BigInteger)
    idbga = Column(BigInteger)
    nickbga = Column(String(255), unique=True)
    name = Column(String(255))
    notify = Column(Boolean, default=True)

    championships = relationship('Championship', secondary=player_championship, back_populates='players')