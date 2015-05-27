<?php
	/**
	 * @package      {{PROJECT NAME}}
	 * @subpackage   CGY Helpers
	 * @since        {{VERSION}}
	 */





/**
 * uni_register_postsInGrid
 * ----------------------------------------------
 * registers new setting in WP's Reading Panel
 */

	function uni_register_postsInGrid(){
		register_setting(
			'reading', // settings page
			'uni_options', // option name
			'uni_validate_posts_in_grid' // validation callback
		);

		add_settings_field(
			'uni_visible_posts_in_grid', // id
			'Posts in Grid', // setting title
			'uni_visible_posts_in_grid_input', // display callback
			'reading', // settings page
			'default' // settings section
		);

	}
	add_action('admin_init', 'uni_register_postsInGrid');









/**
 * uni_visible_posts_in_grid_input
 * ----------------------------------------------
 * renders Input field for the setting
 */

function uni_visible_posts_in_grid_input(){
	$options  = get_option('uni_options');
	$value    = esc_attr( $options['uni_visible_posts_in_grid'] )?:8;
	?>
		<input  id='uni_visible_posts_in_grid' name='uni_options[uni_visible_posts_in_grid]'
		        class="small-text"
		        type="number"
		        min="1"
		        step="1"
		        type='text'
		        value='<?php echo $value; ?>' />
		Amount of items visible by default in Our Work listing section
	<?php
}








/**
 * uni_validate_posts_in_grid
 * ----------------------------------------------
 * validates the setting field and throws an error if needed.
 *
 * @param string $input value of the setting input field
 * @return validated value
 */

function uni_validate_posts_in_grid($input){
	$valid = array('uni_visible_posts_in_grid' => $input['uni_visible_posts_in_grid']);

	// Something dirty entered? Warn user.
	if($valid['uni_visible_posts_in_grid'] < 1){
		add_settings_error(
			'uni_options_uni_visible_posts_in_grid',  // setting title
			'uni_texterror',                         // error ID
			'Enter integers larger than 0',         // error message
			'error'                                 // type of message
		);
	}

	return $valid;
}





/**
 * adminMenu_shifting
 * --------------------------------------------
 * Shifts main nav items around
 */

function uni_adminMenu_shifting(){

	global $menu;

	$menu[19] = $menu[10];  // Copy Media from position 10 to position 19
	unset($menu[10]);       // Unset Media (from original position)

	$menu[10] = $menu[20];  // Copy Pages from position 20 to position 10
	unset($menu[20]);       // Unset Pages (from original position)

	$menu[15] = Array('', 'read', 'separator-custom-post-types', '', 'wp-menu-separator');
	ksort($menu);

}

add_action('admin_head', 'uni_adminMenu_shifting');











/**
	* Removes specific items from main nav
	* --------------------------------------------
	*/

function uni_remove_menus () {
	global $menu;

	$restricted = array(__('Posts'), __('Links'));
	end ($menu);
	while (prev($menu)){
		$value = explode(' ',$menu[key($menu)][0]);
		if(in_array($value[0] != NULL?$value[0]:"" , $restricted)){unset($menu[key($menu)]);}
	}
}

//add_action('admin_menu', 'uni_remove_menus');









/**
	* Removes contact methods from user panel
	* --------------------------------------------
	* http://wordpress.org/support/topic/remove-some-profile-fields#post-1388601
	*/

function uni_user_remove_contactmethods( $contactmethods ) {
	unset($contactmethods['aim']);
	unset($contactmethods['jabber']);
	unset($contactmethods['yim']);
	//unset($contactmethods['googleplus']);
	return $contactmethods;
}
add_filter('user_contactmethods','uni_user_remove_contactmethods',10,1);









/**
	* Removes theme colour options from user panel
	* --------------------------------------------
	* http://wordpress.org/support/topic/remove-some-profile-fields#post-1482462
	*/
function uni_admin_remove_colour_options() {
	global $_wp_admin_css_colors;
	$_wp_admin_css_colors = 0;
}
add_action('admin_head', 'uni_admin_remove_colour_options');
