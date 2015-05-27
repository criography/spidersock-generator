<?php
/* DEFS
 * ----------------------------- */

/* default image dir */
define('IMG_DIR',       get_template_directory().'/_incs/images/front/');







/** INCLUDES
 * @TODO: Consider transition to classes
 * ----------------------------- */

/* WP: Core */
require_once('_incs/core/Wordpress/Core/rewrites.php');                         /* manages URL rewrites for contents of _incs folder */
require_once('_incs/core/Wordpress/Core/Metaboxes.class.php');                        /* contains hooks and actions to control existing/core metaboxes. Everything else to be added via ACF */
require_once('_incs/core/Wordpress/Core/admin_menus.php');                      /* contains hooks and actions to control WP's left nav */
require_once('_incs/core/Wordpress/Core/Css.class.php');                          /* manage adding classes to the body/html tag */
require_once('_incs/core/Wordpress/Core/Editor.class.php');                           /* methods overriding text editors */


/* WP: Custom Post Types */
//require_once('_incs/core/Wordpress/cpt/styleguide.php');                        /* include styleguide CPT */
//require_once('_incs/core/Wordpress/cpt/customs.php');                           /* include all necessary CPT init files */


/* WP: Utils */
require_once('_incs/core/Wordpress/Utils/Url.class.php');                        /* URL/Path manipulation functions */


/* Utilities */
require_once('_incs/core/Utilities/Utils.class.php' );                           /* common utilities */
require_once('_incs/core/Utilities/File.class.php' );                             /* generic file utilities */
//require_once('_incs/core/utilities/styleguide.php' );                           /* styleguide helpers */


/* String */
require_once('_incs/core/Text/Text.class.php' );                                  /* string manipulation functions */


/* Images */
require_once('_incs/core/Image/Image.class.php');                                  /* image manipulation functions */
require_once('_incs/core/Image/Blending.class.php');                              /* image blending functions */


/* Libs */
require_once('_incs/core/lib/aq_resizer.php');                                  /* Aqua Resizer */


/* Generators */
require_once('_incs/core/generators/tabs.php');                                 /* tab module generator */


/* WP: Custom Menu Walkers */
require_once('_incs/core/wordpress/walkers/menuWalkers.php');                   /* Menu Walkers */


/* Debug */
require_once('_incs/core/wordpress/debug/hook-debugger.php');                   /* Hooks lister */











/* SETTINGS
 * ----------------------------- */

/* disable admin bar */
//add_filter('show_admin_bar', '__return_false');



/* add featured image support */
add_theme_support( 'post-thumbnails' );



/* allow svg */
function cc_mime_types( $mimes ){
	$mimes['svg'] = 'image/svg+xml';
	$mimes['svgz'] = 'image/svg+xml';
	return $mimes;
}
add_filter( 'upload_mimes', 'cc_mime_types' );



/* change GD compression quality if GD is used */
add_filter( 'jpeg_quality', create_function( '', 'return 90;' ) );


/* override error reporting */
if (WP_DEBUG && WP_DEBUG_DISPLAY){
    ini_set('error_reporting', E_ALL & ~E_STRICT & ~E_DEPRECATED);
}




