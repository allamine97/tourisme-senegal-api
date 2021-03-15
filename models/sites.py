from config import db


class SiteModel(db.Model):
    __tablename__="sites"
    id = db.Column(db.Integer, primary_key=True,auto_increment=True)
    nom = db.Column(db.String(120), nullable=False, unique=True)
    note= db.Column(db.float, nullable=False)
    description = db.Column(db.String(255), nullable=False)
    
    def __repr__(self):
        return '<Site %r>' % self.username
