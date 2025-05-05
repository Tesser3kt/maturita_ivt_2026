from flask import Flask
from .setup import setup_access


def create_app():
    app = Flask(__name__)
    setup_access(app)

    # Optional: register your routes
    from .routes import register_routes
    register_routes(app)

    return app
