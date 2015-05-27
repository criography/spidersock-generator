/*
 * SVGeezy.js 1.0.2 internal
 *
 * Copyright 2012, Ben Howdle http://twostepmedia.co.uk
 * Released under the WTFPL license
 * http://sam.zoy.org/wtfpl/
 *
 * Date: Sun Aug 26 20:38 2012 GMT
 *
 *  1.0.1 Added SVGZ support by @criography
 *  1.0.2 Added parsing data-png attributes by @criography
 */

/*
	//call like so, pass in a class name that you don't want it to check and a filetype to replace .svg with
	svgeezy.init('nocheck', 'png');
*/

var svgeezy = function() {

		return {

			init: function(avoid, filetype) {
				this.avoid = avoid || false;
				this.filetype = filetype || 'png';
				this.svgSupport = this.supportsSvg();
				if(!this.svgSupport) {
					this.images = document.getElementsByTagName('img');
					this.imgL = this.images.length;
					this.fallbacks();
				}
			},

			fallbacks: function() {
				while(this.imgL--) {
					if(!this.hasClass(this.images[this.imgL], this.avoid) || !this.avoid) {
						var src = this.images[this.imgL].getAttribute('src');
						if(src === null) {
							continue;
						}

						/* first check if data-png attribute exists, saves time on parsing long base64ed strings */
						var dataPng = this.images[this.imgL].getAttribute('data-png');
						if(dataPng){
							this.images[this.imgL].setAttribute('src', dataPng );
						}

						/* if not present, try to get an extension */
						else{
							var ext = this.getFileExt(src);
							if(ext.indexOf('svg') > -1) {
								this.images[this.imgL].setAttribute('src', src.replace('.'+ext, '.' + this.filetype) );
							}
						}


					}
				}
			},


			getFileExt: function(src) {
				return src.split('.').pop();
			},

			hasClass: function(element, cls) {
				return(' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
			},

			supportsSvg: function() {
				return document.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#Image", "1.1");
			}
		};

	}();