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

var Vars      = require('./Vars');
var Log       = require('./helpers/Log');
var File      = require('./helpers/File');






var Spidersock = function Spidersock() {

	this.init();

};








Spidersock.prototype = {



	/**-----------------------------------------------------------------------------
	 * init
	 * -----------------------------------------------------------------------------
	 * sets up prompt
	 *
	 * @constructor
	 * @return void
	 * -----------------------------------------------------------------------------*/

	init : function () {
		var _this = this;

		inquirer.prompt(
			this.prompts, function (answers) {
				_this.component.name = answers.componentName;
				_this.component.slug = sanitize(answers.componentSlug.replace(/\s+/g, '-'));
				_this.component.group = answers.componentGroup;
				_this.component.type = answers.componentType;
				_this.component.deps = answers.componentDeps;
				_this.component.php = answers.componentPhp;
				_this.component.phpName = answers.componentPhpName;
				_this.component.js = answers.componentJs;
				_this.component.jsName = answers.componentJsName;
				_this.component.repo = answers.createRepo;


				async.series(
					[
						function (callback) {
							_this.definePathsAndConfigs(callback);
						},

						function (callback) {
							_this.createDirs(callback);
						},

						function (callback) {
							_this.copyTemplates(callback);
						},


						function (callback) {
							async.parallel(
								[

									function (callback) {
										_this.processDynamicTemplates(callback);
									},

									function (callback) {
										_this.processOptionalTemplates(callback);
									}

								],

								function (err) {
									callback();
								}
							);
						},

						function (callback) {
							async.parallel(
								[

									function (callback) {
										_this.renameDynamicTemplates(callback);
									},
									/*,
									 function (callback) {
									 _this.renameDynamicTemplates(callback);
									 },

									 function (callback) {
									 _this.createBowerJson(callback);
									 },

									 function (callback) {
									 _this.generateScssControllers(callback);
									 },

									 function (callback) {
									 _this.generateJsModule(callback);
									 },

									 function (callback) {
									 _this.generatePhpClass(callback);
									 },
									 */
									function (callback) {
										_this.updateSpidersockJson(callback);
									},

									function (callback) {
										_this.updateScssController(callback);
									}
									/*
									 function (callback) {
									 _this.installDependencies(callback);
									 }*/

								]
							);
						}
					]
				);


			}.bind(this)
		);
	}

	/**-----------------------------------------------------------------------------
	 * ENDOF: init
	 * -----------------------------------------------------------------------------*/





};




module.exports = new Spidersock();