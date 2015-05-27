<?php
/**
	* URL Helper Methods
	* -----------------------------------------------------
	* Contains all helpers transforming, traversing or parsing URLs
	*
	* @package      {{PROJECT NAME}}
	* @subpackage   CGY Helpers
	* @since        {{VERSION}}
	*
	*/


class CGY_WP_MetaBoxes{



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

		/* Acc custom description for Featured Image */
		//add_filter( 'admin_post_thumbnail_html', array($this, 'add_featured_image_instruction'));

	}








	/**
	 * Add description to Featured Image metabox in Blog section
	 * --------------------------------------------
	 * http://trepmal.com/2011/03/21/add-or-change-content-in-the-featured-image-meta-box/
	 *
	 * @todo allow limiting to specific post type.
	 */

	private function add_featured_image_instruction( $content ) {
		return $content .=  '<p>Text to be placed under the file field</p>';
	}








}

add_action('admin_init', array('CGY_WP_MetaBoxes', 'init'));
