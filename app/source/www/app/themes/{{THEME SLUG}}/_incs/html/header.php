<?php
/**
 * Module Name: Header
 *
 * @package Site Name
 * @since {{VERSION}}
 */


?><!DOCTYPE html>
<!--[if IE 8]>			<html class="no-js ie8 lte-ie8" <?php language_attributes(); ?>>   <![endif]-->
<!--[if IE 9]>			<html class="no-js ie9 lte-ie9" <?php language_attributes(); ?>>   <![endif]-->
<!--[if gt IE 9]><!-->  <html class="no-js" <?php language_attributes(); ?>>      <!--<![endif]-->
    <head>
        <meta charset="utf-8">

        <title><?php wp_title(''); ?></title>





        <!-- INIT SCRIPTS -->
	    <script src="/_incs/js/lib/modernizr.2.7.1.min.js"></script>
	    <!-- INIT SCRIPTS -->





	    
		<!-- CSS -->
	    <!--[if !IE 8]><!--><link rel="stylesheet" media="screen" href="/_incs/css/siteName.css" /><!--<![endif]-->

	    <?php
	      /* style guide */
	      if(is_page_template('page-styleGuide.php')){
	       echo '<link rel="stylesheet" media="screen" href="/_incs/css/siteName.styleguide.css" />'.
                '<link rel="stylesheet" media="screen" href="/_incs/css/partials/libs/prismjs.css">';
	      }
	    ?>

        <?php /*
		  <!--[if IE 8]><link rel="stylesheet" media="screen" href="/_incs/css/siteName.ie8.css"><![endif]-->
		  <!--[if IE 9]><link rel="stylesheet" media="screen" href="/_incs/css/siteName.ie9.css"><![endif]-->
        */ ?>
	    <!-- ENDOF: CSS -->






	    <!--[if lte IE 8]>
			<script src="/_incs/js/ie/selectivizr.min.js"></script>
			<script src="/_incs/js/ie/svgeezy.internal.js"></script>
		<![endif]-->






        <!-- GOOGLE ANALYTICS -->
		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', '{GA_CODE}', '{}');
            ga('send', 'pageview');

		</script>


        <?php wp_head(); ?>

    </head>
    <body <?php body_class(); ?>>