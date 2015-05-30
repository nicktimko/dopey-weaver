NAME = mywebapp

HOSTPORT = 8080
CONTAINERPORT = 5000

buildapp:
	docker build -t webapp webapp

runapp:
	docker run --name=$(NAME) -i -t webapp python manage.py runserver 0.0.0.0:8000

rmapp:
	docker rm $(NAME)
