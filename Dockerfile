# Pull official base image
FROM python:3.9-slim-buster

# Create directory for the app user
RUN mkdir /home/app

# Create the app user
RUN useradd -u 1001 app

# Create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/src
RUN mkdir $APP_HOME
RUN mkdir $HOME/static
WORKDIR $APP_HOME

# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements/base.txt .
RUN pip install -r base.txt
RUN apt-get -y update
RUN apt-get install -y curl vim
RUN apt-get update -yq \
    && apt-get -yq install curl gnupg ca-certificates \
    && curl -L https://deb.nodesource.com/setup_lts.x | bash \
    && apt-get update -yq \
    && apt-get install -yq \
    nodejs

# Copy project
COPY ./src $APP_HOME
COPY ./*.json $HOME/

# Frontend
RUN cd .. \
    && npm install \ 
    && npm run build

# Chown all the files to the app user
RUN chown -R app:app $HOME

# Change to the app user
USER app
