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


class Souteze(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    place: Mapped[str] = mapped_column(String(100), unique=False)
    category: Mapped[str] = mapped_column(
        String(100), nullable=False, unique=False)
    points: Mapped[int] = mapped_column(nullable=False, unique=False)
    finals: Mapped[int] = mapped_column(nullable=False, unique=False)
    date = mapped_column(Date, nullable=False, unique=True)
    umisteni: Mapped[int] = mapped_column(unique=False, nullable=False)
    pary: Mapped[int] = mapped_column(unique=False, nullable=False)
    porotci = db.relationship(
        'Porotci', secondary='souteze_porotci', back_populates='souteze')


class Porotci(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(
        String(100), unique=True, nullable=False,)
    souteze = db.relationship(
        'Souteze', secondary='souteze_porotci', back_populates='porotci')


class SoutezePorotci(db.Model):
    __tablename__ = "souteze_porotci"
    souteze_id = db.Column(db.Integer, db.ForeignKey(
        "souteze.id"), primary_key=True)
    porotci_id = db.Column(db.Integer, db.ForeignKey(
        "porotci.id"), primary_key=True)
    porotce_index = db.Column(db.Integer, nullable=False)

    # SoutezePorotci.soutez = db.relationship(
    # "Souteze", back_populates="souteze_porotci")
    # SoutezePorotci.porotce = db.relationship(
    # "Porotci", back_populates="souteze_porotci")


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

    def get_dances(self) -> list:
        dances = ['samba', 'chacha', 'jive']
        if self.rumba:
            dances.append('rumba')
        if self.paso:
            dances.append('paso')
        return dances

    # with app.app_context():
    # db.drop_all()
    # db.create_all()


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
                   points=data['points'], finals=data['finals'],
                   date=data['date'], umisteni=int(data['umisteni']), pary=int(data['pary']))
    db.session.add(comp)
    db.session.commit()
    print(comp.id)
    return jsonify({"message": "Jupí pridal jsi novou soutez", 'id': comp.id})


@app.route('/api/linkjudges', methods=['POST'])
def link_judges():
    data = request.get_json()
    judge_names = data['names']
    comp_id = data['id']
    print(judge_names)

    # finding all the judges and the comp in the database
    judges = [Porotci.query.filter_by(name=name).first()
              for name in judge_names]
    print(judges)
    comp = db.session.get(Souteze, comp_id)

    # linking them together
    for index, judge in enumerate(judges):
        link = SoutezePorotci(
            souteze_id=comp.id,
            porotci_id=judge.id,
            porotce_index=index
        )
        db.session.add(link)
    db.session.commit()
    return jsonify({'message': 'pridal jsem tam nejaky soudce'})


@app.route('/api/addvysledky', methods=['POST'])
def add_vysledky():
    data = request.get_json()
    datas = data['data']
    print(datas)
    fin = False  # if there exist a final
    try:
        finals = data['finals']
        datas.append(finals)
        fin = True
    except:
        pass
    id = int(data['id'])
    category = data['category']

    for i, dato in enumerate(datas):
        if i == len(datas)-1 and fin:
            index = 'final'
        else:
            index = str(i+1)
        if category == 'E':
            vysledky = Vysledky(soutez_id=id, samba=dato['Samba'],
                                chacha=dato['Chacha'],
                                jive=dato['Jive'], round=index)
        elif category == 'D':
            vysledky = Vysledky(soutez_id=id, samba=dato['Samba'],
                                chacha=dato['Chacha'],
                                jive=dato['Jive'], rumba=dato['Rumba'],
                                round=index)
        elif category in ['C', 'B', 'A']:
            vysledky = Vysledky(soutez_id=id, samba=dato['Samba'],
                                chacha=dato['Chacha'],
                                jive=dato['Jive'], rumba=dato['Rumba'],
                                paso=dato['Paso Doble'], round=index)

        db.session.add(vysledky)

    db.session.commit()
    return jsonify({'message': 'koule pero'})


@app.route('/api/allcomppoints', methods=['GET'])
def all_comps_points():
    comps = Souteze.query.all()
    sorted_comps = sorted(comps, key=lambda x: x.date)
    formating = [{'x': index, 'y': comp.points}
                 for index, comp in enumerate(sorted_comps)]
    if not sorted_comps:
        return jsonify({'message': "nemas zadne souteze je to v pici"})

    # the last competition of the same category
    new_cat_comps = []
    for i in range(1, len(sorted_comps)):
        if sorted_comps[i-1].category != sorted_comps[i].category:
            new_cat_comps.append(i-1)
    if sorted_comps[-1].category != sorted_comps[-2]:
        new_cat_comps.append(len(sorted_comps)-1)

    categories = ['E', 'D', 'C', 'B', 'A',
                  'co se deje kurva', 'asi tam mas nekde hybu kamo']
    lines = [{'x': time, 'label': categories[index]} for index, time in
             enumerate(new_cat_comps)]

    data = jsonify({'data': formating, 'lines': lines})
    return data


@app.route('/api/allcomps', methods=['GET'])
def all_comps():
    comps = Souteze.query.all()
    sorted_comps = sorted(comps, key=lambda x: x.date)
    datime = [f'{comp.place}-{comp.date}' for comp in sorted_comps]
    ids = [comp.id for comp in sorted_comps]
    data = list(zip(datime, ids))
    return jsonify({'data': data})


@app.route('/api/getcomp', methods=['GET'])
def get_comp():
    comp_id = request.args.get('id')
    select = db.select(Souteze).filter_by(id=comp_id)
    comp = db.session.execute(select).first()
    comp = comp[0]
    comand = db.select(SoutezePorotci).filter_by(
        souteze_id=comp_id)
    judges = db.session.execute(comand).all()
    return jsonify({'category': comp.category, 'numJudges': len(judges)})


@app.route('/api/getjudgesuccess', methods=['GET'])
def get_judge_success():
    name = request.args.get('name')
    id = db.session.execute(
        db.select(Porotci).filter_by(name=name)).first()[0].id
    print(id)
    data = get_judge_data(id)
    procesed = proces_judge_data(data)
    return jsonify({'message': 'koule'})


def proces_judge_data(data):
    pass


def get_judge_data(id):
    command = db.select(SoutezePorotci).filter_by(porotci_id=id)
    souteze = db.session.execute(command).all()
    print(souteze)
    for dato in souteze:
        print(dato)
        id = dato[0].souteze_id
        index = dato[0].porotce_index
        vysledky = db.session.execute(
            db.select(Vysledky).filter_by(soutez_id=id)).all()
        for vysledek in vysledky:
            for dance in vysledek[0].get_dances():
                print(vysledek[0], dance)
                hodnoceni = getattr(vysledek[0], dance)[index]

    return jsonify({'message': 'koule'})


@app.route('/api/alljudges', methods=['GET'])
def all_judges():
    judges = Porotci.query.all()
    judges = [judge.name for judge in judges]
    return jsonify({'names': judges, 'message': 'koule pero smrdis'})
