"use strict";
/*jshint smarttabs: true */

var fs        = require('fs');
var path      = require('path');
var mustache  = require('mustache');
var async     = require('async');

var Log       = require('./Log');





String.prototype.str_replace = function (needle, replacer) {
	var replaceString = this;
	var regex;

	if(!Array.isArray(needle) && !Array.isArray(replacer)){
		replaceString = replaceString.split(needle).join(replacer);

	}else if (Array.isArray(needle)){
		for (var i = 0; i < needle.length; i++) {
			regex = new RegExp(needle[i], "g");
			replaceString = replaceString.replace(regex, (Array.isArray(replacer) ? replacer[i] : replacer) );
		}

	}

	return replaceString;
};









module.exports =  {

	/**-----------------------------------------------------------------------------
	 * mustacheReplacer
	 * -----------------------------------------------------------------------------
	 * reads given file, replaces all mustache tags and saves the output to specified location
	 *
	 * @this      {object}                            Main Object
	 * @param     {string}          sourceDir         source directory for the file.
	 * @param     {string}          sourceName        filename to be processed (can be subpath)
	 * @param     {string}          destinationDir    path to where the file should go, starting from the component root.
	 * @param     {string|null}     destinationName   new filename to be used when saving (can be subpath).
	 *                                                Defaults to sourceName.
	 * @param     {object}          needles           object containing all available strings to be used as replacers
	 * @param     {function}        callback          callback to be passed back to async
	 *
	 * @return    void
	 * -----------------------------------------------------------------------------*/

		mustacheReplacer : function (sourceDir, sourceName, destinationDir, destinationName, needles, callback) {

			/* if all is set read the file */
			if (needles && callback) {
				destinationName = destinationName || sourceName;

				fs.readFile(
					sourceDir + sourceName, {encoding : 'utf8'}, function (err, data) {
						if (err) {
							throw err;
						}


						fs.writeFile(
							'./' + (destinationDir || '') + destinationName, mustache.render(data, needles), function (err) {
								if (err) {
									throw err;
								}

								Log.status('Created ' + destinationName);
								callback();
							}
						);
					}
				);
			}
		},

	/**-----------------------------------------------------------------------------
	 * ENDOF: mustacheReplacer
	 * -----------------------------------------------------------------------------*/










 	/**-----------------------------------------------------------------------------
	 * stringReplacer
	 * -----------------------------------------------------------------------------
	 * searches specified files for a given string and replaces it with the one given
	 *
	 * @TODO add regex
	 * @TODO add sync/async
	 * @TODO add wildcards
	 *
	 * @this      {object}                            Main Object
	 * @param     {array}           files             Array of filenames to scan.
	 *                                                Defaults to sourceName.
	 * @param     {array|string}    needles           An Array or String with all needles
	 * @param     {array|string}    replacers         An Array or String with all replacers
	 * @param     {function}        callback          callback to be passed back to async
   *
	 * @param     {string|null}     successMsg        Optional text to be render upon success. Set to null for no message
	 * @param     {string|null}     errorMsg          Optional text to be rendered on failure. Set to null for no message
	 *
	 * @return    void
	 * -----------------------------------------------------------------------------*/

		replacer : function (files, needles, replacers, callback, successMsg, errorMsg) {


			if(
				(Array.isArray(files)     || typeof files === "string") &&
				(Array.isArray(needles)   || typeof needles === "string") &&
				(Array.isArray(replacers) || typeof replacers === "string")
			){

				if(typeof files === "string"){
					files = [files];
				}

				async.each(
					files, function (file, cb) {

						/* read, process and write current file */
						fs.readFile(
							file, 'utf8', function (error, data) {
								if (error) {
									return console.log(err);
								}

								fs.writeFile(
									file, data.str_replace(needles, replacers), function (error) {
										if (error) return console.log(error);

										cb();
									}
								);

							}
						);

					}, function (err) {
						if (err) {
							if(typeof errorMsg !== 'null'){
								Log.error(errorMsg || 'Something went wrong with replacing all given values');
							}


						}

						if (typeof successMsg !== 'null') {
							Log.status(successMsg || 'All files were processed sucessfully');
						}

						if(typeof callback === "function"){
							callback();
						}

					}
				);

			}
		}

	/**-----------------------------------------------------------------------------
	 * ENDOF: stringReplacer
	 * -----------------------------------------------------------------------------*/

};
