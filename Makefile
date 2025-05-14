NAME = inception
#==========VARIABLES======================
LOGIN = tnakas
COMPOSE_PATH = ./srcs/docker-compose.yml
DOCKER = docker compose -f ${COMPOSE_PATH}
SERVICE = mariadb
VOLUME = mariadb
#==========COMPILING ACTIONS==============
all: setup build up

setup:
		@mkdir -p /home/${LOGIN}/data
		@mkdir -p /home/${LOGIN}/data/mariadb
		@mkdir -p /home/${LOGIN}/data/wordpress

build:
	${DOCKER} build

up:
	${DOCKER} up --detach

down:
	${DOCKER} down

clean:
	${DOCKER} down -v
	-rm -rf /home/tnakas/data

fclean: clean
		docker system prune -a --force

re: clean all

strong_re: fclean all
#==========MONITORING ACTIONS=============
#----------services && volumes------------
logs:
	docker compose  -f ${COMPOSE_PATH} logs

ps:
	docker compose  -f ${COMPOSE_PATH} ps
#----------bash---------------------------
bash: 
	${DOCKER} exec  -it ${SERVICE} bash
#==========PHONY==========================
.PHONY: all setup build up down clean fclean re strong_re logs ps bash