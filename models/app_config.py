from sqlalchemy import Column, String
from .base import Base

class AppConfig(Base):
    __tablename__ = 'app_config'

    key = Column(String(100), primary_key=True)
    value = Column(String(255))
