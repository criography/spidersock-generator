<?php
/**
	* Module Name: Content Editor Overrides
	*
	* @package      {{PROJECT NAME}}
	* @subpackage   CGY Helpers
	* @since        {{VERSION}}
	*/



/**
 * URL CGY_Editor
 * -----------------------------------------------------
 * Contains all helpers transforming editor functionality
 *
 * @package WordPress
 * @subpackage theme-name
 *
 */


class CGY_WP_Editor{



/**
	* init
	* ---------------------------------------------------------------------
	* initiate class and expose its methods
	*
	* @return void
	*/
	public function init() {
		$class = __CLASS__;
		new $class;
	}





/**
	* __construct
	* ---------------------------------------------------------------------
	*/
	public function __construct(){

		/* inserts figure instead of img to editor */
		add_filter('image_send_to_editor', array($this, 'html5_insert_image'), 10, 9);

	}







/**
 * html5_insert_image
 * ----------------------------------------
 * Overrides Wordpress' default image tag injection from the level of text editor.
 * Based on: http://css-tricks.com/snippets/wordpress/insert-images-with-figurefigcaption/
 *
 * @param string $html HTML content
 * @param integer $id image attachment id
 * @param string $caption image caption
 * @param string $title image title attribute
 * @param string $align image css alignment property
 * @param string $url image src url
 * @param string $size image size (thumbnail, medium, large, full or added  with add_image_size() )
 * @param string $alt image alt attribute
 *
 * @return string Returns <figure> markup.
 */

	private function html5_insert_image( $html, $id, $caption, $title, $align, $url, $size, $alt )
	{
		$html5 =  '<figure id="figure--' . $id . '" class="align--' . $align . '">' .
								'<img src="' . $url . '" alt="' . $alt . '" />' .
								( $caption ? '<figcaption>' . $caption . '</figcaption>' : '' ) .
							'</figure>';

		return $html5;
	}


}

add_action('admin_init', array('CGY_WP_Editor', 'init'));
