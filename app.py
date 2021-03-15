from config import app, api
from services.cultures import CultureService
from services.persons import PersonService
from services.sites import SiteService
from flask_cors import CORS
from flask_restplus import Resource
from flask import request

culture_service=CultureService()
site_service = SiteService()
person_service = PersonService()
cors = CORS(app, resources={
    r'/*': {
        'origins': '*'
    }
})
app.config['CORS_HEADERS'] = 'Content-Type'

class Site(Resource):
    def get(self):
        return site_service.get_all()


class SiteById(Resource):
    def get(self, id):
        return site_service.get(id)

class Culture(Resource):
    def get(self):
        return culture_service.get_all()

class CultureById(Resource):
    def get(self, id):
        return culture_service.get(id)    


class Person(Resource):
    def get(self):
        return person_service.get_all()


class PersonById(Resource):
    def get(self, id):
        return person_service.get(id)


api.add_resource(Site, '/sites')
api.add_resource(SiteById, '/sites/<string:id>')
api.add_resource(Culture, '/cultures')
api.add_resource(CultureById, '/cultures/<string:id>')
api.add_resource(Person, '/persons')
api.add_resource(PersonById, '/persons/<string:id>')

if __name__ == '__main__':
    app.run(host="0.0.0.0", port="8080", debug=True)
