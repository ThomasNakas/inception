NAME = inception

LOGIN = tnakas
all: setup build up

setup:
		@mkdir -p /home/${LOGIN}/data
		@mkdir -p /home/${LOGIN}/data/mariadb
		@mkdir -p /home/${LOGIN}/data/wordpress
		# @chown -R 999:999 /home/${LOGIN}/data/mariadb
		# @chown -R 33:33 /home/${LOGIN}/data/wordpress
build:
	docker compose -f srcs/docker-compose.yml build
up:
	docker compose -f srcs/docker-compose.yml up --detach
down:
	docker compose -f srcs/docker-compose.yml down
clean:
	docker compose -f srcs/docker-compose.yml down -v
	-rm -rf /home/tnakas/data

fclean: clean
		docker system prune -a --force
soft_re: clean all
re: fclean all

.PHONY: all build up down clean fclean re setup