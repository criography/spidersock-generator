/** ===================================================================================
 * Name     : Accordion
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik / Aardvark London
 *            http://aardvarklondon.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * Expands CSSonly accordion menu with animations
 *
 * @dependency jQuery
 * @dependency Vars
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true, Vars:true */


(function($, window, document, undefined){
	"use strict";

	var pluginName  = 'Accordion',
			defaults    = {
											duration      : 300,
											easing        : 'linear',
											forceOpen     : false,
											scrollToView  : false
										},
			_body       = $("html, body");




	/* -----------------------------------------------------------------------------
	 * Accordion
	 * -----------------------------------------------------------------------------
	 * @constructor
	 * @private
	 * @param {object} element jQuery object upon which the plugin was called
	 * @param {object} options parameters passed to the plugin
	 * -----------------------------------------------------------------------------*/

	function Accordion(element, options){

		this.element = element;
		this.options = $.extend({}, defaults, options);
		this.contents	= $('.accordion-content', this.element);              /* all expandable blocks */
		this.inputs   = $('.accordion-input', this.element);   /* all radio instances */
		this.type    = this.inputs.eq(0).prop('type');


		//bind focus on labels to increase accessiblity
		//this.bindFocusToLabels();

		//init animations
		this.init();

	}

	/* -----------------------------------------------------------------------------
	 * ENDOF: Accordion
	 * -----------------------------------------------------------------------------*/






	/**-----------------------------------------------------------------------------
	 * PROTOTYPE METHODS [DOM/SUBJECT RELATED]
	 * -----------------------------------------------------------------------------*/
	Accordion.prototype = {



		/**-----------------------------------------------------------------------------
		 * bindFocusToLabels
		 * -----------------------------------------------------------------------------
		 * makes sure that interactivity is supported for tabbing as well
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			bindFocusToLabels: function(){
				var _this = this;

		    $('label', this.element).on('focus', function(){

					if($(this).data('tabid')  !== _this.inputs.filter(':checked').val()*1){
						_this.inputs.eq($(this).data('tabid')).prop('checked', true).trigger('change');
					}

		    });
			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: bindSpacesToLabels
		 * -----------------------------------------------------------------------------*/









		/**-----------------------------------------------------------------------------
		 * scrollToTab
		 * -----------------------------------------------------------------------------
		 * Scrolls screen to opened tab
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			scrollToTab: function(target){

				if(this.options.scrollToView){
					_body.animate({ scrollTop: (target.parent().offset().top - 30) }, 300, 'easeInOutQuad');
				}

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: ScrollToTab
		 * -----------------------------------------------------------------------------*/











		/**-----------------------------------------------------------------------------
		 * deactivatePanel
		 * -----------------------------------------------------------------------------
		 * disables given active panel
		 *
		 * @private
		 * @param target Object Panel to be deactivated
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			deactivatePanel: function(target){
				var _this = this;


				target.css('height', target.height()).stop().delay(1, function(){

					//animate it to 0
					$(this).stop().animate({height:0}, _this.options.duration, _this.options.easing, function(){

						//remove from the viewport and get rid of static height, so next activation can read the correct value
						$(this).removeClass('visible').css({height: ''}).
							parents('.accordion-item').removeClass('accordion-current');

					});
				});

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: deactivatePanel
		 * -----------------------------------------------------------------------------*/










		/**-----------------------------------------------------------------------------
		 * activatePanel
		 * -----------------------------------------------------------------------------
		 * activates given panel
		 *
		 * @private
		 * @param target Object Panel to be deactivated
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			activatePanel: function(target){
				var _this = this,
						targetHeight  = target.outerHeight()*1;


				target.addClass('visible').delay(1, function(){

					//animate to exact height, and remove strict height on case the browser is resized
					$(this).stop().animate({height: targetHeight}, _this.options.duration, _this.options.easing, function(){
						$(this).css('height', 'auto');
					}).parents('.accordion-item').addClass('accordion-current');

				});

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: activatePanel
		 * -----------------------------------------------------------------------------*/











		/**-----------------------------------------------------------------------------
		 * init
		 * -----------------------------------------------------------------------------
		 * introduces animations to compensate for lack of support for height:auto CSS transition
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			init: function(){
				var _this = this;

				//reset inputs
				if(_this.type==='radio'){
					_this.inputs.eq(0).prop('checked', true);
				}else{
					_this.inputs.prop('checked', false);
				}



				//force open the pre-checked or first section
				if(_this.type==='radio' || _this.options.forceOpen){
					_this.contents.eq(0).addClass('visible').css('height', 'auto').parents('li:first').addClass('accordion-current');
				}




				//uncheck the toggler input and add event listener
				$('.accordion-input', _this.element).on('change', function(e){

					var target        = _this.contents.eq($(this).prop('value') * 1);



					// with radios only 1 panel is visible at time
					if(_this.type==='radio'){

						// KILL ACTIVES
						// ------------
						$('.accordion-current', _this.element).find('.accordion-content').each(function(){
							_this.deactivatePanel($(this));
						});


						// ENABLE TARGET
						// -------------
						//move to the viewport, and set height to 0
						_this.activatePanel(target);


						// UPDATE SCROLL POSITION
						// ----------------------
							_this.scrollToTab(target);



					// with checkboxes you toggle each panel separately
					}else{

						// KILL ACTIVE
						// ------------
						if(target.hasClass('visible')){
							_this.deactivatePanel(target);


						// ENABLE TARGET
						// -------------
						}else{
							_this.activatePanel(target);


							// UPDATE SCROLL POSITION
							// ----------------------
								_this.scrollToTab(target);

						}

					}




				});

			}

		/**-----------------------------------------------------------------------------
		 * ENDOF: init
		 * -----------------------------------------------------------------------------*/






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
			if( !$.data(this, "plugin_" + pluginName) ){
				$.data(this, "plugin_" + pluginName, new Accordion(this, options));
			}
		});

	};
	/**-----------------------------------------------------------------------------
	 * ENDOF: PLUGIN WRAPPER
	 * -----------------------------------------------------------------------------*/


})(jQuery, window, document);
