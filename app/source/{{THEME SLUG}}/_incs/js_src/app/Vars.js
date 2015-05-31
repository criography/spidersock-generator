/* ===================================================================================
 * Name     : Globally Scoped Vars Object
 * Version  : 1.0
 * URL      : https://github.com/criograhy/
 *
 * Author   : Marek Lenik / Criography
 *            http://criography.com
 *
 * Licensed under the MIT license.
 * ===================================================================================
 * restrict to minimum, mostly to dirty sniffs (if Modernizr is not enough) and commonly used values…
 *
 * @DEPENDS Common Sense
 * =================================================================================== */



var Vars = {

	isIE10	    : (document.body.style.msTouchAction != undefined),

	isIE9		    : (document.documentElement.className.indexOf('lte-ie9')>-1),

	isIE8		    : (document.documentElement.className.indexOf('lte-ie8')>-1),

	isWebkit    : 'WebkitAppearance' in document.documentElement.style,

	isHome	    : (document.documentElement.className.indexOf('body-home')>-1),

	gmapsAPIKey : ''


};