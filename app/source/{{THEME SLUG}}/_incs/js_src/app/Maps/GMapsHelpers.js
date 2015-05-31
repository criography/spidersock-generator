/** ===================================================================================
 * Name     : Google Map Helpers
 * Version  : 1.0
 * URL      : https://github.com/criography/
 *
 * Author   : Marek Lenik / Criography
 *            http://criography.com
 *
 * Licensed under the MIT license.
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true, google:true */




var GMapsHelpers = (function(){
	"use strict";


/** =============================================================================
 * CONSTRUCTOR
 * =============================================================================
 * @constructor
 * @private
 * @param {object} el jQuery object upon which the plugin was called
 * @param {object} options parameters passed to the plugin
 * =============================================================================*/

	function Module(){}

/** =============================================================================
 * ENDOF: CONSTRUCTOR
 * =============================================================================*/









/**=============================================================================
 * PROTOTYPE METHODS
 * =============================================================================*/
	Module.prototype = {



/**-----------------------------------------------------------------------------
 * _loadFullMap
 * -----------------------------------------------------------------------------
 * Loads Full Map
 *
 * @param {string} api GMaps API
 * -----------------------------------------------------------------------------*/

	_loadFullMap : function(api){

		if(api){
			var script = document.createElement("script");
			script.type = "text/javascript";
			script.src = 'http://maps.googleapis.com/maps/api/js?key='+ api + '&sensor=false&callback=initializeMaps';
			document.body.appendChild(script);
		}

	},

/**-----------------------------------------------------------------------------
 * ENDOF: loadFullMap
 * -----------------------------------------------------------------------------*/









	/**-----------------------------------------------------------------------------
	 * _getStaticStyles
	 * -----------------------------------------------------------------------------
	 * converts styles array for regular Google Maps into a string for Static Maps usage
	 *
	 * @param styles Array Google Maps Styles Array
	 * @return string Static Maps Styles (requires '&' prefix)
	 * @source http://gmaps-samples-v3.googlecode.com/svn/trunk/styledmaps/wizard/StyledMapWizard.js
	 * -----------------------------------------------------------------------------*/

		_getStaticStyles : function(styles){
			var output=[];

			for(var i = 0; i < styles.length; i++){
				var styleRule = [];

				if(styles[i].featureType !== 'all'){
					styleRule.push('feature:' + styles[i].featureType);
				}

				if(styles[i].elementType !== 'all'){
					styleRule.push('element:' + styles[i].elementType);
				}

				for(var j = 0; j < styles[i].stylers.length; j++){
					for(var p in styles[i].stylers[j]){
						var ruleArg = styles[i].stylers[j][p];
						if(p === 'hue' || p === 'color'){
							ruleArg = '0x' + ruleArg.substring(1);
						}
						styleRule.push(p + ':' + ruleArg);
					}
				}

				var rule = styleRule.join('|');
				if(rule !== ''){
					output.push('style=' + rule);
				}
			}


			return(output.join('&'));
		}

	/**-----------------------------------------------------------------------------
	 * ENDOF: getStaticStyles
	 * -----------------------------------------------------------------------------*/


	};







	return new Module();

});