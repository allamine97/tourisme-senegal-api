from config import db
from models.sites import SiteModel

class SiteService:
    def jsonify(self, site):
        return {
            "id": site.id,
            "nom":site.nom,
            "note": site.domaine,
            "description": site.description,
        }
    def get_all(self):
        sites = SiteModel.query.all()
        return [self.jsonify(site) for site in sites]

    def get(self, id):
        site = SiteModel.query.get(id)
        return self.jsonify(site)