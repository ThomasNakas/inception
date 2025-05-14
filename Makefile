NAME = inception

LOGIN = tnakas
COMPOSE_PATH = srcs/docker-compose.yml
SERVICE = mariadb
all: setup build up

setup:
		@mkdir -p /home/${LOGIN}/data
		@mkdir -p /home/${LOGIN}/data/mariadb
		@mkdir -p /home/${LOGIN}/data/wordpress

build:
	docker compose -f ${COMPOSE_PATH} build

up:
	docker compose -f ${COMPOSE_PATH} up --detach

down:
	docker compose -f ${COMPOSE_PATH} down

inspect:
	docker compose  -f ${COMPOSE_PATH} logs

ps:
	docker compose  -f ${COMPOSE_PATH} ps

bash: 
	docker compose -f ${COMPOSE_PATH} exec  -it ${SERVICE} bash

clean:
	docker compose -f ${COMPOSE_PATH} down -v
	-rm -rf /home/tnakas/data

fclean: clean
		docker system prune -a --force


re: clean all

strong_re: fclean all

.PHONY: all build up down clean fclean re setup strong_re inspect ps bash