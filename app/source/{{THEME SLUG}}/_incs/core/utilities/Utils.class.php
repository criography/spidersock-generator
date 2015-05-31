<?php
/**
	* CGY_Utils
	* ---------------------------------------------------------------------
	* Misc Utilities
	*
	* @package      {{PROJECT NAME}}
	* @subpackage   CGY Helpers
	* @since        {{VERSION}}
	*/






class CGY_Utils{



/**
	* init
	* ---------------------------------------------------------------------
	* initiate class and expose its methods
	*
	* @return void
	*/
	private static function init() {
		$class = __CLASS__;
		new $class;
	}





/**
	* __construct
	* ---------------------------------------------------------------------
	*/
	public function __construct(){
	}





/**
 * first
 * --------------------------------------------------
 * equivalent of JS's a||b||c returns first nonempty value
 *
 * @param mixed $arg array or comma separated argument list: all arguments
 * @return mixed
 */

	public static function first(){
		$args = func_get_args();
		return current(array_filter( is_array($args[0]) ? $args[0] : $args ));
	}







/**
 * print_a
 * --------------------------------------------------
 * shows pre-formatted object or array
 *
 * @param {mixed} $data object or array
 * @return void
 */

	public static function print_a($data){
		echo '<pre>', print_r($data, 1), '</pre>';
	}







}

add_action('plugins_loaded', array('CGY_Utils', 'init'));
