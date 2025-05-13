#!/bin/sh
set -e
export WORDPRESS_ROOT_PASSWORD=$(cat /run/secrets/wordpress_db_password)
export WORDPRESS_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_db_password)
export WORDPRESS_USER_PASSWORD=$(cat /run/secrets/wordpress_db_password)

if [ ! -f /var/www/html/index.php ]; then
   curl -O https://wordpress.org/latest.tar.gz
   tar -xzf latest.tar.gz
   cp -R wordpress/* /var/www/html/
   chown -R www-data:www-data /var/www/html
fi

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# ./wp-cli.phar core download --allow-root

if [ ! -f /var/www/html/wp-config.php ]; then
    ./wp-cli.phar config create \
        --dbname=${WORDPRESS_DB_NAME} \
        --dbuser=${WORDPRESS_ROOT} \
        --dbpass=${WORDPRESS_ROOT_PASSWORD} \
        --dbhost=${WORDPRESS_DB_HOST}:${WORDPRESS_DB_PORT} \
        --allow-root
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
    ./wp-cli.phar core install \
        --url=${WORDPRESS_WEBSITE} \
        --title=inception \
        --admin_user=${WORDPRESS_ADMIN_USER} \
        --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
        --admin_email=${WORDPRESS_ADMIN_USER}@gmail.com \
        --allow-root
fi

if ! ./wp-cli.phar user exists ${WORDPRESS_USER}  --allow-root; then
    ./wp-cli.phar user create ${WORDPRESS_USER} ${WORDPRESS_USER}@gmail.com \
        --role=author \
        --user_pass=${WORDPRESS_USER_PASSWORD} \
        --allow-root
fi

exec php-fpm7.4 -F