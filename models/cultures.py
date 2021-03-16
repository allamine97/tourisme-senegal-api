from config import db


class CultureModel(db.Model):
    __tablename__="cultures"
    id = db.Column(db.Integer, primary_key=True,autoincrement=True)
    type = db.Column(db.String(120), nullable=False, unique=False)
    url_photo= db.Column(db.String(120), nullable=True)
    nom = db.Column(db.String(120),nullable=False,unique=True)
    description = db.Column(db.String(255), nullable=False)
    

    def __repr__(self):
        return '<Culture %r>' % self.username
