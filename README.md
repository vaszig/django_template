**This template is under development and it's being improved.**

## Prerequisites

You need the following libraries and/or programs:

    Python 3.8 or above
    Python Virtualenv and Pip
    PostgreSQL 10 or above
    Node.js
    npm
    parcel-bundler

A .env file with the following variables must exist at the root of the project

- DJANGO_SETTINGS_MODULE
- DEBUG
- SECRET_KEY
- ALLOWED_HOSTS
- SQL_ENGINE
- POSTGRES_DB
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_HOST
- POSTGRES_PORT
- STATIC_VOLUME
- POSTGRES_VOLUME

## Clone the repo

       $ git clone <repo_url>

## Install dependencies

       $ pip install -r requirements/base.txt

## Run the application

After the repo is cloned, we can run `python src/manage.py migrate` and `python src/manage.py runserver` to see the application running in local development mode.

## Docker

The application can run on two docker containers, one for the application and one for the postgres database.  
Inside the docker-compose file we mount two volumes for the data persistence and the static files.

We can run the services inside the containers by running the following command:

       $ docker-compose up -d --build

## Frontend

- Parcel is used as a bundler [Github repo](https://github.com/parcel-bundler/parcel)
- Create the directory src/django_template/static/bundles
- Install all the required libraries

       $ npm install
       $ npm run dev
