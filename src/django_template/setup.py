"""
Load the secrets from the .env file and store them in the environment, so
they are available for Django settings initialization.
"""
import os

from dotenv import load_dotenv


def setup_env():
    dotenv_path = os.path.join(
        os.path.dirname(__file__),
        os.pardir,
        os.pardir,
        ".env",
    )
    load_dotenv(dotenv_path)

    os.environ.setdefault(
        "DJANGO_SETTINGS_MODULE",
        "django_template.settings.dev",
    )
