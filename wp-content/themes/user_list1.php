<?php 
/** 
* Template Name: Список пользователей 
**/
?>

<?php get_header(); ?> 
	<!-- <div class="helper"><img src="<?php echo get_template_directory_uri().'/img/hint.png'; ?>" alt="You can use Keyboard Arrows and Space to Navigate"></div>  -->

	<div class="container">
		<header class="site-header">
			<h1>
				<a href="<?php echo home_url(); ?>">
					<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
					<?php echo get_bloginfo('name'); ?>
				</a>
				<?php echo do_shortcode('[google-translator]'); ?>
			</h1>
			<h2 style="font-size: 150%; text-align: center;">
				Письма
			</h2>
		</header>
		<table class="user-list">
			<tr>
				<th>
					№
				</th>
				<th>
					Имя
				</th>
				<th>
					e-mail
				</th>
				<th>
					Текст сообщения
				</th>
				</tr>
				<?php
					//echo " fgc ".file_get_contents ("wp-content/themes/yan/orders.html");
					$strings_temp=file_get_contents ("wp-content/themes/yan/orders.html");
					preg_match_all ("/<tr>(.*?)<\/tr>/", $strings_temp, $strings);
					//echo " strings: ";
					echo " s00: ".$strings [0][0];
					echo " s01: ".$strings [0][1];
					echo " s02: ".$strings [0][2];
					echo " s03: ".$strings [0][3];
					echo " s04: ".$strings [0][4];
					/*foreach ($strings [0] as $str_num => $string)
						echo str_replace ("<tr><", "<tr><td>".($str_num + 1)."</td><", $string);*/
				?>
		</table>
	</div>
<?php get_footer(); ?> 