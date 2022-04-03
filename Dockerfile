# pull official base image
FROM python:3.9-slim-buster

# create directory for the app user
RUN mkdir /home/app

# create the app user
# TODO: Change this not be explicit with UID
RUN useradd -u 1001 app

# create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/src
RUN mkdir $APP_HOME
RUN mkdir $HOME/static
WORKDIR $APP_HOME

# install dependencies
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

# copy project
COPY ./src $APP_HOME

# chown all the files to the app user
RUN chown -R app:app $HOME

# change to the app user
USER app