/** ===================================================================================
 * Name     : Tabs
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik / Aardvark London
 *            http://aardvarklondon.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * Expands CSSonly tabbed menu with animations
 *
 * @dependency jQuery
 * @dependency Vars
 * @dependency Modernizr
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true, Vars:true */


(function($, window, document, undefined){
	"use strict";

	var pluginName  = 'Tabs',
			defaults    = {
											duration        : 300,
											easing          : 'linear',
											paginationHTML  : ['<li class="tab__label">', '</li>'],
											infinite        : false
										};


	/* -----------------------------------------------------------------------------
	 * Accordion
	 * -----------------------------------------------------------------------------
	 * @constructor
	 * @private
	 * @param {object} element jQuery object upon which the plugin was called
	 * @param {object} options parameters passed to the plugin
	 * -----------------------------------------------------------------------------*/

	function Tabs(element, options){

		this.element              = element;
		this.options              = $.extend({}, defaults, options);
		this.contentWrapper				= $('.tabs__contentWrapper', this.element);																/* content wrapper */
		this.contents							= this.contentWrapper.children();																	/* all tab contents */
		this.inputs               = $('.tab__input', this.element);																	/* all radio instances */
		this.controllerContainer  = $('.tabs__labels', this.element);																/* label container */
		this.labels               = $('.tab__labelContainer', this.controllerContainer);						/* all numeric labels */
		this.forceLabelClearing		= document.documentElement.className.indexOf('force-checked')>-1;	/* Android browser fails to clear inactive labels. Force the bastard */

		this.localData    = $(this.element).data();
		this.currentTab   = 0;
		this.totalTabs    = this.inputs.length;
		this.ignoreChange = 0;

		//init animations
		if(!Vars.isIE8){
			this.init();
		}else{
			this.ie8Init();
		}


	}

	/* -----------------------------------------------------------------------------
	 * ENDOF: Accordion
	 * -----------------------------------------------------------------------------*/






	/**-----------------------------------------------------------------------------
	 * PROTOTYPE METHODS [DOM/SUBJECT RELATED]
	 * -----------------------------------------------------------------------------*/
	Tabs.prototype = {













		/**-----------------------------------------------------------------------------
		 * slideTabs
		 * -----------------------------------------------------------------------------
		 * slides Tab Container and auto resizes it to compensate for different slide heights
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			slideTabs: function(){
				var _this = this;

					this.contentWrapper.css({
						transform : 'translateX(-'+( (_this.currentTab / _this.totalTabs) * 100 )+'%)'
					}).animate({height: _this.contents.eq(_this.currentTab).outerHeight()}, _this.options.duration, _this.options.easing, function(){

						_this.contents.eq(_this.currentTab).css('position', 'relative').siblings().css('position', '');
						$(this).css('height', 'auto');

					});

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: slideTabs
		 * -----------------------------------------------------------------------------*/












		/**-----------------------------------------------------------------------------
		 * changeTab
		 * -----------------------------------------------------------------------------
		 * Changes current tab by using Prev/Next buttons
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * @param {mixed} tab - for Previous, + for Next, number for specific tab
		 * -----------------------------------------------------------------------------*/

			changeTab: function(tab){
		    var _this = this,
			      curr = 0;

			/* if(this.infinite){
					maybe one day (;

				}else{ */

					if(tab==='-'){
						curr = this.currentTab === 0 ? this.totalTabs-1 : this.currentTab-1;

						this.ignoreChange = 1;                       /* prevent double event firing */
						this.inputs.eq(curr).prop('checked', true);
						this.currentTab = curr;
						this.ignoreChange = 0;                        /* allow new event firing */

					}else if(tab==='+'){

						curr = this.currentTab === this.totalTabs-1 ? 0 : this.currentTab+1;

						this.ignoreChange = 1;                      /* prevent double event firing */
						this.inputs.eq(curr).prop('checked', true);
						this.currentTab = curr;
						this.ignoreChange = 0;                      /* allow new event firing */

					}else{

						this.currentTab = parseInt(_this.inputs.filter(':checked').val(), 10);

					}


					/* force label clearing for android and any other failing browser */
					if(this.forceLabelClearing){
						this.labels.find('label').addClass('tab__label--inactive').removeClass('tab__label--active').end().
							eq(this.currentTab).find('label').addClass('tab__label--active').removeClass('tab__label--inactive');
					}



					this.slideTabs();

			/*	}*/
			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: changeTab
		 * -----------------------------------------------------------------------------*/









		/**-----------------------------------------------------------------------------
		 * initNumericPagination
		 * -----------------------------------------------------------------------------
		 * add event listeners to numeric pagination
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			initNumericPagination: function(){

				var _this = this;

				_this.inputs.on('change', function(){

					if(_this.ignoreChange === 0){  /* prevent double event firing */
						_this.changeTab('');
					}

				});

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: initNumericPagination
		 * -----------------------------------------------------------------------------*/










		/**-----------------------------------------------------------------------------
		 * addIncrementalPagination
		 * -----------------------------------------------------------------------------
		 * adds PREV and NEXT buttons
		 *
		 * @private
		 * @this jQuery Object, also referred to as _this
		 * -----------------------------------------------------------------------------*/

			addIncrementalPagination: function(){
				var _this = this;

				$(this.options.paginationHTML.join(this.localData.labelPrev)).addClass('tab__label--prev').prependTo(this.controllerContainer).
					on('click', function(){
						_this.changeTab('-');
				  });

				$(this.options.paginationHTML.join(this.localData.labelNext)).addClass('tab__label--next').appendTo(this.controllerContainer).
					on('click', function(){
						_this.changeTab('+');
					});

			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: addIncrementalPagination
		 * -----------------------------------------------------------------------------*/







			/**-----------------------------------------------------------------------------
			 * ie8Init
			 * -----------------------------------------------------------------------------
			 * provides with a simplified click events
			 *
			 * @private
			 * @this jQuery Object, also referred to as _this
			 * -----------------------------------------------------------------------------*/

				ie8Init : function(){

					var _this = this;
					$('label', _this.controllerContainer).first().addClass('tab__label--active').end().on('click', function(){
						$('label', _this.controllerContainer).removeClass('tab__label--active');
						$(this).addClass('tab__label--active');

					});
				},

			/**-----------------------------------------------------------------------------
			 * ENDOF: ie8Init
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

				/* position tabs */
				this.contents.each(function(i){
					$(this).css('left', i * 100/_this.totalTabs + '%');
				});


				/* transform CSS to allow sliding */
				$(this.element).addClass('tabs--isSlidable');



				/* reset all tabs and show 1st as default */
				this.inputs.eq(this.currentTab).prop('checked', true);


				/* adjust container's height to match current active tab */
				this.slideTabs();

				/* takeover numeric pagination */
				this.initNumericPagination();

				/* add PREV/NEXT buttons */
				this.addIncrementalPagination();

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
				$.data(this, "plugin_" + pluginName, new Tabs(this, options));
			}
		});

	};
	/**-----------------------------------------------------------------------------
	 * ENDOF: PLUGIN WRAPPER
	 * -----------------------------------------------------------------------------*/


})(jQuery, window, document);
