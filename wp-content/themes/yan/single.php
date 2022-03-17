<?php get_header(); ?> 
<div class="container scroll">
	<header class="site-header">
		<h1>
			<a href="<?php echo home_url(); ?>">
				<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
				<?php echo get_bloginfo('name'); ?>
			</a>
			<?php echo do_shortcode('[google-translator]'); ?>
		</h1>
	</header>

<?php if( have_posts() ): while( have_posts() ): the_post(); ?>
	<article <?php post_class(); ?>>                       
		<h1><?php the_title(); ?></h1>
		<?php the_post_thumbnail('featured'); ?>
		<?php the_content(); ?>
	</article> 
<?php endwhile; endif; ?>
</div>

<div id="overlay" class="hidden blog" style="background-color:<?php ztheme_get_bg_color() ?>">
	<div class="image_holder"></div>
	<div class="controls">
		<!-- <span class="arrow-icon arrow-left_small fade">&lt;</span> -->
		<span class="desc">  1 / 15  </span>
		<!-- <span class="arrow-icon arrow-right_small fade">&gt;</span> -->
	</div>
</div>

<?php get_footer(); ?> 