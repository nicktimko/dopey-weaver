NAME = myapp

HOSTPORT = 8080
CONTAINERPORT = 5000

build:
	docker build -t $(NAME) --rm .

run:
	docker run -i -p $(HOSTPORT):$(CONTAINERPORT) -t $(NAME)

rund:
	docker run -d -p $(HOSTPORT):$(CONTAINERPORT) -t $(NAME)

clean:
	docker ps -a | grep '$(NAME):' | awk '{print $$1}' | xargs --no-run-if-empty docker kill
	docker ps -a | grep '$(NAME):' | awk '{print $$1}' | xargs --no-run-if-empty docker rm
