<?php
/**
	* Module Name: Customs CPT
	* 
	* USAGE:
	* ------------------------
	* 1. Enable and configure 'add_custom_types' method, if you need custom taxonomy.
	*
	* 1b. Enable 'add_dynamic_taxonomy_rewrites', if you enabled 'add_custom_types' and want to get rid of the redundant URL segment.
	*
	* 2. use case sensitive search and replace and update calls to variations of 'custom' with your custom post type name of choice
	*      customs -> names
	*      Customs -> Names
	*      custom  -> name
	*      Custom  -> Name
	* 
	* 3. Configure $args in am_*_register method to match your requirements as documented in:
	*      http://codex.wordpress.org/Function_Reference/register_post_type
	* 
	* 4. Make sure to update the path to the icon, in am_*_icons method
	*
	* 
	* @package      {{PROJECT NAME}}
	* @subpackage   CGY Helpers
	* @since        {{VERSION}}
	*/








/**
	* add_projects_category
	* --------------------------------------
	* Adds taxonomy to the Custom Post Type
	*/

function add_custom_types(){

    register_taxonomy(  'custom-type', array('customs'), array(
                        'hierarchical'        => true,
                        'show_ui'             => true,
                        'show_admin_column'   => true,
                        'query_var'           => true,
                        'show_in_nav_menus'   => true,
                        'labels' => array(
                            'name'              => _x('Custom Types', 'taxonomy general name'),
                            'singular_name'     => _x('Custom Type', 'taxonomy singular name'),
                            'search_items'      => __('Search Custom Types'),
                            'all_items'         => __('All Custom Types'),
                            'parent_item'       => __('Parent Custom Type'),
                            'parent_item_colon' => __('Parent Custom Type:'),
                            'edit_item'         => __('Edit Custom Type'),
                            'update_item'       => __('Update Custom Type'),
                            'add_new_item'      => __('Add New Custom Type'),
                            'new_item_name'     => __('New Custom Type Name'),
                        ),
                        'rewrite' => array(
                            'slug'         => 'customs/category',   // This controls the base slug that will display before each term
                            'with_front'   => false,                // Don't display the category base before "/types/"
                            'hierarchical' => true                  // This will allow URL's like "/types/corporate/"
                        ),
    ));


}
//add_action( 'init', 'add_custom_types', 0 );
    
    
    
    



    
    
/**
 * customs_register
 * --------------------------------------
 * Adds 'Custom' Post Type 
 */
function am_customs_register(){

	$args = array(
		'label'           => __('Customs'),
		'singular_label'  => __('Custom'),
		'public'          => true,
		'show_ui'         => true,
		'capability_type' => 'post',
		'has_archive'     => true,
		'hierarchical'    => false,
		'rewrite'         => array('slug' => 'customs', 'with_front' => true),
		'menu_position'   => 5,
		'supports'        => array('title', 'editor', 'excerpt', 'thumbnail', 'revisions'),
		'taxonomies'      => array('post_tag')
	);

	register_post_type( 'customs' , $args );
}
add_action('init', 'am_customs_register');














/**
 * add_dynamic_taxonomy_rewrites
 * ------------------------------------------------------
 * makes sure that custom taxonomies don't need static prefix ('category')
 */

function add_dynamic_taxonomy_rewrites() {

    $terms = get_terms("custom-type");

    if( count($terms)>0 ){

        foreach ( $terms as $term ) {

            add_rewrite_rule('customs/'.$term->slug.'/page/([0-9]+)/?',  'index.php?post_type=customs&custom-type='.$term->slug.'&paged=$matches[1]','top');
            add_rewrite_rule('customs/'.$term->slug.'/?',  'index.php?post_type=customs&custom-type='.$term->slug,'top');

        }
    }

}
// add_action('init','add_dynamic_taxonomy_rewrites');










// ------------------------------------------
// CSS
// ------------------------------------------

    
/**
 * am_customs_icons
 * --------------------------------------
 * adds customs icon to the left hand side nav
 */
function am_customs_icons() {?>
    <style type="text/css" media="screen">
        #menu-posts-customs .wp-menu-image {
            background: url(<?php bloginfo('template_directory'); ?>/_incs/images/admin/icon-customs.png) no-repeat 6px -16px !important;
        }
    
        #menu-posts-customs:hover .wp-menu-image,
        #menu-posts-customs.wp-menu-open .wp-menu-image {
            background-position:6px 8px !important;
        }
    </style>
<?php }

add_action('admin_head', 'am_customs_icons');










    
    
    
    


/**
 * am_customs_archive_num
 * ----------------------------------
 * Change the amount of post displayed in this custom post type archive view
 *
 * @param object $q Wordpress Query
 */

function am_customs_archive_num($q){

	$options  = get_option('am_options');
	$value    = (isset( $options['am_visible_posts_in_grid']) && $options['am_visible_posts_in_grid'] >0) ? $options['am_visible_posts_in_grid'] : 8;
	$vars     = $q->query_vars;

    if($q->is_main_query()){
    
    }

    if ($q->is_main_query() && $q->is_post_type_archive && $vars['post_type'] =='customs' && !is_admin()){
        $q->set('posts_per_page', $value);
    }

}

//add_action('pre_get_posts', 'am_customs_archive_num');
