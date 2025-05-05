from ..setup import db

from flask import jsonify, request

from ..tabulky import Porotci, Souteze, SoutezePorotci, Vysledky


def add_routes(app):
    @app.route('/api/addjudge', methods=["POST"])
    def add_judge():
        print('koule')
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
