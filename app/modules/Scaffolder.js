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
var mustache = require('mustache');


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
			},
			function(cb) {

				async.parallel(
					[
						function (innercb) {
							_this.generateEnv(innercb);
						},
						function (innercb) {
							_this.createLocalConfig(innercb);
						}
					],

					function (error, results) {
						if (error) {
							return console.error(error);
						}

						cb();
					}
				);

			}
		],

	  function(error){
		  if (error) {
			  return console.error(error);
		  }

		  callback();
	  }
	);


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
				if (error) return console.error(err);
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

		if(config.answers['site#theme_slug']){
			config.paths.theme = path.join('./web/app/themes/', config.answers['site#theme_slug']);
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
 * Renames all directories and files to match answers and
 * updates references in all config files
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.correctFSPaths = function(cb){

		async.series(
			[
				function (innercb) {
					fs.rename('web', 'www', function(error) {
						//error

						config.paths.theme = path.join('./www/app/themes/', config.answers['site#theme_slug']);
						innercb(null, 'projectRoot');
					})
				},

				function (innercb) {
					fs.rename(
						path.join(config.paths.theme, '_incs/sass/{{THEME\ SLUG}}.scss'),
						path.join(config.paths.theme, '_incs/sass/' + config.answers['site#theme_slug'] + '.scss'),
						function(error) {
							//error

							innercb(null, 'sassController');
						}
					)
				},

				function(innercb){


					File.replacer(
						[
							'./wp-cli.yml',
							'./composer.json',
							'./.travis.yml',
							'./.gitignore',
							'./config/application.php'
						],
						"web/",
						"www/",
						innercb,
						null,
						null
					);

				}
			],
			function(error, result){
				if(error){
					return error;
				}
				Log.status('Docroot references updated');

				cb();
			}
		);

	};

/**-----------------------------------------------------------------------------
 * ENDOF: correctFSPaths
 * -----------------------------------------------------------------------------*/





/**-----------------------------------------------------------------------------
 * generateEnv
 * -----------------------------------------------------------------------------
 * Generates .env from .env.sample
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.generateEnv = function(cb){
		var _env = '';

		fs.readFile(
			path.join(config.paths.templates, '.env'), 'utf8', function (error, data) {
				if (error) {
					return console.log(err);
				}

				fs.writeFile(
					'./.env', mustache.render(data, config.answers), {mode:420}, function (error) {
						if (error) return console.log(error);

						Log.status('.env file generated');
						cb();
					}
				);

			}
		);

	};

/**-----------------------------------------------------------------------------
 * ENDOF: generateEnv
 * -----------------------------------------------------------------------------*/




/**-----------------------------------------------------------------------------
 * createLocalConfig
 * -----------------------------------------------------------------------------
 * Generates local.php environment config based on development.php
 *
 * @constructor
 * @private
 * @this    {object}            Main object
 * @param   {function}  cb      Promise callback
 * @return  {void}
 * -----------------------------------------------------------------------------*/

	Scaffolder.prototype.createLocalConfig = function(cb){
		fs.copy(
			'./config/environments/development.php', './config/environments/local.php', function (err) {
				if (err) return console.error(err);

				Log.status('Local environment config created');

				cb();
			}
		);

	};

/**-----------------------------------------------------------------------------
 * ENDOF: createLocalConfig
 * -----------------------------------------------------------------------------*/





module.exports = Scaffolder;