from sqlalchemy import Table, Column, Integer, ForeignKey
from .base import Base

player_championship = Table(
    'player_championship',
    Base.metadata,
    Column('player_id', Integer, ForeignKey('player.idplayer', ondelete='CASCADE'), primary_key=True),
    Column('championship_id', Integer, ForeignKey('championship.idchampionship', ondelete='CASCADE'), primary_key=True)
)