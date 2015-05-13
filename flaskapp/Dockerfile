FROM python:3.4-slim

RUN pip install --upgrade pip --disable-pip-version-check

ADD src /srv/www

WORKDIR /srv/www
RUN pip install -r requirements.txt

#CMD ["python", "./app.py"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
