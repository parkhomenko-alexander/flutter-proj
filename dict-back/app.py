from flask import Flask
from config import Config

from models.setup import db, Base 
from models.models import *

from flask_sqlalchemy import SQLAlchemy 

def create_app() -> Flask:
    app = Flask(__name__)
    app.config.from_object(Config)

    db_init(app, db)
    
    register_bluerptins(app)
    return app


def db_init(app: Flask, db: SQLAlchemy):
    db.init_app(app)
    with app.app_context():
        Base.metadata.create_all(bind=db.engine)
        db.create_all()

def register_bluerptins(app: Flask):
    from blueprints.dict.dict_api import dict_api
    app.register_blueprint(dict_api)
    pass

