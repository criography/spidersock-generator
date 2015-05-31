<?php
/**
 * Module Name: Category Listing: Custom Post Type
 *
 * @package {{PROJECT NAME}}
 * @since {{VERSION}}
 */
?>

<?php include_once('_incs/html/header.php'); ?>

    <main class="main" role="main">






		<!-- SECTION: HEADER -->

		    <?php single_cat_title(); ?>
			<?php echo remove_widows(category_description()); ?>

		<!-- ENDOF: SECTION: HEADER -->









		<!-- SECTION: MAIN CONTENT -->
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>


        <?php endwhile; endif; ?>
		<!-- ENDOF: SECTION: MAIN CONTENT -->





	</main>

<?php include_once('_incs/html/footer.php'); ?>