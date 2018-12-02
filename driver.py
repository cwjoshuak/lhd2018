from tinydb import TinyDB, Query

import datetime

from flask import Flask
from flask import request
import json

db = TinyDB('db.json')

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/create', methods=['POST'])
def createPost():
    if request.method == 'POST':
        title = request.form.get('title')
        text = request.form.get('text')
        user = request.form.get('user')
        cat = request.form.get('category')

        db.insert({'cat':cat, 'title':title, 'text':text, 'user':user, 'time':str(datetime.datetime.now())})
    return '', 201


@app.route('/getAll', methods=['GET'])
def getPost():
    temp = db.all()
    newlist = sorted(temp, key=lambda k: k['time'], reverse=True)
    return json.dumps(newlist), 200

@app.route('/purge', methods=['GET'])
def purge():
    db.purge()
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
