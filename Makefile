FILE_PATH="srcs/docker-compose.yml"

all: build up

build:
	docker-compose --file $(FILE_PATH) build

up:
	mkdir -p ~/db-data
	mkdir -p ~/wordpress-data
	docker-compose --file $(FILE_PATH) up

down:
	docker-compose --file $(FILE_PATH) down

reset:
	docker system prune -af

.PHONY: all build up down reset
