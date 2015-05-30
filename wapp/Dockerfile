FROM python:3.4
ENV PYTHONUNBUFFERED 1

#RUN apt-get install libpq-dev

#RUN pip install --upgrade pip --disable-pip-version-check
RUN mkdir -p /srv/www
WORKDIR /srv/www

ADD src/requirements.txt /srv/www/

RUN pip install -r requirements.txt

ADD src /srv/www
