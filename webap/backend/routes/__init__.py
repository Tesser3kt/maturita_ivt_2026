from .add_routes import add_routes
from .get_routes import get_routes


def register_routes(app):
    add_routes(app)
    get_routes(app)
