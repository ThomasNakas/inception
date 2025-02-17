NAME = inception

all: setup build up

setup:
	sudo chown -R 1001:1001 /home/tnakas/data/mariadb
	sudo chmod -R 750 /home/tnakas/data/mariadb
	sudo chown -R 1001:1001 /home/tnakas/data/wordpress
    sudo chmod -R 750 /home/tnakas/data/wordpress
build:
	docker compose -f srcs/docker-compose.yml build
up:
	docker compose -f srcs/docker-compose.yml up --detach
down:
	docker compose -f srcs/docker-compose.yml down
clean: down \
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean \
		@docker system prune -a --force \
		sudo rm -rf /home/tnakas/data/wordpress/* \
		sudo rm -rf /home/tnakas/data/mariadb/*
re: fclean all

.PHONY: all build up down clean fclean re setup