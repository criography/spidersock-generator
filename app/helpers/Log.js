"use strict";
/*jshint smarttabs: true */



var chalk = require('chalk');
var readline = require('readline');

var Log = function Log() {};




/**-----------------------------------------------------------------------------
 * _log
 * -----------------------------------------------------------------------------
 *
 * @private
 * @this  {object}
 * @param {string} msg desc
 * @param {string} type desc
 * @return
 * -----------------------------------------------------------------------------*/

var _log = function(msg, type){
	var prefix = '';

	switch (type) {
		case 'error':
			prefix = chalk.white.bgRed.bold(  '[spidersock] error:  ');
			break;

		case 'warn':
			prefix = chalk.white.bgRed.bold(  '[spidersock] warning:');
			break;

		default:
			prefix = chalk.white.bgGreen.bold('[spidersock] status: ');

	}

	console.log(prefix, msg );
};

/**-----------------------------------------------------------------------------
 * ENDOF: _log
 * -----------------------------------------------------------------------------*/





/**-----------------------------------------------------------------------------
 * _wait
 * -----------------------------------------------------------------------------
 * Renders animated status / spinner
 *
 * @constructor
 * @private
 * @this      {object}
 * @param     {string} msg      desc
 * @return    {string}
 * -----------------------------------------------------------------------------*/
var Wait = function Wait(msg) {
	this.symbols = ['♦   ', ' ♦  ', '  ♦ ', '   ♦', '  ♦ ', ' ♦  '];

	this.init(msg);
};


Wait.prototype.init = function (msg) {
	var _this = this,
			num   = 0;
	this.timer = setInterval(
		function () {
			_this.clearLine();

			process.stdout.write(
				chalk.white.bgMagenta('[' + _this.symbols[num] + ']') + ' ' + msg
			);

			num >= _this.symbols.length - 1 ? num = 0 :num++;
		}, 125
	);
};


Wait.prototype.clearLine = function(){
	readline.clearLine(process.stdout, 0);
	readline.cursorTo(process.stdout, 0);
};


Wait.prototype.destroy = function (msg, type) {
	var _this = this;

	if (this.timer) {
		_this.clearLine();
		clearInterval(_this.timer);

		if(msg){
			_log(msg, type);
		}
	}
};

		/**-----------------------------------------------------------------------------
		 * ENDOF: _wait
		 * -----------------------------------------------------------------------------*/



Log.prototype.error = function (msg) {
	_log(msg, 'error');
};

Log.prototype.warn = function (msg) {
	_log(msg, 'warn');
};

Log.prototype.status = function (msg) {
	_log(msg);
};

Log.prototype.wait = function (msg) {
	return new Wait(msg);
};








module.exports = new Log();