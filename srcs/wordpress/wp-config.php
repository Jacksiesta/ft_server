<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'tom' );

/** MySQL database password */
define( 'DB_PASSWORD', 'tom' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8mb4_general_ci' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'gOXeQ$HtPLz1S)kt!Z<-|092q$ye;C_EC/KPq0+G0z&IU{QWtw/pMa=#->0<7!T{');
define('SECURE_AUTH_KEY',  'AWYs:|k$~QRlHYsON6BG{-j-Y>K*NOoE;7kUm9|0cm%vyKcgg+$K+A5}T7-B&3i`');
define('LOGGED_IN_KEY',    'r6vH d+Bi7*xOy&k}>6i2+oD|]lsPYGU*i/Kd?VYv<+Z{4@=d6Vl`Z&&N|i2T|n@');
define('NONCE_KEY',        '(VZOGG00+g7oD(jBD<!6N,F^ .DS_.b d<:`AtZMTcBf{&+L|+u:YV;D=Bx%A:ua');
define('AUTH_SALT',        'vpS U1s@36zZkU1E)y-LK>8/k*Nvp#<m-*h*=|+sQe]2AbT$)nF2: =f{#r(Iw#k');
define('SECURE_AUTH_SALT', '%;>}fQjc4+52pM=}>/UtGtO:aH k49vnzIa8d=Lman5c3w)*65a%*rM8<XDkh?].');
define('LOGGED_IN_SALT',   'W!Gx9&2Y6RWxE?8MS`v7ogE@ugRrF+3Vs|*F,h-^3T7}DYb&P?#HE|e|5N@<<2fI');
define('NONCE_SALT',       '+[@`1UqG93v+ 1/m^5+A^L1W6LEF{]>tOuf-1GBK0FM{|^E-S$x<9]M],,Kn~,)q');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
