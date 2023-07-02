from datetime import timedelta

class Config():
    DEBUG: bool = True
    SECRET_KEY: str = 'key'
    DEBUF: bool = True
    JSON_AS_ASCII: bool = False
    SQLALCHEMY_TRACK_MODIFICATIONS: bool = True
    SQLALCHEMY_DATABASE_URI: str = 'sqlite:///database.db'
