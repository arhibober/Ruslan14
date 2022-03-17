<?php 
/** 
* Template Name: Frames
**/ 
header('Content-Type: text/html; charset=utf-8');
?>

<?php
 
  //response generation function
  $response = "";
 
  //function to generate response
  function my_contact_form_generate_response($type, $message){
 
	global $response;
	if($type == "success") $response = "<div class='success'>{$message}</div>";
	else $response = "<div class='error'>{$message}</div>";

  }
	$saving = rand (0, 10);
	$saving1 = rand (0, 10);

	//response messages
	$not_human       = "Неверная каптча";
	$missing_content = "Вы не ввели контент!";
	$email_invalid   = "Email-Address недействителен.";
	$message_unsent  = "Сообщение не передано. Пожалуйста, повторите попытку.";
	$message_sent    = "Поздравляем! Ваше сообщение доставлено успешно!";
	 
	if (empty($_POST['message_name'])){
		$_POST['message_name'] = '';
	}
	if (empty($_POST['message_email'])){
		$_POST['message_email'] = '';
	}
	if (empty($_POST['message_text'])){
		$_POST['message_text'] = '';
	}
	if (empty($_POST['message_human'])){
		$_POST['message_human'] = '';
	}
	if (empty($_POST['submitted'])){
		$_POST['submitted'] = 0;
	}

	//user posted variables
	$name = htmlspecialchars(trim($_POST['message_name']));
	$email = htmlspecialchars(trim($_POST['message_email']));
	global $wpdb;
	$sqlstr = "select post_title from wp_posts where guid='".$_POST ["picture_guid"]."'";
	$image = $wpdb->get_results ($sqlstr, ARRAY_A);
	if ($_POST ["mode"] == "reproduction")
		$message = str_replace ("\\&quot;", "\"", "Поступил заказ на картину \\&quot;<a href='".$_POST ["picture_guid"]."'>".$image [0]["post_title"]."</a>\\&quot;.\r\n".htmlspecialchars (trim ($_POST ["message_text"])));
	else
		$message = str_replace ("\\&quot;", "\"", "Поступил заказ на копию картины на холсте \\&quot;<a href='".$_POST ["picture_guid"]."'>".$image [0]["post_title"]."</a>\\&quot;.\r\n".htmlspecialchars (trim ($_POST ["message_text"])));
	$human = htmlspecialchars (trim ($_POST ["message_human"]));
	 
	//php mailer variables
	$to = get_option('admin_email');
	$subject = "Order from varlamov.hol.es";
	$headers = /*'From: '. $email . "\r\n" .*/
	  'Reply-To: ' . $email . "\r\n";
	if (!$human == 0)
	{
	  if ($human != htmlspecialchars (trim ($_POST ["right_capture"])))
		  my_contact_form_generate_response ("error", $not_human); //not human!
	  else {
	 
		//validate email
		if(!filter_var($email, FILTER_VALIDATE_EMAIL))
		  my_contact_form_generate_response("error", $email_invalid);
		else //email is valid
		{
			if ($message == "")
				$message = "Пустой";
			//else
				//$message = wordwrap($message, 60, "\r");
		  //validate presence of name and message
			if(empty($name) || empty($message)){
			  my_contact_form_generate_response("error", $missing_content);
			}
			else //ready to go!
			{
				$sent = wp_mail($to, $subject, strip_tags($name).": ".$message, $headers);
				
				$file = 'wp-content/themes/yan/orders.html';
			$person = '<tr><td>'.strip_tags($name)."</td><td>".$email."</td><td>".$message."</td><td>".date ("d-m-Y")."</td></tr>";
			// Пишем содержимое в файл,
			// используя флаг FILE_APPEND flag для дописывания содержимого в конец файла
			// и флаг LOCK_EX для предотвращения записи данного файла кем-нибудь другим в данное время
			file_put_contents($file, $person, FILE_APPEND | LOCK_EX);	

				
				
				
				if($sent) my_contact_form_generate_response("success", $message_sent); //message sent!
				else my_contact_form_generate_response("error", $message_unsent); //message wasn't sent
			}
		}

	  }
	}
	else if ($_POST['submitted']) my_contact_form_generate_response("error", $missing_content);
?>


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
	
		<div class="contact_html">                       
			<?php if( have_posts() ): while( have_posts() ): the_post(); ?>
			<article <?php post_class(); ?> >
				<?php the_content(); ?>
			</article>
			<?php endwhile; endif; ?>
		</div>
		<?php
			if ($_REQUEST ["guid"] != "")
			{
				global $wpdb;			
				$sqlstr = "select post_title from wp_posts where guid='".$_REQUEST ["guid"]."'";
				$image = $wpdb->get_results ($sqlstr, ARRAY_A);			
				$sqlstr = "select post_title from wp_posts where post_name='".$_REQUEST ["album"]."'";
				$album = $wpdb->get_results ($sqlstr, ARRAY_A);
				if ($album [0]["post_title"] != "")
					if ($_GET ["mode"] == "reproduction")
					{
						echo "<h2>Заказать картину <a href='".$_REQUEST ["guid"]."'>\"".$image [0]["post_title"]."\"</a> из альбома \"".$album [0]["post_title"]."\"</h2><br/>
						<a href='".$_REQUEST ["guid"]."'><img src='".substr ($_REQUEST ["guid"], 0, strlen ($_REQUEST ["guid"]) - strlen (strrchr ($_REQUEST ["guid"], ".")))."-150x150".strrchr ($_REQUEST ["guid"], ".")."'></a><br/>";
						$text_of_massage = "Я хотел бы заказать картину \"".$image [0]["post_title"]."\" из альбома \"".$album [0]["post_title"]."\".";
					}
					else
					{
						echo "<h2>Заказать копию картины на холсте <a href='".$_REQUEST ["guid"]."'>\"".$image [0]["post_title"]."\"</a> из альбома \"".$album [0]["post_title"]."\"</h2><br/>
						<a href='".$_REQUEST ["guid"]."'><img src='".substr ($_REQUEST ["guid"], 0, strlen ($_REQUEST ["guid"]) - strlen (strrchr ($_REQUEST ["guid"], ".")))."-150x150".strrchr ($_REQUEST ["guid"], ".")."'></a><br/>";
						$text_of_massage = "Я хотел бы заказать копию картины на холсте \"".$image [0]["post_title"]."\" из альбома \"".$album [0]["post_title"]."\".";
					}
				else
					if ($_GET ["mode"] == "reproduction")
					{
						echo "<h2>Заказать картину <a href='".$_REQUEST ["guid"]."'>\"".$image [0]["post_title"]."\"</a></h2><br/>
						<a href='".$_REQUEST ["guid"]."'><img src='".substr ($_REQUEST ["guid"], 0, strlen ($_REQUEST ["guid"]) - strlen (strrchr ($_REQUEST ["guid"], ".")))."-150x150".strrchr ($_REQUEST ["guid"], ".")."'></a><br/>";
						$text_of_massage = "Я хотел бы заказать картину\"".$image [0]["post_title"]."\".";
					}
					else
					{
						echo "<h2>Заказать копию картины на холсте <a href='".$_REQUEST ["guid"]."'>\"".$image [0]["post_title"]."\"</a></h2><br/>
						<a href='".$_REQUEST ["guid"]."'><img src='".substr ($_REQUEST ["guid"], 0, strlen ($_REQUEST ["guid"]) - strlen (strrchr ($_REQUEST ["guid"], ".")))."-150x150".strrchr ($_REQUEST ["guid"], ".")."'></a><br/>";
						$text_of_massage = "Я хотел бы заказать копию картины на холсте \"".$image [0]["post_title"]."\".";
					}
			}
		?>
		<div class="contact_form">
			<div id="respond"><?php echo $response; ?><form action="<?php the_permalink(); ?>" method="post"> <p>
			<label for="name">Имя: <span>*</span> <br>
			<input type="text" name="message_name" value="<?php echo esc_attr($_POST['message_name']); ?>" required></label></p> 
			<p><label for="message_email">E-mail: <span>*</span> <br><input type="email" name="message_email" value="<?php echo esc_attr($_POST['message_email']); ?>" required></label></p> 
			<p><label for="message_text">Сообщение: <span>*</span> <br><textarea require type="text" name="message_text" rows="5"><?php echo esc_textarea($text_of_massage.$path_of_image); ?></textarea></label></p>
			<p><label for="message_human">Введите правильное число: <span>*</span> <br><input type="text" style="width: 60px;" name="message_human" required> + 
			<?php
				echo $saving1."=".($saving + $saving1);
			?>
			</label></p> 
			<input type="hidden" name="submitted" value="1"> 
			<input type="hidden" name="right_capture" value="<?php echo $saving; ?>">
			<input type="hidden" name="id_picture" value="<?php echo $_REQUEST ["id"]; ?>">
			<input type="hidden" name="picture_guid" value="<?php echo $_REQUEST ["guid"]; ?>">
			<input type="hidden" name="mode" value="<?php echo $_GET ["mode"]; ?>">
			<p><input type="submit" value="Отправить"></p>   </form> </div>
		</div> 
	</div> 

<?php
	get_footer ();
?> 