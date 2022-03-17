<?php get_header(); ?> 
	
	<div class="container">	
		<header class="site-header">
			<h1>
				<a href="<?php echo home_url(); ?>">
					<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
					<?php echo get_bloginfo('name'); ?>
				</a>
				<?php echo do_shortcode('[google-translator]');
				global $user_ID;
				echo " uid ".$user_ID;
				if (($user_ID == 1) || ($user_ID == 2))
					echo "<a href='/Ruslan14/pisma'>Письма</a>";
				?>
			</h1>
		</header>
		<div class="main">                       
			<?php echo "Hello World Any!" ?> 
		</div> 
	</div> 

<?php get_footer(); ?> 