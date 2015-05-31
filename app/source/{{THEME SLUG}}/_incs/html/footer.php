<?php
/**
 * Module Name: Footer
 *
 * @package {{PROJECT NAME}}
 * @since {{VERSION}}
 */


?>



		<!-- SECTION: FOOTER -->
		<footer class="footer">





	        <div role="contentinfo" class="copyright">
	          <?php echo PostSnippets::getSnippet('Copyright', 'year='.date('Y')); ?>
	        </div>


		</footer>
		<!-- ENDOF: SECTION: FOOTER -->









		<!-- ========================= SCRIPTS  ========================= -->
		<?php /* make sure to bundle your jquery with Main.min.js, or serve locally. */ ?>

            <!-- JS: INTERNAL -->
							<script type="text/javascript">
								<?php
										$jsFile = get_modified_time('/_incs/js/Main.min.js', true);
								?>
								function downloadJSAtOnload(_src) {
									var element = document.createElement("script");
									element.src = <?php echo '"'. $jsFile .'"'; ?>;
									document.body.appendChild(element);
								}

								if (window.addEventListener){
									window.addEventListener("load", downloadJSAtOnload, false);

								}else if (window.attachEvent){
									window.attachEvent("onload", downloadJSAtOnload);

								}else{
									window.onload = downloadJSAtOnload;
								}
							</script>
						<!-- ENDOF: SCRIPTS: INTERNAL -->





		        <!-- JS: CONDITIONAL -->
            <?php
                if(is_page_template('page-styleGuide.php')){
                    echo '<script src="/_incs/js/lib/prism.js"></script>';
                    echo '<script src="/_incs/js/namespace.Styleguide.min.js"></script>';
                }
            ?>

    <!-- ========================= ENDOF: SCRIPTS  ========================= -->







    <!-- ========================= TEMPLATES ========================= -->

            <!-- DESCRIPTION
            <script id="template--name" type="text/template"></script>
            -->

    <!-- ========================= ENDOF: TEMPLATES ========================= -->








	  <?php wp_footer(); ?>

	</body>
</html>
