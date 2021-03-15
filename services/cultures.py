from config import db
from models.cultures import CultureModel

class CultureService:
    def jsonify(self, culture):
        return {
            "id": culture.id,
            "type":culture.type,
            "url_photo": culture.url_photo,
            "nom":culture.nom,
            "description": culture.description,
        }
    def get_all(self):
        cultures = CultureModel.query.all()
        return [self.jsonify(culture) for culture in cultures]

    def get(self, id):
        culture = CultureModel.query.get(id)
        return self.jsonify(culture)