<?php 
/** 
* Template Name: Frame Choose 
**/ 
	header('Content-Type: text/html; charset=utf-8');
	global $wpdb;
	$sqlstr = "select id from wp_posts where guid='".$_GET ["guid"]."'";
	$img_id = $wpdb->get_results ($sqlstr, ARRAY_A);

#header.php The header.php file is used for any common markup to show at the top of the HTML page. It usually includes  the following: DOCTYPE declaration•	Opening •	<html> tag Entire •	<head> of your HTML document Opening •	<body> tag It can also contain any markup to be used consistently across all site pages, for example, the main logo and navigation, which won’t change throughout your site. The header.php file can include as much or as little content  as you want to be used consistently across your theme. Here’s an example of a simple header.php file: 

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
			?>

<script src="http://localhost/Ruslan14/wp-content/themes/yan/js/frame.js"></script>  
	</head>
	
	<!-- BODY -->
	<body <?php body_class(); ?>>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js">
</script>
	
	
<?php
	//get_header ();
?>

<div class="container container1">
	<header class="site-header">
		<h1>
			<a href="<?php echo home_url(); ?>">
				<i class="fa fa-bars" style="font-size: 30px; color: red; opacity: 0.6; padding-right: 10px;"></i>
				<?php
					echo get_bloginfo ("name");
				?>
			</a>
			<?php
				echo do_shortcode ("[google-translator]");
			?>
		</h1>
	</header>
	<div class="border-container">
		<div class="borders-left">
			<h4>Выберите рамку:</h4>
			<input type="radio" name="cont" value="K" id="rk"><label for="rk"></label><br/>
			<input type="radio" name="cont" value="F" id="rf"><label for="rf"></label><br/>
			<input type="radio" name="cont" value="A" id="ra"><label for="ra"></label><br/>
			<input type="radio" name="cont" value="I" id="ri"><label for="ri"></label><br/>
			<input type="radio" name="cont" value="Y" id="ry"><label for="ry"></label><br/>
			<input type="radio" name="cont" value="O" id="ro"><label for="ro"></label><br/>
			<input type="radio" name="cont" value="N" id="rn"><label for="rn"></label>
		</div>
        	<img src="<?php echo $_GET ["guid"] ?>" alt="Рамки для картины" class="container k" id="coord"/>
	<!--<div class="container1" id="coord">-->
	</div> 
	<p>
		<a class="picture-buy frame-back" href="<?php echo $_GET ["ourl"]."#/img/".$img_id [0]["id"]; ?>">Вернуться к картине</a><a id="but_r" class="picture-buy remove-frame">Убрать рамку</a>
	</p>         
	<!--</div>-->
<?php
	get_footer ();
?> 