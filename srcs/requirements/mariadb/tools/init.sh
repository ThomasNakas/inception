#!/bin/bash

# Exit if any command fails
set -e
export MYSQL_ROOT_PASSWORD=$(cat /run/secrets/mysql_root_password)
export MYSQL_PASSWORD=$(cat /run/secrets/mysql_password)
export MYSQL_DATABASE=${MYSQL_DATABASE}
export MYSQL_ROOT_USER=${MYSQL_ROOT_USER}
export MYSQL_USER=${MYSQL_USER}
# Fill in the SQL with actual env values
cat <<EOF > /tmp/init.sql
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Super user
CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;

-- Normal user
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT SELECT, INSERT, UPDATE, DELETE ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

# Run the SQL script
exec mariadbd --init-file=/tmp/init.sql
