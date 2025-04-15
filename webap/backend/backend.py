from flask import Flask, request, jsonify

# from datetime import date --- tohle asi neni potreba ale mozna nekdy bude pro
# date sloupec v tabulce souteze.

from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import ForeignKey, Integer, String, Table, Column, Date
from flask_sqlalchemy import SQLAlchemy
# from flask_marshmallow import Marshmallow
import sqlalchemy as sa
from sqlalchemy.orm import sessionmaker
from flaskext.mysql import MySQL
from flask_cors import CORS

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
CORS(app)


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
    date = mapped_column(Date, nullable=False, unique=True)
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


@app.route('/api/addjudge', methods=["POST"])
def add_judge():
    data = request.get_json()
    name = data.get('name')

    print(name)
    por = Porotci(name=name)
    db.session.add(por)
    db.session.commit()
    print('pridal jsem tam jednoho zmrda')
    return jsonify({
        "message": "Data inserted successfully!",
        "data": {"name": "miluju prdeni"}
    })


@app.route('/api/getjudge', methods=['GET'])
def get_judge():
    judge_name = request.args.get('name')
    print(judge_name)
    select = db.select(Porotci).filter_by(name=judge_name)
    judge = db.session.execute(select).first()
    print(judge)
    judge = judge[0]
    print(judge)
    if judge:
        return jsonify({
            'id': judge.id,
            'name': judge.name,
        })
    else:
        return jsonify({'message': 'koule pero'})


@app.route('/api/addcompetition', methods=["POST"])
def add_competition():
    data = request.get_json()
    if not data['category']:
        data['category'] = 'E'

    if data['finals'] == '1':
        data['finals'] = int(data['finals'])
    else:
        data['finals'] = 0

    comp = Souteze(place=data['place'], category=data['category'],
                   points=data['points'], finals=data['finals'], date=data['date'])
    db.session.add(comp)
    db.session.commit()
    print(comp.id)
    return jsonify({"message": "Jupí pridal jsi novou soutez", 'id': comp.id})


@app.route('/api/linkjudges', methods=['POST'])
def link_judges():
    data = request.get_json()
    judge_names = data['names']
    comp_id = data['id']

    # finding all the judges and the comp in the database
    judges = [Porotci.query.filter_by(name=name).first()
              for name in judge_names]
    comp = db.session.get(Souteze, comp_id)

    # linking them together
    comp.porotci.extend(judges)
    db.session.commit()
    return jsonify({'message': 'koule pero'})


@app.route('/api/addvysledky', methods=['POST'])
def add_vysledky():
    data = request.get_json()
    print(data)
    return jsonify({'message': 'koule pero'})


@app.route('/api/allcomppoints', methods=['GET'])
def all_comps_points():
    comps = Souteze.query.all()
    sorted_comps = sorted(comps, key=lambda x: x.date)
    formating = [{'x': index, 'y': comp.points}
                 for index, comp in enumerate(sorted_comps)]

    # the last competition of the same category
    new_cat_comps = []
    for i in range(1, len(sorted_comps)):
        if sorted_comps[i-1].category != sorted_comps[i].category:
            new_cat_comps.append(i-1)
    if sorted_comps[-1].category != sorted_comps[-2]:
        new_cat_comps.append(len(sorted_comps)-1)

    categories = ['E', 'D', 'C', 'B', 'A']
    lines = [{'x': time, 'label': categories[index]} for index, time in
             enumerate(new_cat_comps)]

    data = jsonify({'data': formating, 'lines': lines})
    return data


@app.route('/api/allcomps', methods=['GET'])
def all_comps():
    comps = Souteze.query.all()
    print(comps)
    sorted_comps = sorted(comps, key=lambda x: x.date)
    return jsonify({'data': sorted_comps})


@app.route('/api/alljudges', methods=['GET'])
def all_judges():
    judges = Porotci.query.all()
    judges = [judge.name for judge in judges]
    return jsonify({'names': judges, 'message': 'koule pero smrdis'})
