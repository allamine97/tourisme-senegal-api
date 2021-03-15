from config import db
from models.persons import PersonModel

class PersonService:
    def jsonify(self, person):
        return {
            "id": person.id,
            "nom":person.nom,
            "domaine": person.domaine,
            "biographie": person.biographie,
            "description": person.description,
            "date_naissance": person.date_naissance,
            "date_deces": person.date_deces,
        }
    def get_all(self):
        persons = PersonModel.query.all()
        return [self.jsonify(person) for person in persons]

    def get(self, id):
        person = PersonModel.query.get(id)
        return self.jsonify(person)