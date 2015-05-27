<?php




/**
 * wpcf7_services_shortcode_handler
 * -----------------------------------
 * Add hidden field to the form and
 * extend Email Content customisation with it
 * based on http://kovshenin.com/2010/wordpress-extending-the-contact-form-7-plugin/
 * -----------------------------------
 * @param array $tag Shortcode tag
 * @return string HTML with a hidden input field
 */
function wpcf7_services_shortcode_handler($tag) {
	//quit if shortcode is b0rken
	if (!is_array($tag) || is_array($tag) && empty($tag['name'])) return '';

	//add hidden input
	return '<input type="hidden" name="' . $tag['name'] . '" value="'.$GLOBALS['currentService'].'" />';
}





// prevent Contact From 7 from sending out email
// (it's all processed though so you can debug)
function wpcf7_prevent_sendout (&$WPCF7_ContactForm) {
	$WPCF7_ContactForm->skip_mail = true;
}





/**
 * wpcf7_add_class_to_form
 * -----------------------------------
 * adds custom classes to a form container
 * -----------------------------------
 *
 * @param string $class String containing existing classes
 * @return
 */

function wpcf7_add_class_to_form($class) {
	$class .= ' form-contact';
	return $class;
}






	/* init only if CF7 is present and active */
	if(WPCF7_PLUGIN_DIR!=='WPCF7_PLUGIN_DIR'){

		// wpcf7_add_shortcode('service', 'wpcf7_services_shortcode_handler', true);

	    // add_filter( 'wpcf7_form_class_attr', 'wpcf7_add_class_to_form' );

	    // add_action("wpcf7_before_send_mail", "wpcf7_prevent_sendout");
	};