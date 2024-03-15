FILE_PATH="srcs/docker-compose.yml"

all: build up

build:
	sudo docker compose --file $(FILE_PATH) build

up:
	sudo docker compose --file $(FILE_PATH) up

down:
	sudo docker compose --file $(FILE_PATH) down

.PHONY: all build up down