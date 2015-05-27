/** ===================================================================================
 * Name     : ContactForm7_Override
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik / Criography
 *            http://criography.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * Overrides CF7 default error mssage handling on mouseover/out and introduces basic inline validation
 *
 * @dependency jQuery
 * @dependency scripts.js ContactForm7 originl JS located in its plugin folder. Manually append in Footer!
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true */


(function($, window, document, undefined){
	"use strict"

	var pluginName = 'ContactForm7_Override',
		defaults = {
									c7_messages       : { required  : 'Please fill the required field.',
																				email     : 'Email address seems invalid.'
																			},
									hasExtraWrappers  : false
		};


	/* -----------------------------------------------------------------------------
	 * ContactForm7_Override
	 * -----------------------------------------------------------------------------
	 * @constructor
	 * @private
	 * @param {object} el jQuery object upon which the plugin was called
	 * @param {object} options parameters passed to the plugin
	 * -----------------------------------------------------------------------------*/

	function ContactForm7_Override(element, options){
		this.element        = element;
		this.options        = $.extend({}, defaults, options);
		this.errorCount     = [];
		this.formContainer  = {};
		this.fields         = {};
		this.submitButton   = {};
		this.initialRun     = true;

		this.init();
	}

	/* -----------------------------------------------------------------------------
	 * ENDOF: ContactForm7_Override
	 * -----------------------------------------------------------------------------*/





	/* -----------------------------------------------------------------------------
	 * HELPERS
	 * -----------------------------------------------------------------------------*/

			/**-----------------------------------------------------------------------------
			 * validateEmail
			 * -----------------------------------------------------------------------------
			 * @private
			 * @param str string
			 * @return boolean
			 * -----------------------------------------------------------------------------*/
		
				var validateEmail = function(str) {
					return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(str);
		
				};
		
			/**-----------------------------------------------------------------------------
			 * ENDOF: validateEmail
			 * -----------------------------------------------------------------------------*/
	
	/* -----------------------------------------------------------------------------
	 * ENDOF: HELPERS
	 * -----------------------------------------------------------------------------*/











	/**-----------------------------------------------------------------------------
	 * PROTOTYPE METHODS [DOM/SUBJECT RELATED]
	 * -----------------------------------------------------------------------------*/
	ContactForm7_Override.prototype = {

				
			/**-----------------------------------------------------------------------------
			 * this.validateFields
			 * -----------------------------------------------------------------------------
			 * @private
			 * -----------------------------------------------------------------------------*/
		
				validateFields : function($field){
		
		
						var errorContainer  = this.options.hasExtraWrappers ? $field.parent().next() : $field.next(),
								value           = $field.val(),
								isInvalid       = 0;
		
						//set up and define error container if not present
						if(errorContainer.length<1){
							if(this.options.hasExtraWrappers){
								errorContainer = $('<span class="wpcf7-not-valid-tip"></span>').fadeOut().insertAfter($field.parent());
							}else{
								errorContainer = $('<span class="wpcf7-not-valid-tip"></span>').fadeOut().insertAfter($field);
							}
						}

						// VALIDATE
						// -----------

						//empty (yep, there's no way to switch the script off for CF7. I seriously hate this plugin)
						if(value.length === 0 || value === $field.attr('placeholder')){
		
							if(!this.initialRun){
								errorContainer.text(this.options.c7_messages.required).fadeIn();
								$field.parent().addClass('form-error').removeClass('form-correct');
							}
		
							isInvalid = 1;
		
						//not empty
						}else{
		
							//email
							if($field.is('.wpcf7-email')){
		
								//valid
								if( validateEmail(value) ){
									if(!this.initialRun){
										errorContainer.fadeOut();
										$field.parent().removeClass('form-error').addClass('form-correct');
									}
		
									isInvalid = 0;
		
									//invalid
								}else{
									if(!this.initialRun){
										errorContainer.text(this.options.c7_messages.email).fadeIn();
										$field.parent().addClass('form-error').removeClass('form-correct');
									}
		
									isInvalid = 1;
								}
		
							//alles gut
							}else{
								if(!this.initialRun){
									errorContainer.fadeOut();
									$field.parent().removeClass('form-error').addClass('form-correct');
								}
		
								isInvalid = 0;
							}
		
		
						}
		
						return isInvalid;
		
		
				},
		
			/**-----------------------------------------------------------------------------
			 * ENDOF: this.validateFields
			 * -----------------------------------------------------------------------------*/
		
		
		
				
				
				
				
			/**-----------------------------------------------------------------------------
			 * this.validateCall
			 * -----------------------------------------------------------------------------
			 * @private
			 * -----------------------------------------------------------------------------*/
		
				validateCall : function(el){
					this.errorCount[this.fields.index(el)] = this.validateFields(el);
				},
		
			/**-----------------------------------------------------------------------------
			 * ENDOF: this.validateCall
			 * -----------------------------------------------------------------------------*/
				
				
				
				
				
				
						
			/**-----------------------------------------------------------------------------
			 * this.detectSubmitValidity
			 * -----------------------------------------------------------------------------
			 * Enables/Disables Submit button
			 *
			 * @private
			 * @return bool true if good to go, false if errors
			 * -----------------------------------------------------------------------------*/
		
				detectSubmitValidity : function(){
					var sum=0;
		
					for( var err = 0; err < this.errorCount.length; err++ ){
						sum+= parseInt(this.errorCount[err], 10);
					}
		
					return (sum===0);
		
				},
		
			/**-----------------------------------------------------------------------------
			 * ENDOF: this.detectSubmitValidity
			 * -----------------------------------------------------------------------------*/
				
				
				
				
				
				
				
			/**-----------------------------------------------------------------------------
			 * this.main_cf7override
			 * -----------------------------------------------------------------------------
			 * MAIN CF7 OVERRIDE. USE WITH CAUTION!
			 *
			 * @return {object} a set of jQuery element [input] objects
			 * -----------------------------------------------------------------------------*/
		
				main_cf7override : function(){
		
					$.fn.wpcf7NotValidTip = function(message) {
						return this.each(function() {
							var into = $(this);
							into.append('<span class="wpcf7-not-valid-tip">' + message + '</span>');
						});
					};
		
				},
		
			/**-----------------------------------------------------------------------------
			 * ENDOF: this.main_cf7override
			 * -----------------------------------------------------------------------------*/







			/**-----------------------------------------------------------------------------
			 * this.onSuccess
			 * -----------------------------------------------------------------------------
			 * All Scripts to be triggered upon form submision being successful
			 *
			 * @return {object} a set of jQuery element [input] objects
			 * -----------------------------------------------------------------------------*/

				onSuccess : function(formId){

						ga('send', {
							'hitType'      : 'event',
							'eventCategory': 'Email Sent',
							'eventAction'  : formId || 'Form'
						});
						_gaq.push([ '_trackEvent', 'Email Form', 'Email Sent', formId || 'Form']);

						console.log(formId);

				},

			/**-----------------------------------------------------------------------------
			 * ENDOF: this.onSuccess
			 * -----------------------------------------------------------------------------*/

				
				
				
				
				
				init: function(wrappers){
					var _this = this;

					this.formContainer     = $(this.element);
					this.fields            = this.formContainer.find('[class*="wpcf7-validates-as"]');
					this.submitButton      = this.formContainer.find('[type="submit"]');


					//override CF7
					this.main_cf7override();
		
		
					//manage click events
					this.submitButton.on('click touchend', function(e){
		
		
						//revalidate Fields
						for(var f = 0, totalFields = _this.fields.length; f < totalFields; f++){
							_this.validateCall(_this.fields.eq(f));
						}

		
		
						//control the button clickability
						if(!_this.detectSubmitValidity()){
							e.preventDefault();
						}
					});
		
		


					//validateFields(fields);

					for(var f = 0, totalFields = this.fields.length; f < totalFields; f++){

						//generate initial status and error count
						this.validateCall(this.fields.eq(f));

						//populate error count on blur
						this.fields.eq(f).on('blur', function(){
							_this.validateCall($(this));
						});
					}


					$('.ajax-loader').attr('src', 'data:image/gif;base64,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');
					this.initialRun=false;
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
			if( !$.data(this, "plugin_" + pluginName) ){
				$.data(this, "plugin_" + pluginName, new ContactForm7_Override(this, options));
			}
		});

	};
	/**-----------------------------------------------------------------------------
	 * ENDOF: PLUGIN WRAPPER
	 * -----------------------------------------------------------------------------*/


})(jQuery, window, document);