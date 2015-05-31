<?php
    /**
     * Module Name: Archive Page: Custom Post Type
     *
     * @package {{PROJECT NAME}}
     * @since {{VERSION}}
     */



    $post = $posts[ 0 ]; // Hack. Set $post so that the_date() works.

    /* If this is a category archive */
    if( is_category() ){
       $title = 'Archive for the<br /><em>&#8216;' . single_cat_title('', false) . '&#8217;</em> Category';

    /* If this is a tag archive */
    }elseif( is_tag() ){
        $title = 'Posts Tagged<br /><em>&#8216;' . single_tag_title('', false) . '&#8217;</em>';

    /* If this is a daily archive */
    }elseif( is_day() ){
        $title = 'Archive for <em>' . the_time('F jS, Y') . '</em>';

    /* If this is a monthly archive */
    }elseif( is_month() ){
        $title = 'Archive for <em>' . the_time('F, Y') . '</em>';

    /* If this is a yearly archive */
    }elseif( is_year() ){
        $title = 'Archive for <em>' . the_time('Y') . '</em>';

    /* If this is an author archive */
    }elseif( is_author() ){
        $title = 'Author Archive';

    /* If this is a paged archive */
    } elseif( isset( $_GET[ 'paged' ] ) && !empty( $_GET[ 'paged' ] ) ){
        $title = 'Blog Archives';

    }


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

<?php include_once('_incs/html/footer.php'); ?>?>