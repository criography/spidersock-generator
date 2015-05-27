<?php
/**
 * Module Name: Index
 *
 * @package {{PROJECT NAME}}
 * @since {{VERSION}}
 */
?>


<?php include_once('_incs/html/header.php'); ?>



    <main class="main" role="main">
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>


<? the_title(); ?>


            <!-- SECTION: HEADER -->

            <!-- ENDOF: SECTION: HEADER -->









            <!-- SECTION: MAIN CONTENT -->

            <!-- ENDOF: SECTION: MAIN CONTENT -->







    	<?php endwhile; endif; ?>
	</main>



<?php include_once('_incs/html/footer.php'); ?>