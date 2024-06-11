FILE_PATH="srcs/docker-compose.yml"

all: build up log

build:
	docker-compose --file $(FILE_PATH) build --parallel

up:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker-compose --file $(FILE_PATH) up -d

down:
	docker-compose --file $(FILE_PATH) down

log:
	docker-compose --file $(FILE_PATH) logs -f

clean:
	-docker stop $(shell docker ps -qa);
	-docker rm $(shell docker ps -qa);
	-docker rmi -f $(shell docker images -qa);
	-docker volume rm $(shell docker volume ls -q);
	-docker network rm $(shell docker network ls -q) 2>/dev/null

.PHONY: all build up down log clean
