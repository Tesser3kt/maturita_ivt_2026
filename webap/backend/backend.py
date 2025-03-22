from flask import Flask, render_template, request, jsonify

from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import ForeignKey, Integer, String, Table, Column
from flask_sqlalchemy import SQLAlchemy
# from flask_marshmallow import Marshmallow
import sqlalchemy as sa
from sqlalchemy.orm import sessionmaker
from flaskext.mysql import MySQL
import pandas as pd
import numpy as np
import os


app = Flask(__name__)
mysql = MySQL()
mysql.init_app(app)
app.config["MYSQL_DATABASE_DB"] = 'tancing'
app.config["MYSQL_DATABASE_PASSWORD"] = 'jjachym'
app.config["MYSQL_DATABASE_USER"] = 'root'
app.config["MYSQL_DATABASE_HOST"] = 'localhost'

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://{username}:{password}@{server}/{name}".format(
    username=app.config["MYSQL_DATABASE_USER"],
    password=app.config["MYSQL_DATABASE_PASSWORD"],
    server=app.config["MYSQL_DATABASE_HOST"],
    name=app.config["MYSQL_DATABASE_DB"])

db = SQLAlchemy(app)


class Category():
    def __init__(self, cat_name: str):
        self.name = cat_name

    def check_valid(self):
        if self.name not in ["E", "D", "C", "B", "M"]:
            return False
        return True

    def requirements(self):
        if self.name == "E":
            return (200, 0)
        return (200, 5)


class Hodnoceni():
    def __init__(self, final: bool, hodnoceni: str):
        self.final = final
        self.hodnoceni = hodnoceni

    def check_valid(self):
        if len(self.hodnoceni) % 2 == 0:
            return False  # musi byt vzdy licho porotcu
        for value in self.hodnoceni:
            if not isinstance(value, int):
                return False  # kazda hodnota musi byt cislo
            if not self.final and int(value) not in [1, 0]:
                return False  # vsechno mimo finale musi byt binarni
        return True

    def evaluate(self):
        # count how succesfull we were in relative terms
        pass


souteze_porotci = Table(
    "souteze_porotci",
    db.metadata,
    Column("souteze_id", ForeignKey("souteze.id"), primary_key=True),
    Column("porotci_id", ForeignKey("porotci.id"), primary_key=True)
)


class Porotci(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(
        String(100), unique=True, nullable=False,)
    souteze = db.relationship('Souteze', secondary=souteze_porotci,
                              back_populates='porotci')


class Souteze(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    place: Mapped[str] = mapped_column(String(100), unique=False)
    category: Mapped[str] = mapped_column(
        String(100), nullable=False, unique=False)
    points: Mapped[int] = mapped_column(nullable=False, unique=False)
    finals: Mapped[int] = mapped_column(nullable=False, unique=False)
    porotci = db.relationship('Porotci', secondary=souteze_porotci,
                              back_populates='souteze')


class Vysledky(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    soutez_id: Mapped[int] = mapped_column(ForeignKey("souteze.id"))
    samba: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    chacha: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    jive: Mapped[str] = mapped_column(String(100), nullable=True, unique=False)
    rumba: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    paso: Mapped[str] = mapped_column(String(100), nullable=True, unique=False)
    round: Mapped[int] = mapped_column(
        String(100), unique=False, nullable=False)


@app.route('/api', methods=['GET'])
def create_main():
    porotci = Porotci.query.all()
    por_souteze = [por.souteze for por in porotci]
    nazvy = []
    for souteze in por_souteze:
        temp = []
        for sou in souteze:
            temp.append(Souteze.query.get(sou.id).place)
        nazvy.append(",".join(temp))
    return '\n'.join(nazvy)


@app.route('/api/addcomp', methods=['POST'])
def add_comp():
    # TODO  check if all the judges are already in the database and add the new ones
    porotci = request.porotci
    sou = Souteze(place=request.place, category=request.category,
                  points=request.points, finals=request.finals)
    for porotce in porotci:
        # TODO pridat kazeho porotce k teto souteze a naopak
        pass
    return request
