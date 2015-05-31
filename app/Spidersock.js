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
var ipRegex   = require('ip-regex');
var chalk     = require('chalk');
var _         = require('underscore');
var readdirSyncRecursive = require('fs-readdir-recursive');


var Log       = require('./helpers/Log');
var File      = require('./helpers/File');
var Prompter  = require('./modules/Prompter');
var Scaffolder= require('./modules/Scaffolder');




var Spidersock = function Spidersock(name) {
	this.init();
};





Spidersock.prototype.init = function () {
	var _this = this;

	var prompter = new Prompter();
	var scaffolder = new Scaffolder();


	async.series([
		function (callback) {
			prompter.init(callback);
		},
		function (callback) {
			scaffolder.init(callback);
		}/*,

		function(callback) {
			async.parallel(
				[],

				function (err) {
					callback();
				});
		}*/
	]);

};






module.exports = Spidersock;