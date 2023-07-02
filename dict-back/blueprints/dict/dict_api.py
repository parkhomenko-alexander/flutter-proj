import json

from flask import Blueprint, request, render_template, redirect, url_for
from sqlalchemy import select
from models.models import *
from models.setup import db

dict_api = Blueprint('dict_api', __name__, template_folder='templates')

@dict_api.route('/', methods=['GET'],)
def index():
    query = select(WordRelation)
    translations = db.session.execute(query).all()
    return render_template('list.html', translations=translations)

@dict_api.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        word = request.form.get('word', '')
        translation = request.form.get('translation', '')

        word = Word(word=word)
        translation = Word(word=translation)

        db.session.add_all([word, translation])
        db.session.flush()
        print(word.id, translation.id)
        translate_rel = WordRelation(word_id=word.id, translation_id=translation.id)

        db.session.add(translate_rel)
        db.session.commit()

        return redirect(url_for('.index'))
    
    return render_template('add_word.html')

@dict_api.route('/get_dict', methods=['GET'],)
def get_dict():
    query = select(WordRelation)
    translations = db.session.execute(query).all()
    data = {'data': []}
    for tr in translations:
        data['data'].append({
            'word': tr[0].word.word,
            'translation': tr[0].translation.word,
        })

    return json.dumps(data, ensure_ascii=False)
