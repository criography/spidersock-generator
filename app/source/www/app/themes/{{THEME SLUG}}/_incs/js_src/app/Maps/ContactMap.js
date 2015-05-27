/** ===================================================================================
 * Name     : ContactMap
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik / Criography
 *            http://criography.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * @todo add overlays with animations
 * @dependency Google Maps API
 * @dependency jQuery
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true, google:true */


(function($, window, document, undefined){
	"use strict";

	var pluginName = 'ContactMap',
		defaults = {};


	/** =============================================================================
	 * CONSTRUCTOR
	 * =============================================================================
	 * @constructor
	 * @private
	 * @param {object} el jQuery object upon which the plugin was called
	 * @param {object} options parameters passed to the plugin
	 * =============================================================================*/

		function ContactMap(element, options){
			this.element    = element;
			this.options    = $.extend({}, defaults, options);
			this.map        = {};
			this.mapOptions = {};
			this.markers    = [];
			this.center     = {};


			this.init();
		}

	/** =============================================================================
	 * ENDOF: CONSTRUCTOR
	 * =============================================================================*/








	/** =============================================================================
	 * HELPERS
	 * =============================================================================*/

		function getPoint(x, y){
			if( $.type(x) === 'array'){
				y = x[1];
				x = x[0];
			}

			return new google.maps.LatLng(x, y);
		}


	/** =============================================================================
	 * ENDOF: HELPERS
	 * =============================================================================*/










	/**=============================================================================
	 * PROTOTYPE METHODS
	 * =============================================================================*/
		ContactMap.prototype = {





		/**----------------------------------------------------------------------------- 
		 * addMarker
		 * ----------------------------------------------------------------------------- 
		 * + adds a Marker to the array
		 * + renders a Marker 
		 *
		 * @this					object							Main Object also referred to as _this 
		 * @param coords	google.maps.LatLng	GM coordinates object
		 * -----------------------------------------------------------------------------*/ 
	
			addMarker : function(coords){
				var _this = this;
	
	
				this.markers.push(
					new google.maps.Marker({
						position : coords,
						map      : _this.map,
						icon     : '/_incs/images/front/mapMarker-large.png'
					})
				);
	
			},
	 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: addMarker                                                    
		 * -----------------------------------------------------------------------------*/ 
	
	
	
	
	
	
	
	
		/**----------------------------------------------------------------------------- 
		 * addCentralMarker
		 * ----------------------------------------------------------------------------- 
		 * + adds a Marker to a map center
		 *
		 * @this object Main Object also referred to as _this 
		 * -----------------------------------------------------------------------------*/ 
	
			addCentralMarker: function(){
	
				this.addMarker(getPoint(this.options.center[0], this.options.center[1]));
	
			},
	 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: addCentralMarker                                      
		 * -----------------------------------------------------------------------------*/ 








		/**----------------------------------------------------------------------------- 
		 * draw
		 * ----------------------------------------------------------------------------- 
		 * Init map drawing
		 *
		 * @this object Main Object also referred to as _this 
		 * -----------------------------------------------------------------------------*/ 
	
			draw : function(){
				this.map = new google.maps.Map(this.element, this.mapOptions);
				this.addCentralMarker();
			},
	 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: draw                                             
		 * -----------------------------------------------------------------------------*/ 









		/**----------------------------------------------------------------------------- 
		 * centerMap
		 * ----------------------------------------------------------------------------- 
		 * Animate the map so it's cnetered. 
		 * Used after browser resize
		 *
		 * @this object Main Object also referred to as _this 
		 * -----------------------------------------------------------------------------*/ 
	
			centerMap :function(){
				this.map.panTo(this.center);
			},
	 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: centerMap                                               
		 * -----------------------------------------------------------------------------*/ 









		/**----------------------------------------------------------------------------- 
		 * init
		 * ----------------------------------------------------------------------------- 
		 * processes all variables and inits drawing
		 * -----------------------------------------------------------------------------*/ 
	
			init : function(){
				this.center = getPoint(this.options.center[0] + this.options.centerVoffset, this.options.center[1]);
	
				this.mapOptions = {
					zoom                   : this.options.zoom,
					center                 : this.center,
					disableDefaultUI       : !this.options.ui,
					mapTypeId              : google.maps.MapTypeId.ROADMAP,
					styles                 : this.options.styles,
					scrollwheel            : this.options.events.scroll,
					scaleControl           : this.options.events.click,
					zoomControl            : this.options.events.click,
					disableDoubleClickZoom : !this.options.events.click,
					draggable              : this.options.events.drag
				};
	
	
				this.draw();
				this.addCentralMarker();
			}
	 
		/**----------------------------------------------------------------------------- 
		 * ENDOF: init                                                    
		 * -----------------------------------------------------------------------------*/ 



	};
	/**=============================================================================
	 * ENDOF: PROTOTYPE METHODS
	 * =============================================================================*/








	/*=============================================================================
	 * PLUGIN WRAPPER
	 * =============================================================================
	 * A really lightweight plugin wrapper around the constructor,
	 * preventing against multiple instantiations
	 * =============================================================================*/
	$.fn[pluginName] = function(options){

		return this.each(function(){
			if( !$.data(this, "plugin_" + pluginName) ){
				$.data(this, "plugin_" + pluginName, new ContactMap(this, options));
			}
		});

	};
	/**=============================================================================
	 * ENDOF: PLUGIN WRAPPER
	 * =============================================================================*/


})(jQuery, window, document);