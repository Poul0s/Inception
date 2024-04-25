FILE_PATH="srcs/docker-compose.yml"

all: build up

build:
	docker-compose --file $(FILE_PATH) build --parallel

up:
	mkdir -p ~/db-data
	mkdir -p ~/wordpress-data
	docker-compose --file $(FILE_PATH) up

down:
	docker-compose --file $(FILE_PATH) down

.PHONY: all build up down
