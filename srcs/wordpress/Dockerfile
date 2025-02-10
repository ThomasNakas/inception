FROM debian:buster
RUN apt update && apt install -y php-fpm php-mysql wget
COPY ./wp-config.php /war/www/html-config.php
WORKDIR /var/www/html
CMD ["php-fpm7.3", "-F"]