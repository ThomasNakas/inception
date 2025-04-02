FROM debian:buster

RUN apt update && apt install -y \
	php-fpm \
	php-mysql \
	php-curl \
	php-gd \
	php-mbstring \
	php-xml \
	php-xmlrpc \
	php-soap \
	php-intl \
	php-zip \
	wget \
	&& rm -rf /var/lib/apt/lists/*
# RUN mkdir -p /var/www/html
# RUN wget https://wordpress.org/latest.tar.gz && \
# 	tar -xzf latest.tar.gz && \
# 	rm latest.tar.gz && \
# 	mv wordpress /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
# COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# COPY tools/wp-config.php /var/www/html/wp-config.php

# EXPOSE 9000

CMD ["php-fpm7.3", "-F"]