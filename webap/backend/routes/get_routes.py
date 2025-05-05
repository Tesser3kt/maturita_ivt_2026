from ..setup import db

from flask import jsonify, request

from ..tabulky import Porotci, Souteze, SoutezePorotci, Vysledky


def get_routes(app):
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
