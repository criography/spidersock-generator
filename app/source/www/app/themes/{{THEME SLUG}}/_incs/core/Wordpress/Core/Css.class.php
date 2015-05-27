<?php
/**
 * URL CGY_WP_Css
 * -----------------------------------------------------
 * Contains all helpers transforming editor functionality
 *
 * @package      {{PROJECT NAME}}
 * @subpackage   CGY Helpers
 * @since        {{VERSION}}
 *
 */




class CGY_WP_Css{



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

		add_filter('body_class', array($this, 'drop_single_body_class') );
	}







/**
	* drop_single_body_class
	* --------------------------
	* Removes 'single' class from the body and replaces it with 'singular'
	*
	* @param    array   $classes      all body classes
	* @return   array                 modified class array
	*/

	private function drop_single_body_class( $classes )
	{

		/* add singular class */
		if( is_singular() && !is_home() && !is_page_template('showcase.php') && !is_page_template('sidebar-page.php') )
			$classes[ ] = 'singular';

		/* remove single class */
		if( $key = array_search('single', $classes) )
		{
			unset( $classes[ $key ] );
		}

		return $classes;
	}










}

add_action('admin_init', array('CGY_WP_Css', 'init'));
