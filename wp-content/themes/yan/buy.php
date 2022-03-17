<?php
 /** 
* Template Name: Купить картину 
**/
get_header(); ?> 
	
	<div class="container">
		<div class="main html">   
			<h1>Заказ картины</h1>                    
			<form action="buy_confirm.php" method="post">
				Имя:<br/>
				<input type="text" name="name"/><br/>
				Фамилия:<br/>
				<input type="text" name="surname"/><br/>
				e-mail:<br/>
				<input type="text" name="e-mail"/><br/>
				<?php
					echo "<input type='hidden' name='".$_GET ["id"]."'/>";
				?>
				<input type="submit" value="OK"/>
			</form>
		</div> 
	</div> 

<?php get_footer(); ?> 