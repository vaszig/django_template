***This template is under development and it's being improved.***

## Prerequisites

The following libraries and/or packages are needed:
- Python 3.8 or above  
- Python Virtualenv and Pip  
- PostgreSQL 10 or above  
- Node.js  
- npm  
- parcel-bundler  

The root directory of the project must contain a `.env` file which declares the following environmental variables:  

- DJANGO_SETTINGS_MODULE (dev is the default one, we can change it here)  
- DEBUG
- SECRET_KEY
- ALLOWED_HOSTS
- SQL_ENGINE
- POSTGRES_DB
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_HOST
- POSTGRES_PORT

_If the application runs with docker you must add the following variables:_  

- STATIC_VOLUME
- POSTGRES_VOLUME

## Clone the repo

       $ git clone <repo_url>

## Install dependencies

It is recommended to use a virtual environment, but not mandatory. 

       $ pip install -r requirements/base.txt

## Run the application

After the repo is cloned, we can run the local server by typing the folowing commands: 

1. Apply the migrations

       $ python src/manage.py migrate  

2. Run server  
       
       $ python src/manage.py runserver  

## Frontend

Parcel is used as a bundler ([Github repo](https://github.com/parcel-bundler/parcel))
- Install all the required libraries (root directory)

       $ npm install
- Run server (live effect of changes)
       
       $ npm run watch


## Docker

The application can run on two docker containers (web application - postgres database).  
Inside the docker-compose file we mount two volumes for the data persistence and the static files.

We can build the images and run the containers by typing the following command:

       $ docker-compose up -d --build

Once the containers are up we can run the migrations and copy the static files to the proper destination:  
- access the container  

       $ docker exec -it <container-name> bash  
- apply the migrations  
       
       $ python manage.py migrate  
- collect the static files  

       $ python manage.py collectstatic --noinput  
