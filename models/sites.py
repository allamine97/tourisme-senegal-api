from config import db


class SiteModel(db.Model):
    __tablename__="sites"
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    nom = db.Column(db.String(120), nullable=False, unique=True)
    note= db.Column(db.Integer, nullable=False)
    description = db.Column(db.String(255), nullable=False)
    lieu=db.Column(db.String(255),nullable=True)
    url_photo=db.Column(db.String(255),nullable=True)
    def __repr__(self):
        return '<Site %r>' % self.username
