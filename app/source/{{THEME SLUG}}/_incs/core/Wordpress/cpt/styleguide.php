<?php
/**
	* Module Name: Styleguide CPT
	* 
	* USAGE:
	* ------------------------
	* 1. Enable and configure 'add_pattern_types' method, if you need custom taxonomy.
	*
	* 1b. Enable 'add_dynamic_taxonomy_rewrites', if you enabled 'add_pattern_types' and want to get rid of the redundant URL segment.
	*
	* 2. use case sensitive search and replace and update calls to variations of 'custom' with your custom post type name of choice
	*      styleguide -> names
	*      styleguide -> Names
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

function cgy_add_pattern_types(){

    register_taxonomy(  'pattern-type', array('styleguide'), array(
                        'hierarchical'        => true,
                        'show_ui'             => true,
                        'show_admin_column'   => true,
                        'query_var'           => true,
                        'show_in_nav_menus'   => true,
                        'labels' => array(
                            'name'              => _x('Pattern Types', 'taxonomy general name'),
                            'singular_name'     => _x('Pattern Type', 'taxonomy singular name'),
                            'search_items'      => __('Search Pattern Types'),
                            'all_items'         => __('All Pattern Types'),
                            'parent_item'       => __('Parent Pattern Type'),
                            'parent_item_colon' => __('Parent Pattern Type:'),
                            'edit_item'         => __('Edit Pattern Type'),
                            'update_item'       => __('Update Pattern Type'),
                            'add_new_item'      => __('Add New Pattern Type'),
                            'new_item_name'     => __('New Pattern Type Name'),
                        ),
                        'rewrite' => array(
                            'slug'         => 'styleguide/category',   // This controls the base slug that will display before each term
                            'with_front'   => false,                // Don't display the category base before "/types/"
                            'hierarchical' => false                  // This will allow URL's like "/types/corporate/"
                        ),
    ));


}
add_action( 'init', 'cgy_add_pattern_types', 0 );
    
    
    
    



    
    
/**
 * styleguide_register
 * --------------------------------------
 * Adds 'Custom' Post Type 
 */
function cgy_styleguide_register(){

	$args = array(
		'label'           => __('Styleguide'),
		'singular_label'  => __('Pattern'),
		'public'          => true,
		'show_ui'         => true,
		'capability_type' => 'page',
		'has_archive'     => true,
		'hierarchical'    => false,
		'rewrite'         => array('slug' => 'styleguide', 'with_front' => true),
		'menu_position'   => 100,
		'menu_icon'       => 'dashicons-screenoptions',
		'supports'        => array('title', 'revisions')
	);

	register_post_type( 'styleguide' , $args );
}
add_action('init', 'cgy_styleguide_register');







/**
 * add_dynamic_taxonomy_rewrites
 * ------------------------------------------------------
 * makes sure that custom taxonomies don't need static prefix ('category')
 */

function cgy_add_dynamic_taxonomy_rewrites() {

    $terms = get_terms("pattern-type");

    if( count($terms)>0 ){

        foreach ( $terms as $term ) {

            add_rewrite_rule('styleguide/'.$term->slug.'/page/([0-9]+)/?',  'index.php?post_type=styleguide&pattern-type='.$term->slug.'&paged=$matches[1]','top');
            add_rewrite_rule('styleguide/'.$term->slug.'/?',  'index.php?post_type=styleguide&pattern-type='.$term->slug,'top');

        }
    }

}
// add_action('init','cgy_add_dynamic_taxonomy_rewrites');
















    
    
    
    


/**
	* cgy_styleguide_archive_num
	* ----------------------------------
	* Removes Styleguide taxonomy Box, since it's replaced by ACF
	* with radios instead of checkboxes
	*/

function cgy_remove_pattern_type_meta() {
	remove_meta_box( 'pattern-typediv', 'styleguide', 'side' );
}
add_action( 'admin_menu' , 'cgy_remove_pattern_type_meta' );
