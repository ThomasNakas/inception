<?php

define('DB_NAME', getenv('MYSQL_DATABASE'));
define('DB_USER', getenv('MYSQL_USER'));
define('DB_PASSWORD', file_get_contents('/run/secrets/mysql_password'));
define('DB_HOST', getenv('WP_DB_HOST'));
define('DB_CHARSET', getenv('WP_DB_CHARSET'));
define('DB_COLLATE', '');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if(!defined('ABSPATH'))
{
	define('ABSPATH', _DIR_ . '/');
}

require_once ABSPATH . 'wp-settings.php';