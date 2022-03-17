<?php 
/** 
* Template Name: Gallery Template 
**/

global $wpdb;
?>

<?php get_header(); ?> 
	<!-- <div class="helper"><img src="<?php echo get_template_directory_uri().'/img/hint.png'; ?>" alt="You can use Keyboard Arrows and Space to Navigate"></div>  -->

	<div class="container">
		<header class="site-header">
			<h1>
				<a href="<?php echo home_url(); ?>">
					<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i> <?php echo get_bloginfo('name'); ?>
				</a>
				<img id="lupa" src="<?php echo get_template_directory_uri().'/lupa.gif'; ?>"/>
				<?php echo do_shortcode('[google-translator]');	?>
			</h1>
		</header>
		<div class="main gallery">
			<?php
				the_ztheme_gallery();
			?>                   
		</div> 
		<div id="overlay" class="hidden" style="background-color:<?php ztheme_get_bg_color() ?>;z-index:99;">
			<span>
				<div class="image_holder"></div>
			</span>
			<div class="controls">
				<!-- <span class="arrow-icon arrow-left_small fade">&lt;</span> -->
				<!-- <span class="desc"> ( 1 / 15 ) </span> -->
				<!-- <span class="arrow-icon arrow-right_small fade">&gt;</span> -->
			</div>
		</div>
		<?php
			if (strstr ($_SERVER ["REQUEST_URI"], "/img/"))
			{
				$sqlstr = "select post_excerpt from wp_posts where id=".substr (strstr ($_SERVER ["REQUEST_URI"], "/img"), 4, strlen ($_SERVER ["REQUEST_URI"]) -4);
				$excpert = $wpdb->get_results ($sqlstr, ARRAY_A);
				echo "<div class='entry-description'>
						<div class='entry-caption image-caption'>".
							$excpert ["post_excerpt"].
						"</div>
					</div>";
			}
		?>

	<div id="info" class="hidden">
		<div class="show_thumbs color">ВЕРНУТЬСЯ К АЛЬБОМУ</div>
		<div class="desc"> 1 / 1 </div>
	</div>

<?php get_footer(); ?> 