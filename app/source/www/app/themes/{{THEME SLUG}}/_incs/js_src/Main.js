/*global Modernizr:true, _:true, Vars:true */

/**
 * This is a a pseudo-controller file.
 * -----------------------------------------------------------------------
 * It triggers all plugins, modules and methods, groupped into single event listeners if possible.
 * If listening for browser resize, scroll or any other heavy event, make sure to debounce and throttle
 * (ideally using underscore.js, but any other working solutions is fine).
 *
 * Always detect browser capabilities (Modernizr) to avoid running unnecessary scripts
 *
 * If there's something you're aware of that needs doing, but don,t have time right now,
 * make sure to list it here or directly above the related piece of code/method prefixed with @TODO
 *
 * If there's a very specific dependency, make sure to list it here prefixed with @DEPENDS
 *
 * If your code is a copy and paste of (or heavily influenced by) someone else's work,
 * list it here or directly above the related piece of code/method prefixed on @REF
 *
 * Don't be afraid of vertical whitespace. It'll make your eyes bleed less after a week of coding.
 *
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




		var varName   = 0,          /* document the purpose of each var */
				varName2  = $('#selector'),
				myModule  = {};





		/**
		 * Althought neither of these is a method, make sure to document everything you do, so it's easy to understand 6 months from now.
		 * I will hunt you down and feed you to kittens if you don't.
		 */
		if(Modernizr.touch && varName2.length){

			myModule = $('#selector').Module_jQuery({ option1: 'value1' }).
											data('plugin_Module_jQuery');

		}else{
			myModule = new Module();

		}







		/**
		 *  replace SVGs with PNGs
		 */
		if(!Modernizr.svg){
			svgeezy.init(false, 'png');
		}




		/** ==================================================================
		 * ON LOAD CALLS
		 * ==================================================================*/

				//$(window).load(function(){});

		/** ==================================================================
		 * ENDOF: ON LOAD CALLS
		 * ==================================================================*/










		/** ==================================================================
		 * ON SCROLL CALLS
		 * ==================================================================*/

				//$(window).scroll(function(){});

		/** ==================================================================
		 * ENDOF: ON SCROLL CALLS
		 * ==================================================================*/









		/** ==================================================================
		 * ON RESIZE CALLS
		 * ==================================================================*/

				//$(window).resize(function(){});

		/** ==================================================================
		 * ENDOF: ON RESIZE CALLS
		 * ==================================================================*/


	});

})(jQuery, window, document);

