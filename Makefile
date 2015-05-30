build:
	docker-compose build

up:
	docker-compose up

syncdb:
	docker-compose run app python manage.py syncdb

