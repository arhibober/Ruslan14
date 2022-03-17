<?php get_header(); ?> 
	
	<div class="container">	
		<header class="site-header">
			<h1>
				<a href="<?php echo home_url(); ?>">
					<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
					<?php echo get_bloginfo('name'); ?>
				</a>
				<?php echo do_shortcode('[google-translator]'); ?>
			</h1>
		</header>
		<div class="main">                       
			<?php echo "Hello World Any!" ?> 
		</div> 
	</div> 

<?php get_footer(); ?> 