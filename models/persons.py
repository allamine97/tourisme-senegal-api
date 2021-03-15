from config import db


class PersonModel(db.Model):
    __tablename__="persons"
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    nom = db.Column(db.String(120), nullable=False, unique=True)
    domaine= db.Column(db.String(120), nullable=False)
    biographie = db.Column(db.String(120))
    description = db.Column(db.String(255), nullable=False)
    date_naissance = db.Column(db.String(120), nullable=False)
    date_deces = db.Column(db.String(120))

    def __repr__(self):
        return '<Person %r>' % self.username
