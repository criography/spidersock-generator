/** ===================================================================================
 * Name     : Nav
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik
 *            http://aardvarklondon.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * enhances responsive navigation dropdowns with animations;
 * remove once transitions to height:auto are introduced to all browsers.
 *
 * @dependency jQuery
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true */




(function($, window, document, undefined){
	"use strict";

	var pluginName = 'Nav',
		defaults = {
			contactInput            : false,
			contactContainer        : false,

			subnavInput             : false,
			subnav                  : false,

			serviceToggler          : false,
			serviceFadeables        : false,
			serviceTogglerMinWidth  : 960,

			searchToggler           : false,
			searchField             : false
		};





	/* -----------------------------------------------------------------------------
	 * Nav
	 * -----------------------------------------------------------------------------
	 * @constructor
	 * @private
	 * @param {object} el jQuery object upon which the plugin was called
	 * @param {object} options parameters passed to the plugin
	 * -----------------------------------------------------------------------------*/

	function Nav(element, options){
		this.element      = element;
		this.options      = $.extend({}, defaults, options);
		this.forceChecked = Modernizr.touch || (!Modernizr.checkedselector && document.documentElement.className.indexOf('force-checked')>-1);

		this.init();
	}

	/* -----------------------------------------------------------------------------
	 * ENDOF: Nav
	 * -----------------------------------------------------------------------------*/








	/* -----------------------------------------------------------------------------
	 * HELPERS
	 * -----------------------------------------------------------------------------*/

	var correctedViewportW = function(){

		var mM      = window['matchMedia'] || window['msMatchMedia'],
				client  = document.documentElement['clientWidth'],
				inner   = window['innerWidth'];

		return (mM && client<inner && true===mM('(min-width:' + inner + 'px)')['matches'] ? window['innerWidth'] : document.documentElement['clientWidth']);

	};

	/* -----------------------------------------------------------------------------
	 * ENDOF: HELPERS
	 * -----------------------------------------------------------------------------*/








	/**-----------------------------------------------------------------------------
	 * PROTOTYPE METHODS [DOM/SUBJECT RELATED]
	 * -----------------------------------------------------------------------------*/
	Nav.prototype = {

		/*-----------------------------------------------------------------------------
		 * INIT QUICK CONTACT
		 * -----------------------------------------------------------------------------
		 * Slides quick contact panel up and down.
		 * Note: certain values are not cached intentionally,
		 *       to allow for dimension change on browser resize.
		 * -----------------------------------------------------------------------------*/
			initQuickContact : function(){
				var qcCont		= this.options.contactContainer,
						_this    = this;

				//neutralise CSS-only interactivity and offset container to hide quickContact
				qcCont.addClass('animated');

				//uncheck the toggler input and add event listener
				this.options.contactInput.prop('checked', false).on('change', function(e){

					//on activation
					if($(this).is(':checked')){

						var qcHeight = qcCont.height();

						//move to the viewport, and set height to 0
						qcCont.addClass('visible').css({height: 0}).delay(1, function(){

							//animate to exact height, and remove strict height on case the browser is resized
							$(this).stop().animate({height: qcHeight}, 300, 'linear', function(){
								$(this).css('height', 'auto');
							});
						});



					}else{

						//set current height value
						qcCont.css('height', qcCont.height()).delay(1, function(){

							//animate it to 0
							$(this).stop().animate({'height':0}, 300, 'linear', function(){

								//remove from the viewport and get rid of static height, so next activation can read the correct value
								qcCont.removeClass('visible').css({height: ''});
							});
						});
					}
				});




				if(this.forceChecked){
					$('#quickContactToggler').on('click touchend', function(){
						_this.options.contactInput.prop('checked', !_this.options.contactInput.prop('checked')).trigger('change');
					})
				}



			},





		/*-----------------------------------------------------------------------------
		 * INIT SUBNAV
		 * -----------------------------------------------------------------------------
		 * Slides subnav panel up and down on lower resolutions
		 * -----------------------------------------------------------------------------*/
			initSubnav : function(){

				var snCont		= this.options.subnav,
						_this     = this;

				//neutralise CSS-only interactivity and offset container to hide subnav
				snCont.addClass('animated');

				//uncheck the toggler input and add event listener
				this.options.subnavInput.prop('checked', false).on('change', function(e){



					//on activation
					if($(this).is(':checked')){

						var snHeight = snCont.height();

						// if animation is enabled
						if(_this.options.subnavAnimate){
							
							//move to the viewport, and set height to 0
							snCont.addClass('visible').css({height: 0}).delay(1, function(){

								//animate to exact height, and remove strict height on case the browser is resized
								$(this).stop().animate({height: snHeight}, 300, 'linear', function(){
									$(this).css('height', 'auto');
								});

							});


						// otherwise just toggle
						}else{
							snCont.addClass('visible').css('height', 'auto');

						}


					//on deactivation
					}else{

						// if animation is enabled
						if(_this.options.subnavAnimate){
							//set current height value
							snCont.css('height', snCont.height()).delay(1, function(){

								//animate it to 0
								$(this).stop().animate({'height':0}, 300, 'linear', function(){

									//remove from the viewport and get rid of static height, so next activation can read the correct value
									snCont.removeClass('visible').css({height: ''});
								});

							});

						// otherwise just toggle
						}else{
							snCont.removeClass('visible').css({height: ''});
						}


					}

				});

			},





		/**-----------------------------------------------------------------------------
		 * initServiceFadeout
		 * -----------------------------------------------------------------------------
		 * Controls body fade animations upon services subnav show/hide
		 *
		 * @private
		 * @this jQuery object
		 * -----------------------------------------------------------------------------*/

			initServiceFadeout : function(){

				var base = this;

				if(this.options.serviceTogglerMinWidth){



					this.options.serviceToggler.hoverIntent({
						timeout : 300,

						over    : function(){

												if(correctedViewportW() >= base.options.serviceTogglerMinWidth){

													base.options.serviceFadeables.addClass('fadeMeBabeOneMoreTime');
												}

											},

						out     : function(){
											if(correctedViewportW() >= base.options.serviceTogglerMinWidth){
													base.options.serviceFadeables.removeClass('fadeMeBabeOneMoreTime');
												}
											}
					});


				}

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: initServiceFadeout
		 * -----------------------------------------------------------------------------*/





		
		
		
		
		
		/**----------------------------------------------------------------------------- 
		 * initDesktopSearch
		 * ----------------------------------------------------------------------------- 
		 * toggles search button order:
		 * + if input is empty and someone clicks on 'search' icon, the form collapses
		 * + if input is not empty and someone clicks on 'search' icon, the form gets submitted
		 * 
		 * @private
		 * @this jQuery object 
		 * -----------------------------------------------------------------------------*/ 
		
			initDesktopSearch : function(){

				var _this = this,
						searchField = this.options.searchField,
						searchInput = this.options.searchToggler.prev();



				if(this.forceChecked){
					this.options.searchToggler.on('click touchend', function(){
						searchInput.prop('checked', !searchInput.prop('checked')).trigger('change');
						_this.options.searchToggler.next().toggleClass('checked');
					})
				}




				this.options.searchToggler.on('click touchend', function(){
					if(searchField.prop('value').length>0 && searchInput.is(':checked') && correctedViewportW()>960){
						searchField.next().trigger('click');
						return false;
					}


				});

			},
		 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: initDesktopSearch                                                    
		 * -----------------------------------------------------------------------------*/ 
		
		
		
		
		
		




		/*-----------------------------------------------------------------------------
		 * GLOBAL INIT
		 * -----------------------------------------------------------------------------*/
			init : function(){

				// init Quick Contact animations
				if(this.options.contactInput && this.options.contactContainer){
					this.initQuickContact();
				}


				//init Responsive animations
				if(this.options.subnavInput && this.options.subnav){
					this.initSubnav();
				}


				//init service menu animations
				if(this.options.serviceToggler && this.options.serviceFadeables.length>0){

					this.serviceContainer = $('#servicesNav', this.options.serviceToggler);

					if(this.serviceContainer){
						this.initServiceFadeout();
					}

				}
				
				
				
				//init searchToggle on desktops
				if(this.options.searchToggler.length>0 && this.options.searchField.length>0){
					this.initDesktopSearch();
				}

				

			}

	};
	/**-----------------------------------------------------------------------------
	 * ENDOF: PROTOTYPE METHODS
	 * -----------------------------------------------------------------------------*/








	/*-----------------------------------------------------------------------------
	 * PLUGIN WRAPPER
	 * -----------------------------------------------------------------------------
	 * A really lightweight plugin wrapper around the constructor,
	 * preventing against multiple instantiations
	 * -----------------------------------------------------------------------------*/
	$.fn[pluginName] = function(options){

		return this.each(function(){
			if(!$.data(this, "plugin_" + pluginName)){
				$.data(this, "plugin_" + pluginName, new Nav(this, options));
			}
		});

	};
	/**-----------------------------------------------------------------------------
	 * ENDOF: PLUGIN WRAPPER
	 * -----------------------------------------------------------------------------*/



})(jQuery, window, document);