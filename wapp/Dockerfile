FROM python:3.4
ENV PYTHONUNBUFFERED 1

#RUN apt-get install libpq-dev
#RUN pip install --upgrade pip --disable-pip-version-check

RUN mkdir -p /srv/www
COPY src /srv/www
COPY entrypoint.sh /bin/entrypoint

WORKDIR /srv/www
RUN pip install -r requirements.txt

ENTRYPOINT ["entrypoint"]
CMD ["dj", "--help"]
