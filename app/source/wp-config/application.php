<?php

/** ==========================================
  * Local Vars
  * ========================================== */
$_path_root     = dirname(__DIR__);                   /* full server path to project root */
$_path_docroot  = $_path_root . '/www';               /* full server path to doc root */





/** ==========================================
  * Use Dotenv to set required environment variables
  * and load .env file in root
  *
  * Default Environment: dev
  * ========================================== */
if (file_exists($_path_root . '/.env')) {
	Dotenv::load($_path_root);
}

Dotenv::required(array('DB_NAME', 'DB_USER', 'DB_PASSWORD', 'WP_HOME', 'WP_SITEURL'));

define('WP_ENV', getenv('WP_ENV') ? getenv('WP_ENV') : 'dev');
$env_config = __DIR__ . '/environments/' . WP_ENV . '.php';

if (file_exists($env_config)) {
	require_once $env_config;
}





/** ==========================================
  * Authentication Unique Keys and Salts
  * ========================================== */
define('AUTH_KEY',         getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY',  getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY',    getenv('LOGGED_IN_KEY'));
define('NONCE_KEY',        getenv('NONCE_KEY'));
define('AUTH_SALT',        getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT',   getenv('LOGGED_IN_SALT'));
define('NONCE_SALT',       getenv('NONCE_SALT'));






/** ==========================================
  * Custom Content Directory
  * ========================================== */
define('CONTENT_DIR', '/app');
define('WP_CONTENT_DIR', $_path_docroot . CONTENT_DIR);
define('WP_CONTENT_URL', 'http' . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . $_SERVER['HTTP_HOST'] . CONTENT_DIR);





/** ==========================================
  * Custom Uploads Directory
  * ========================================== */
define('UPLOADS', $_path_docroot . '/uploads');





/** ==========================================
  * DB Settings
  * ========================================== */
define('DB_CHARSET', 'utf8');                           // Database Charset to use in creating database tables.
define('DB_COLLATE', '');                               // The Database Collate type. Don't change this if in doubt.
$table_prefix = getenv('DB_PREFIX') ?: 'wp_';           // grab value from .env file and if not present fallback to wp_





/** ==========================================
  * WordPress Localized Language
  * ------------------------------------------
  * A corresponding MO file for the chosen language must be installed to app/languages
  *
  * Default     : English
  * More Info   : http://codex.wordpress.org/Installing_WordPress_in_Your_Language
  * ========================================== */
define('WPLANG', 'en_GB');





/** ==========================================
  * Limit amount or revisions to 5 per post
  * ========================================== */
define('WP_POST_REVISIONS', 5);





/** ==========================================
  * Limit amount or revisions to 5 per post
  * ========================================== */
define('AUTOMATIC_UPDATER_DISABLED', true);





/** ==========================================
  * Disable admin editor
  * ========================================== */
define( 'DISALLOW_FILE_EDIT', true );





/** ==========================================
  * Bootstrap Wordpress
  * ========================================== */
if (!defined('ABSPATH')) {
	define('ABSPATH', $_path_docroot . '/core/');
}