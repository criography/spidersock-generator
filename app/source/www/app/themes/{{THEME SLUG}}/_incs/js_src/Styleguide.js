/*global Modernizr:true, _:true, Vars:true */

/**
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * !!!!! JS HINT YOUR DAMN CODE !!!!!
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 *
 * @DEPENDS jquery 1.10.2
 * @DEPENDS Modernizr
 * @TODO Something needs doing
 * @REF Fluffy Puppies Script by @aardvarklondon http://aardvarklondon.com/fluffy-puppies-script/
 *
 */



(function($, window, document){
	"use strict";

	$(document).ready(function() {


		/* Trigger an accordion */
		$('.accordion').Accordion({duration:300, easing: 'easeOutQuad', scrollToView:true});

		/* Trigger a tab navigation */
		$('#tabs-slideMe').Tabs({easing: 'easeOutQuad'});

	})

})(jQuery, window, document);