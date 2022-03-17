	<?php get_header(); ?> 
	
	<!-- <h1>Latest news</h1>  -->
<div class="container scroll">
	<header class="site-header">
		<h1>
			<a href="<?php echo home_url(); ?>">
				<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
				<?php echo get_bloginfo('name'); ?>
			</a>
			<?php echo do_shortcode('[google-translator]');
				global $user_ID;
				if (($user_ID == 1) || ($user_ID == 2))
					echo "<a href='/Ruslan14/pisma'>Письма</a>";?>
		</h1>
	</header>
	
	<?php if( have_posts() ): ?> 
	       <?php while( have_posts() ): the_post(); ?>
				<article>
					<h2><?php the_title(); ?></h2>
					<div class="featured_img">
						<?php the_post_thumbnail('featured'); ?>
					</div>
					<?php the_content(); ?>
					<div class="controls">
						<a href="<?php the_permalink(); ?>" class="link">article link &raquo;</a>
					</div>
				</article>
	       <?php endwhile; ?> 
	<?php else: ?>
	       <article class="error">
				<h2>Sorry there were no articles found</h2>
			</article> 
	<?php endif; ?> 

	<p class="post-page-navigation">
	 	<?php previous_posts_link( "&laquo; More recent news"); ?>
	 	<?php next_posts_link( "Past news &raquo;"); ?>        
	</p> 
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