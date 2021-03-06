/* ===================================================================================
 * Name     : Module
 * Version  : 1.0
 * URL      : https://github.com/criograhy/
 *
 * Author   : Marek Lenik / Criography
 *            http://criography.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * description
 *
 * @DEPENDS jQuery 1.10.2
 * =================================================================================== */

/*jshint smarttabs: true */
/*global jQuery:true, Modernizr:true */

var Module = function () {


	var config  = { default   : 1,
									default2  : true
								};











	/* ===================================================================================
	 * HELPERS / PRIVATE METHODS
	 * ===================================================================================*/


		/* -----------------------------------------------------------------------------
		 * _privateMethod
		 * -----------------------------------------------------------------------------
		 * Description of the method
		 *
		 * @private
		 * @param {object} attr Description of the attribute
		 * -----------------------------------------------------------------------------*/

 			var _privateMethod = function _privateMethod(attr){

			},

		/* -----------------------------------------------------------------------------
		 * ENDOF: _privateMethod
		 * -----------------------------------------------------------------------------*/


	/* ===================================================================================
	 * ENDOF: HELPERS
	 * ===================================================================================*/











	/**===================================================================================
	 * PUBLIC METHODS
	 * ===================================================================================*/

		/**-----------------------------------------------------------------------------
		 * otherMethod
		 * -----------------------------------------------------------------------------
		 * Description
		 *
		 * @this {object} main object
		 * @return {bool} description
		 * -----------------------------------------------------------------------------*/

			otherMethod = function(){

				return true;
			},

		/**-----------------------------------------------------------------------------
		 * ENDOF: otherMethod
		 * -----------------------------------------------------------------------------*/









		/**-----------------------------------------------------------------------------
		 * init
		 * -----------------------------------------------------------------------------
		 * Description
		 *
		 * @this {object} main object
		 * -----------------------------------------------------------------------------*/

			init = function(){
		    /* if you need to call upon this from a nested function, make sure to cache it put it in a local scope by:
		    * var _this = this;
		    */

				/* describe what's (and why, if necessary) being called here */
				otherMethod();

			};

		/**-----------------------------------------------------------------------------
		 * ENDOF: init
		 * -----------------------------------------------------------------------------*/


	/**===================================================================================
	 * ENDOF: PUBLIC METHODS
	 * ===================================================================================*/









	/* ===================================================================================
	 * MODULE GATEWAY
	 * ===================================================================================*/
		return {

			/* called upon init */
			init : function(){
				init();
			},


			/* called upon some other event */
			otherMethod : function(){
				otherMethod();
			}

		};
	/* ===================================================================================
	 * ENDOF: MODULE GATEWAY
	 * ===================================================================================*/

}();