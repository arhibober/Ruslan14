<?php 
/** 
* Template Name: Contact Template 
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

	//response messages
	$not_human       = "Human verification incorrect.";
	$missing_content = "Please supply all information.";
	$email_invalid   = "Email Address Invalid.";
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
	$message = htmlspecialchars(trim($_POST['message_text']));
	$human = htmlspecialchars(trim($_POST['message_human']));
	 
	//php mailer variables
	$to = get_option('admin_email');
	$subject = "Order from varlamov.hol.es";
	$headers = /*'From: '. $email . "\r\n" .*/
	  'Reply-To: ' . $email . "\r\n";
 

	if(!$human == 0){
	  if($human != 2) my_contact_form_generate_response("error", $not_human); //not human!
	  else {
	 
		//validate email
		if(!filter_var($email, FILTER_VALIDATE_EMAIL))
		  my_contact_form_generate_response("error", $email_invalid);
		else //email is valid
		{
			if ($message == "")
				$message = "Пустой";
			else
				$message = wordwrap($message, 60, "\r");
		  //validate presence of name and message
			if(empty($name) || empty($message)){
			  my_contact_form_generate_response("error", $missing_content);
			}
			else //ready to go!
			{
				$sent = wp_mail($to, $subject, strip_tags($name).": ".strip_tags($message), $headers);			
				$file = 'wp-content/themes/yan/orders.html';
				$person = '<tr><td>'.strip_tags ($name)."</td><td>".$email."</td><td>".strip_tags ($message)."</td></tr>";
				// Пишем содержимое в файл,
				// используя флаг FILE_APPEND flag для дописывания содержимого в конец файла
				// и флаг LOCK_EX для предотвращения записи данного файла кем-нибудь другим в данное время
				file_put_contents ($file, $person, FILE_APPEND | LOCK_EX);				
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
		<div class="contact_form">
			<div id="respond"><?php echo $response; ?><form action="<?php the_permalink(); ?>" method="post"> <p>
			<label for="name">Имя: <span>*</span> <br>
			<input type="text" name="message_name" value="<?php echo esc_attr($_POST['message_name']); ?>" required></label></p> 
			<p><label for="message_email">E-mail: <span>*</span> <br><input type="email" name="message_email" value="<?php echo esc_attr($_POST['message_email']); ?>" required></label></p> 
			<p><label for="message_text">Сообщение: <span>*</span> <br><textarea require type="text" name="message_text" rows="5"><?php echo htmlspecialchars(@esc_textarea($_POST['message_text'])); ?></textarea></label></p>
			<p><label for="message_human">Введите правильное число: <span>*</span> <br><input type="text" style="width: 60px;" name="message_human" required> + 3 = 5</label></p> 
			<input type="hidden" name="submitted" value="1"> <p><input type="submit" value="Отправить"></p>   </form> </div>
		</div> 
	</div> 

<?php get_footer(); ?> 