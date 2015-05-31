"use strict";
/*jshint smarttabs: true */


// Private
var inquirer  = require('inquirer');
var ipRegex   = require('ip-regex');
var chalk     = require('chalk');
var _         = require('underscore');
var config    = require('../Config.js');



var Prompter = function Prompter(name) {
	var _this = this;

	this.defaults = {

		env : {
			server   : 'nginx',                       /* 'nginx' || 'apache' */
			db       : 'mariadb',                     /* 'mariadb' || 'mysql' */
			php_dev  : 'hhvm@5.6',
			php_live : '5.6'
		},

		db : {
			name     : 'wordpress',
			username : 'spider',
			password : 'sock',
			host     : 'localhost'
		},

		wp_theme : {
			name        : '',
			description : '',
			slug        : '',
			version     : '1.0'
		},

		wp_plugins : {
			debug      : {
				install:true
			},
			gravity    : {
				install : true,
				key     : ''
			},
			acf        : {
				install : true,
				key     : ''
			},
			migrate_db : {
				install : true,
				key     : ''
			}
		},

		wp_admin : {
			username : '',
			password : '',
			email    : ''
		}
	};


	this.answers = {};


	this.questions =[
		/*{ type    : "list",
			name    : "env#server",
			message : "Which server do you want to use?",
			summary_message : "Server",
			choices : [
				"nginx",
				"apache"
			],
			default : _this.defaults.env.server
		},

		{ type    : "list",
			name    : "env#db",
			message : "Which database do you want to use?",
			summary_message : "Database Engine",
			choices : [
				"mariadb",
				"mysql"
			],
			default : _this.defaults.env.db
		},

		{ type    : "list",
			name    : "env#php_dev",
			message : "Which php version do you want to use?",
			summary_message : "PHP @development",
			choices : [
				"5.5",
				"5.6",
				"hhvm@5.6"
			],
			default : _this.defaults.env.php_dev
		},

		{ when     : function (props) {
				return props["env#php_dev"].indexOf('hhvm')>-1;
			},
			name     : "env#php_live",
			type     : 'confirm',
			message  : 'Do you want to use non-HHVM PHP (same version) for production?',
			summary_message : "PHP @production",
			default  : false
		},

		{ type     : "input",
			name     : "db#name",
			message  : "What database name do you want to use for WP? [a-zA-Z0-9_]{4,}",
		 summary_message : "DB Name",
			validate : function (value) {
				var pass = value.match(/^[a-zA-Z0-9_]{4,}$/i);
				if (pass) {
					return true;
				} else {
					return "Alphanumeric symbols and _, please. Min 4 characters";
				}
			},
			default : _this.defaults.db.name
		},

		{ type     : "input",
			name     : "db#username",
			message  : "What database username do you want to use? [a-zA-Z0-9_]{4,}",
		 summary_message : "DB username",
			validate : function (value) {
				var pass = value.match(/^[a-zA-Z0-9_]{4,}$/i);
				if (pass) {
					return true;
				} else {
					return "Alphanumeric symbols and _, please. Min 4 characters";
				}
			},
			default:_this.defaults.db.username
		},

		{ type     : "input",
			name     : "db#password",
			message  : "What database password do you want to use? (min 4 characters or leave empty to generate)",
		 summary_message : "DB password",
			validate : function (value) {
				var pass = value.length>=4;
				if (pass) {
					return true;
				} else {
					return "Min 4 characters";
				}
			},
			default : _this.defaults.db.password
		},

		{ type     : "input",
			name     : "db#host",
			message  : "What database host do you want to use? (IP or hostname)",
		 summary_message : "DB host",
			validate : function (value) {
				var pass = ipRegex({exact : true}).test(value) ||
				           value.match(/^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$/);
				if (pass) {
					return true;
				} else {
					return "Please use valid IP or hostname";
				}
			},
			default : _this.defaults.db.host
		},*/

		{ type     : "input",
			name     : "wp_theme#name",
			message  : "What's the website's name/title? (min 4 characters)",
		 summary_message : "Theme Name",
			validate : function (value) {
				var pass = value.length>=4;
				if (pass) {
					return true;
				} else {
					return "Min 4 characters";
				}
			}
		},

		 { type     : "input",
			 name     : "wp_theme#slug",
			 message  : "What's the theme's slug? (min 4 characters)",
			 summary_message : "Theme Slug",
			 validate : function (value) {
				 var pass = value.length>=4;

				 if (pass) {
				  return true;
				 } else {
				  return "Min 4 characters";
				 }
			 },
			 default: function(props){
				return props['wp_theme#name'].
								replace(/[\s]+/g, '_').
								replace(/[\.,-\/#!$%\^&\*;:{}=`~()]/g, "").
								replace(/[_\s]+/g, '-').
								toLowerCase();
			 }
		 }/*,

		{ type     : "input",
			name     : "wp_theme#description",
			message  : "What's the website's description? (max 128 chars)",
			summary_message : "Site Description",
			validate : function (value) {
				var pass = value.length<=128;
				if (pass) {
					return true;
				} else {
					return "Max 128 characters";
				}
			}
		},


		{ type     : "input",
			name     : "wp_theme#slug",
			message  : "What's the website's/theme's version? ^([\d]+\.)*[\d]+$, e.g.: 2.1",
			summary_message : "Theme Version",
			validate : function (value) {
				var pass = value.match(/^([\d]+\.)*[\d]+$/);
				if (pass) {
					return true;
				} else {
					return "try to follow ^([\d]+\.)*[\d]+$ convention";
				}
			},
			default: _this.defaults.wp_theme.version
		},

		{ type    : "checkbox",
			name    : "wp_plugins",
			message : "Which additional plugins sets do you want to use?",
			summary_message : "Plugin Sets",
			choices : function(){
				var _choices = [];
				Object.keys(_this.defaults.wp_plugins).forEach(
					function (key) {

						_choices.push({
							name : key,
							checked : _this.defaults.wp_plugins[key].install
						});

					}
				);

				return _choices;
			}
		},

		{ when    : function (props) {
				 return props.wp_plugins.indexOf('gravity') > -1;
			},
			name    : "wp_plugins#gravity_key",
			type    : 'input',
			validate : function (value) {
				return value.length>4;
			},
			message : 'Paste your Gravity Forms key here:',
		 summary_message : "Gravity Forms Key"
		},

		{ when    : function (props) {
				 return props.wp_plugins.indexOf('acf') > -1;
			},
			name    : "wp_plugins#acf_key",
			type    : 'input',
			validate : function (value) {
				return value.length > 4;
			},
			message : 'Paste your Advanced Custom fields Pro key here:',
		 summary_message : "ACF Pro Key"
		},

		{ when    : function (props) {
				 return props.wp_plugins.indexOf('migrate_db') > -1;
			},
			name    : "wp_plugins#migratedb_key",
			type    : 'input',
			validate : function (value) {
				return value.length > 4;
			},
			message : 'Paste your Migrate DB key here:',
		 summary_message : "Migrate DB Key"
		},

		{ type    : "input",
			name    : "wp_admin#username",
			message : "What username do you want to use for WP?",
		 summary_message : "WP Admin username",
			validate : function (value) {
				var pass = value.match(/^[a-zA-Z0-9_]{4,}$/i);
				if (pass) {
					return true;
				} else {
					return "Alphanumeric symbols, ._- and space, please. Min 3 characters";
				}
			}
		},

		{ type     : "password",
			name     : "wp_admin#password",
			message  : "What's the password you want to use for WP? (leave empty to generate it)",
		 summary_message : "WP Admin password",
			filter : function(value){
				if(!value){
					value = Math.random().toString(36).substr(2) + Math.random().toString(36).substr(2, 6);
				}

				return value;
			}
		},

		{ type     : "input",
			name     : "wp_admin#email",
			message  : "What's your email address?",
		 summary_message : "WP Admin email",
			validate : function (value) {
				var pass = value.match(/^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/);
				if (pass) {
					return true;
				} else {
					return "Please enter a valid email address";
				}
			}
		}
*/



	];

};





Prompter.prototype.init = function (callback) {
	var _this = this;

	inquirer.prompt(
		_this.questions, function (answers) {

			_this.answers = answers;

			console.log(' ');
			console.log('----------------------------------------------');
			console.log(' SUMMARY OF YOUR CHOICES:  ');
			console.log('----------------------------------------------');
			console.log(' ');

			var _answers = _.each(
				answers, function (answerValue, index) {

					var _currentQuestion = _.find(_this.questions, function(question){
						return question.name === index;
					});

					if(index==='env#php_live'){
						answerValue = answerValue ? answers['env#php_dev'].split('hhvm@').join('') : answers['env#php_dev'];
						_this.answers[index] = answerValue;
					}

					console.log(
						chalk.white.bgYellow.bold('[#] ') + ' ' +
						chalk.white.bold(_currentQuestion.summary_message) +': ' +
						chalk.cyan(answerValue)
					);
				}
			);

			config.answers = _this.answers;

			console.log(' ');
			console.log('----------------------------------------------');
			inquirer.prompt(
				[{
					 type            : "list",
					 name            : "proceed",
					 message         : "Shall we proceed?",
					 choices         : [
						 "go nuts",
						 "abort"
					 ],
					 default         : 'go nuts'
				 }],
				function (answers) {
					if(answers.proceed==='go nuts'){

						callback();
					}
				}
			);

		}

	);
};





Prompter.prototype.getOptions = function () {
	return this.answers;
};




Prompter.prototype.getOption = function (key) {
	return this.answers[key];
};




Prompter.prototype.setOption = function (key, value) {
	return this.answers[key] = value;
};




module.exports = Prompter;