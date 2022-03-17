<?php 
/** 
* Template Name: Список пользователей 
**/
?>

<?php get_header(); ?> 
	<!-- <div class="helper"><img src="<?php echo get_template_directory_uri().'/img/hint.png'; ?>" alt="You can use Keyboard Arrows and Space to Navigate"></div>  -->

	<div class="container  scroll">
		<header class="site-header">
			<h1>
				<a href="<?php echo home_url(); ?>">
					<i class="fa fa-bars" style="font-size:30px;color:red;opacity:0.6;padding-right:10px;"></i>
					<?php echo get_bloginfo('name'); ?>
				</a>
				<?php echo do_shortcode('[google-translator]'); ?>
			</h1>
			<h2 style="font-size: 150%; margin-top: 10px">
				Письма
			</h2>
		</header>
		<?php
			//if ($user_ID == 1)
			//{
				echo "<table class='user-list'>
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
					<th>
						Дата
					</th>
					</tr>";
					$strings_temp=file_get_contents ("wp-content/themes/yan/orders.html");
					$strings = explode ("<tr>", $strings_temp);
					foreach ($strings as $str_num => $string)
						if ($str_num > 0)
							echo "<tr><td>".$str_num."</td>".$string;
				echo "</table>";
			//}
			//else
				//header ("Location: /login?mode=pisma");
		?>
	</div>
<?php get_footer(); ?> 