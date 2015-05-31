"use strict";
/*jshint smarttabs: true */


// Private
var sanitize  = require('sanitize-filename');
var async     = require('async');
var fs        = require('fs-extra');
var path      = require('path');
var mkdirp    = require('mkdirp');
var ncp       = require('ncp');
var ipRegex   = require('ip-regex');
var chalk     = require('chalk');
var _         = require('underscore');
var util      = require('util');
var gitclone  = require('git-clone');
var rimraf  = require('rimraf');

var readdirSyncRecursive = require('fs-readdir-recursive');


var Log       = require('../helpers/Log');
var File      = require('../helpers/File');
var config    = require('../Config.js');



var Scaffolder = function Scaffolder(name) {
	var _this = this;
};





Scaffolder.prototype.init = function (callback) {
	var _this = this;


	async.series(
		[
			function (cb) {
				_this.plantWordpress(cb);
			},
			function (cb) {
				_this.plantTheme(cb);
			},
			function (cb) {
				_this.correctFSPaths(cb);
			}
			/*,

		 function(callback) {
		 async.parallel(
		 [],

		 function (err) {
		 callback();
		 });
		 }*/
		]
	);

	callback();
};



/**-----------------------------------------------------------------------------
 * plantWordpress
 * -----------------------------------------------------------------------------
 * Copies Project Scaffold into cwd
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise's callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.plantWordpress = function(cb){
		var spinner = Log.wait('Acquiring latest stable WP');

		gitclone('https://github.com/roots/bedrock.git', './', function(){
			spinner.destroy('WP skeleton installed');

			rimraf('.git', function(error){
				//error
				cb();
			});
		});

	};

/**-----------------------------------------------------------------------------
 * ENDOF: plantWordpress
 * -----------------------------------------------------------------------------*/







/**-----------------------------------------------------------------------------
 * plantTheme
 * -----------------------------------------------------------------------------
 * Copies Theme Scaffold into WP
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise's callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.plantTheme = function(cb){
		var spinner = Log.wait('Generating Theme Skeleton');

		if(config.answers['wp_theme#slug']){
			config.paths.theme = path.join('./web/app/themes/', config.answers['wp_theme#slug']);
			fs.mkdirsSync(config.paths.theme);
		}


		fs.copy(
			path.join(__dirname, '../source/{{THEME SLUG}}'), config.paths.theme, function (err) {
				if (err) return console.error(err);

				spinner.destroy('Theme Skeleton Generated');

				cb();
			}
		);

	};

/**-----------------------------------------------------------------------------
 * ENDOF: plantTheme
 * -----------------------------------------------------------------------------*/






/**-----------------------------------------------------------------------------
 * correctFSPaths
 * -----------------------------------------------------------------------------
 * Renames all directories and files to match answers
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.correctFSPaths = function(cb){

		async.series([
			function (cb) {
				fs.rename('web', 'www', function(error) {
					//error

					config.paths.theme = path.join('./www/app/themes/', config.answers['wp_theme#slug']);
					cb(null, 'projectRoot');
				})
			},

			function (cb) {
				fs.rename(
					path.join(config.paths.theme, '_incs/sass/{{THEME\ SLUG}}.scss'),
					path.join(config.paths.theme, '_incs/sass/' + config.answers['wp_theme#slug'] + '.scss'),
					function(error) {
						//error

						cb(null, 'sassController');
					}
				)
			}
		],
		function (error, results) {
			cb();
		}
	);

	};

/**-----------------------------------------------------------------------------
 * ENDOF: correctFSPaths
 * -----------------------------------------------------------------------------*/


module.exports = Scaffolder;