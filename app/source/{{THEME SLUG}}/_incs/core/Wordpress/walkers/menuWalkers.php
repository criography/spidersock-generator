<?php
	/**
	 * @package WordPress
	 * @subpackage theme-name
	 */



/**
 * register_menus
 * ----------------------------------------------------
 * Adds menu support
 */

function register_menus(){
	register_nav_menus(array());
}
add_action( 'init', 'register_menus' );









	class CGY_Walker_Nav_Menu extends Walker_Nav_Menu {
        /**
         * Start the element output.
         *
         * @see Walker::start_el()
         *
         * @since 3.0.0
         *
         * @param string $output Passed by reference. Used to append additional content.
         * @param object $item   Menu item data object.
         * @param int    $depth  Depth of menu item. Used for padding.
         * @param array  $args   An array of arguments. @see wp_nav_menu()
         * @param int    $id     Current item ID.
         */
        function start_el( &$output, $item, $depth = 0, $args = array(), $id = 0 ) {
			global $wp_query;
			$class = (!empty( $item->classes ) && in_array('external', $item->classes)) ? 'external ' : '';


			$attributes  = ! empty( $item->attr_title ) ? ' title="'  . esc_attr( $item->attr_title ) .'"' : '';
			$attributes .= ! empty( $item->target )     ? ' target="' . esc_attr( $item->target     ) .'"' : '';
			$attributes .= ! empty( $item->xfn )        ? ' rel="'    . esc_attr( $item->xfn        ) .'"' : '';
			$attributes .= ! empty( $item->url )        ? ' href="'   . esc_attr( $item->url        ) .'"' : '';

			$output .='<li>';

			$item_output .= '<a '. $attributes .($class ? ' class="' .$class. '"' : '').' >';
			$item_output .= $item->description ? '<span>'.apply_filters( 'the_title', str_replace(' ', ' </span><span>', $item->title), $item->ID ).'</span>' : apply_filters( 'the_title', $item->title, $item->ID );
			$item_output .= '</a>';

			$output .= apply_filters( 'walker_nav_menu_start_el', $item_output, $item, $depth, $args );
		}
	}
