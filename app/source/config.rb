# Require any additional compass plugins here.
require 'compass/import-once/activate'
require 'sass-globbing'
require 'breakpoint'
require 'susy'


# Set this to the root of your project when deployed:
project_path  = File.dirname(__FILE__) + "/dev/app/themes/{{THEME SLUG}}/_incs/"
http_path     = "/_incs/"
css_dir       = "css"
sass_dir      = "sass"
images_dir    = "images"
fonts_dir     = "fonts"

# make sure to allow inclusion from components and js_src if necessary
add_import_path "components"
add_import_path "js_src"


# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :extended

# To enable relative paths to assets via compass helper functions. Uncomment:
#relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

asset_cache_buster :none
#sass_options = {:debug_info => true}
sass_options = {:cache_location => ".sass-cache"}


#disable_warnings = true