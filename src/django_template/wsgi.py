from django.core.wsgi import get_wsgi_application

from .setup import setup_env

setup_env()

application = get_wsgi_application()
