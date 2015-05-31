/**
 * Created by crio on 31/05/2015.
 */
var path = require('path');


var Config = {
	answers : {
		'db#name' : '#dbname',
		'db#username' : '#dbuser',
		'db#password' : '#dbpass',
		'db#host' : 'localhoooost',
		'db#prefix' : 'prefix_',
		'site#url' : 'http://site-demo.com',
		'site#theme_slug' : 'site_slug'
	},
	paths : {
		templates : path.join(__dirname, 'templates'),
		helpers   : path.join(__dirname, 'helpers'),
		modules   : path.join(__dirname, 'modules')
	}
};

module.exports = Config;