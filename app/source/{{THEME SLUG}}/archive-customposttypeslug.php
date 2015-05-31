<?php
/**
 * Module Name: Archive Page: Custom Post Type
 *
 * @package {{PROJECT NAME}}
 * @since {{VERSION}}
 */
?>

<?php include_once('_incs/html/header.php'); ?>

    <main class="main" role="main">






		<!-- SECTION: HEADER -->


		<!-- ENDOF: SECTION: HEADER -->







		<!-- SECTION: MAIN CONTENT -->
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>


        <?php endwhile; endif; ?>
		<!-- ENDOF: SECTION: MAIN CONTENT -->





	</main>

<?php include_once('_incs/html/footer.php'); ?>