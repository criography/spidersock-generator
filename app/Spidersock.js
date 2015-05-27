"use strict";
/*jshint smarttabs: true */


// Private
var inquirer  = require('inquirer');
var sanitize  = require('sanitize-filename');
var async     = require('async');
var fs        = require('fs');
var path      = require('path');
var mkdirp    = require('mkdirp');
var ncp       = require('ncp');
var readdirSyncRecursive = require('fs-readdir-recursive');
var ipRegex = require('ip-regex');

var Log       = require('./helpers/Log');
var File      = require('./helpers/File');




var Spidersock = function Spidersock(name) {
	var _this = this;

	this.defaults = {

		env : {
			server : 'nginx',                       /* 'nginx' || 'apache' */
			db     : 'mariadb',                     /* 'mariadb' || 'mysql' */
			php    : 'hhvm@5.6'                     /* 'hhvm' ||'5.6' || '5.5' */
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
			debug      : true,
			gravity    : true,
			acf        : true,
			migrate_db : true
		},

		wp_admin : {
			username : '',
			password : '',
			email    : ''
		}
	};


	this.questions =[
		{ type    : "list",
			name    : "env#server",
			message : "Which server do you want to use?",
			choices : [
				"nginx",
				"apache"
			],
			default : _this.defaults.env.server
		},

		{ type    : "list",
			name    : "env#db",
			message : "Which database do you want to use?",
			choices : [
				"mariadb",
				"mysql"
			],
			default : _this.defaults.env.db
		},

		{ type    : "list",
			name    : "env#php",
			message : "Which php version do you want to use?",
			choices : [
				"5.5",
				"5.6",
				"hhvm@5.6"
			],
			default : _this.defaults.env.php
		},

		{
			type     : "input",
			name     : "db#name",
			message  : "What database name do you want to use for WP? [a-zA-Z0-9_]{4,}",
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

		{
			type     : "input",
			name     : "db#username",
			message  : "What database username do you want to use? [a-zA-Z0-9_]{4,}",
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

		{
			type     : "input",
			name     : "db#password",
			message  : "What database password do you want to use? (min 4 characters or leave empty to generate)",
			validate : function (value) {
				var pass = value.length>4;
				if (pass) {
					return true;
				} else {
					return "Min 4 characters";
				}
			},
			default : _this.defaults.db.password
		},

		{
			type     : "input",
			name     : "db#host",
			message  : "What database host do you want to use? (IP or hostname)",
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
		},

		{
			type     : "input",
			name     : "wp_theme#name",
			message  : "What's the website's name/title? (min 4 characters)",
			validate : function (value) {
				var pass = value.length>=4;
				if (pass) {
					return true;
				} else {
					return "Min 4 characters";
				}
			}
		},

		{
			type     : "input",
			name     : "wp_theme#description",
			message  : "What's the website's description? (max 128 chars)",
			validate : function (value) {
				var pass = value.length<=128;
				if (pass) {
					return true;
				} else {
					return "Max 128 characters";
				}
			}
		},

		{
			type     : "input",
			name     : "wp_theme#slug",
			message  : "What's the theme's slug? (min 4 characters)",
			validate : function (value) {
				var pass = value.length>=4;
				if (pass) {
					return true;
				} else {
					return "Min 4 characters";
				}
			},
			default: 'generate this mofo'
		},

		{
			type     : "input",
			name     : "wp_theme#slug",
			message  : "What's the website's/theme's version? ^([\d]+\.)*[\d]+$, e.g.: 2.1",
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

		{
			type    : "checkbox",
			name    : "wp_plugins",
			message : "Which additional plugins sets do you want to use?",
			choices : function(){
				var _choices = [];
				Object.keys(_this.defaults.wp_plugins).forEach(
					function (key) {

						_choices.push({
							name : key,
							checked : _this.defaults.wp_plugins[key]
						});

					}
				);

				return _choices;
			}
		},


		{ type    : "input",
			name    : "wp_admin#username",
			message : "What username do you want to use for WP?",
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
			message  : "What's the password you want to use for WP? (min 10 characters / leave empty to generate it)",
			validate : function (value) {
				var pass = value.length >= 10;
				if (pass) {
					return true;
				} else {
					return "please make it at least 10 characters long";
				}
			}
		},

		{ type     : "input",
			name     : "wp_admin#email",
			message  : "What's your email address?",
			validate : function (value) {
				var pass = value.match(/^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/);
				if (pass) {
					return true;
				} else {
					return "Please enter a valid email address";
				}
			}
		}




	];




	this.getSomeAnswers();
};





Spidersock.prototype.getSomeAnswers = function () {
	var _this = this;

	inquirer.prompt(
		_this.questions, function (answers) {
			console.log(JSON.stringify(answers, null, "  "));
		}
	);
};




module.exports = Spidersock;