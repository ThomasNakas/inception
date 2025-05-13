FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \ 
	apt install -y \
	php7.4-fpm php7.4-mysql php7.4-mysqli curl wget unzip mariadb-client \
    php7.4-curl \
    php7.4-xml \
    php7.4-mbstring \
    php7.4-zip \
    php7.4-gd \
    php7.4-cli \
    php7.4-soap \
    php7.4-intl \
    openssl && \
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

COPY ./tools/docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
