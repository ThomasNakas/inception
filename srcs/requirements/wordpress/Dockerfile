FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \ 
	apt install -y \
	php7.4-fpm php7.4-mysql curl wget unzip mariadb-client && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	ls -l && \
	mkdir -p /var/www/html && \
	mv wordpress/* /var/www/html && \
	rm latest.tar.gz

RUN mkdir -p /run/php

RUN chown -R www-data:www-data /var/www/html
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
WORKDIR /var/www/html

CMD ["php-fpm7.4", "-F"]
