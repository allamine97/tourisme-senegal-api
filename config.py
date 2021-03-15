import os
from flask import Flask
from flask_restplus import Api
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)
api = Api(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://{}:{}@{}/{}'.format(
    os.getenv('DB_USER', 'root'),
    os.getenv('DB_PASSWORD', ''),
    os.getenv('DB_HOST', 'localhost'),
    os.getenv('DB_NAME', 'senegal')
)
db = SQLAlchemy(app)

# create the DB on demand
@app.before_first_request
def create_tables():
    db.create_all()
