from flask_sqlalchemy import SQLAlchemy
from flaskext.mysql import MySQL
from flask_cors import CORS

db = SQLAlchemy()


def setup_access(app):
    app.config["MYSQL_DATABASE_DB"] = 'tancing'
    app.config["MYSQL_DATABASE_PASSWORD"] = 'jjachym'
    app.config["MYSQL_DATABASE_USER"] = 'root'
    app.config["MYSQL_DATABASE_HOST"] = 'localhost'

    app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://{username}:{password}@{server}/{name}".format(
        username=app.config["MYSQL_DATABASE_USER"],
        password=app.config["MYSQL_DATABASE_PASSWORD"],
        server=app.config["MYSQL_DATABASE_HOST"],
        name=app.config["MYSQL_DATABASE_DB"])
    CORS(app)

    mysql = MySQL()
    mysql.init_app(app)
    db.init_app(app)
