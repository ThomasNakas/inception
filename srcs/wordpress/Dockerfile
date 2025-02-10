FROM debian:buster

RUN apt update && apt install -y \
php-fpm \
php-mysql \
wget \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY ./wp-config.php /var/www/html/wp-config.php
WORKDIR /var/www/html
CMD ["php-fpm7.3", "-F"]