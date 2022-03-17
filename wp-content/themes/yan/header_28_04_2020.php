<?php

#header.php The header.php file is used for any common markup to show at the top of the HTML page. It usually includes  the following: DOCTYPE declaration•	Opening •	<html> tag Entire •	<head> of your HTML document Opening •	<body> tag It can also contain any markup to be used consistently across all site pages, for example, the main logo and navigation, which won’t change throughout your site. The header.php file can include as much or as little content  as you want to be used consistently across your theme. Here’s an example of a simple header.php file: 


	global $user_ID;
	if ((strstr ($_SERVER ["REQUEST_URI"], "/pisma")) && ($user_ID == 0))
		header ("Location: /Ruslan14/login");
?>
<!DOCTYPE html> 
<html <?php language_attributes(); ?> style="background-color: <?php ztheme_get_bg_color() ?>; margin-top: 0px !important">        
	
	<!-- HEAD -->
	<head>
		<meta charset="<?php bloginfo( 'charset' ); ?>" />
		<meta name="viewport" content="width=device-width" /> 
			<title><?php wp_title( '|', true, 'right' ); echo get_bloginfo('name'); ?></title> 
			<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
			<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js">
</script>			
			<!-- HTML5 SHIV for IE -->
			<!-- If using Modernizr you can remove this script! -->                
			<!--[if lt IE 9]>
				<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>                
			<![endif]--> 

			<?php
				wp_head ();
			?>      <style>
	
	.container {
		width:680px;
		height:320px;
		margin:0 auto;
		padding: 0px;
	   }
	  .frame{
		border: 30px solid transparent;	  
	  }
	  .f{
		border: 80px solid transparent;
		border-image: url(images/f.png) 80 round round;
	  }
	  .i{
		border: 15px solid transparent;
		border-image: url(images/i.png) 15 round round;
	  }
	  .a{
		border: 50px solid transparent;
		border-image: url(images/a.png) 50 round round;
	  }
	  .y{
		border: 80px solid transparent;
		border-image: url(images/y.png) 80 round round;
	  }
	  .k{
		border: 35px solid transparent;
		border-image: url(images/k.png) 35 round round;
	  }
	 .u{
		border: 50px solid transparent;
		border-image: url(images/u1.png) 50 round round;
	  }
	  .c{
		border: 30px solid transparent;
		border-image: url(images/c.png) 30 round round;
	  }
</style>  
	</head>
	
	<!-- BODY -->
	<body <?php body_class(); ?>>
	
		<div class="sidebar">
			<nav class="main-navigation">        
				<?php wp_nav_menu( array( 'theme_location' => 'primary', 'container' => false )); ?> 
				<?php
					if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('New Sidebar1') ) { 
					}
				?>
			</nav>
								
		</div>