<?php

define('DB_NAME', 'wp_db');
define('DB_USER', 'wp_user');
define('DB_PASSWORD', file_get_contents('/run/secrets/mysql_password'));
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if(!defined('ABSPATH'))
{
	define('ABSPATH', _DIR_ . '/');
}

require_once ABSPATH . 'wp-settings.php';