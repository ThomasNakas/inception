NAME = inception

all: build up

build:
	@docker-compose -f srcs/docker-compose.yml build
up:
	@docker-compose -f srcs/docker-compose.yml up -docker -d
down:
	@docker-compose -f srcs/docker-compose.yml down
clean: down

fclean: clean
		@docker system prune -a --force
		@rm -rf ${HOME}/data/wordpress/*
		@rm -rf ${HOME}/data/mariadb/*
re: fclean all

.PHONY: all build up down clean fclean re