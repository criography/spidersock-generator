<?php		


/**
 * get_tabs
 * ----------------------------------------
 * Returns Markup for the default Tabs module.
 *
 * @param array         $data       Array of tab content, each grouped in their own array ('label' =>'', 'content' =>'')
 * @param bool|string   $id         Id attribute to be set on the module container
 * @param bool|string   $cssSuffix  A composite of CSS class to be suffixed to each suffixable element (best explanation ever)
 * @param bool          $tabsOnTop  should Tab Labels be rendered before of after the content?
 * @param string        $prevLabel  Text to be display for the 'prev' button, for JS enhancement
 * @param string        $nextLabel  Text to be display for the 'next' button, for JS enhancement
 *
 * @return string HTML of the whole tabs module
 */
function get_tabs($data, $id=false, $cssSuffix=false, $tabsOnTop=true, $nextLabel='>', $prevLabel='<'){
		$html = '';

		if(!empty($data) && is_array($data)){
			$inputsHTML='';
			$labelsHTML='<ol class="list--inlineBlock tabs__labels'. ($cssSuffix ? ' tabs__labels--'.$cssSuffix : '') .'">';
			$contentHTML='<ol class="list--block tabs__contentWrapper tabs__contentWrapper--'. count($data) . ($cssSuffix ? ' tabs__contentWrapper--'.$cssSuffix : '') .'">';


			foreach($data as $k => $tab){
				$inputsHTML.=   '<input type="radio" value="'. $k .'" role="presentation" aria-hidden="true" id="tab-'. $k .'" name="tabs" class="removed tab__input"'. ($k==0 ? ' checked="checked"' : '') . '/>';

				$labelsHTML.=   '<li class="tab__labelContainer'. ($cssSuffix ? ' tab__labelContainer--'.$cssSuffix : '') .'">'.
	                        '<label onclick="" class="tab__label'. ($cssSuffix ? ' tab__label--'.$cssSuffix : '') .'" for="tab-'. $k .'">'. $tab['label'] .'</label>'.
                        '</li>';

				$contentHTML.=  '<li class="tab__content'. ($cssSuffix ? ' tab__content--'.$cssSuffix : '') .'">'.
													$tab['content'].
												'</li>';
			}


			$html .=  '<section'. ($id ? ' id="'. $id .'"' : '') . ($prevLabel ? ' data-label-prev="'. htmlentities($prevLabel) .'"' : '') . ($nextLabel ? ' data-label-next="'. htmlentities($nextLabel) .'"' : ''). ' class="tabs'. ($cssSuffix ? ' tabs--'.$cssSuffix : '') .'">'.
									$inputsHTML .
									($tabsOnTop ? $labelsHTML   : $contentHTML). '</ol>'.
									($tabsOnTop ? $contentHTML  : $labelsHTML ). '</ol>'.
								'</section>';
		}



		return $html;
}









	
/**
 * tabs
 * ----------------------------------------
 * Renders Markup for the default Tabs module. 
 *
 * @param array         $data       Array of tab content, each grouped in their own array ('label' =>'', 'content' =>'')
 * @param bool|string   $id         Id attribute to be set on the module container
 * @param bool|string   $cssSuffix  A composite of CSS class to be suffixed to each suffixable element (best explanation ever)
 * @param bool          $tabsOnTop  should Tab Labels be rendered before of after the content?
 * @param string        $prevLabel  Text to be display for the 'prev' button, for JS enhancement
 * @param string        $nextLabel  Text to be display for the 'next' button, for JS enhancement
 */
function tabs($data, $id=false, $cssSuffix=false, $tabsOnTop=true, $prevLabel='&gt;', $nextLabel='&lt;'){
	echo get_tabs($data, $id, $cssSuffix, $prevLabel, $nextLabel);
}
