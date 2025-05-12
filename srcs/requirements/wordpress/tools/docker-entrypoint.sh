#!/bin/sh

if [ ! -f /var/www/html/index.php ]; then
   echo "First run: copying WordPress files to /var/www/html"
   cp -R /usr/src/wordpress/* /var/www/html/
   chown -R www-data:www-data /var/www/html
fi

exec php-fpm7.4 -F