<?php
/**
	* @package      {{PROJECT NAME}}
	* @subpackage   CGY Helpers
	* @since        {{VERSION}}
	*/

/**
 * Make theme available for translation
 * Translations can be filed in the /languages/ directory
 */

function roots_add_rewrites($content) {
  $theme_dir = explode('/themes/', get_stylesheet_directory());
  $theme_name = next($theme_dir);
	$wp_content_dir = trim(CONTENT_DIR, '/');
	
  global $wp_rewrite;
  $roots_new_non_wp_rules = array(
	  '_incs/css/(.*)'          => $wp_content_dir . '/themes/' . $theme_name . '/_incs/css/$1',
	  '_incs/components/(.*)'   => $wp_content_dir . '/themes/' . $theme_name . '/_incs/components/$1',
	  '_incs/js/(.*)'           => $wp_content_dir . '/themes/' . $theme_name . '/_incs/js/$1',
	  '_incs/js_src/(.*)'       => $wp_content_dir . '/themes/' . $theme_name . '/_incs/js_src/$1',
	  '_incs/images/(.*)'       => $wp_content_dir . '/themes/' . $theme_name . '/_incs/images/$1',
	  '_incs/fonts/(.*)'        => $wp_content_dir . '/themes/' . $theme_name . '/_incs/fonts/$1',
	  '_incs/audio/(.*)'        => $wp_content_dir . '/themes/' . $theme_name . '/_incs/audio/$1',
	  '_incs/ajax/(.*)'         => $wp_content_dir . '/themes/' . $theme_name . '/_incs/ajax/$1'
  );
  $wp_rewrite->non_wp_rules += $roots_new_non_wp_rules;
}

add_action('generate_rewrite_rules', 'roots_add_rewrites');
