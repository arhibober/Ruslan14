<!DOCTYPE HTML>
<html>
	<head>
		<title>Заказы</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="wp-content/themes/yan/style.css" type="text/css" media="all">
		<style>
			h1{
				text-align:center;
			}
			table, td, th{
				border:#888888 solid 2px;
				padding:10px;
				border-collapse: collapse;
			}
			table{
				width:80%;
				margin:0 auto;
			}
			th{
				background-color: #e5e5e5;
				color:#555;
			}
			tr:hover {
				background-color: #e5e5e5;
				color:#555;
				transition:all 0.5s;
				}
		</style>
	</head>
	<body>
		<h1>Письма</h1>
		<table>
			<tr><th>№</th><th>Имя</th><th>e-mail</th><th>Текст сообщения</th></tr>
			<?php
			//include 'wp-content/themes/yan/orders.html';
			 $lines = file('wp-content/themes/yan/orders.html'); 
			 foreach($lines as $line_num => $line) {
				echo "<tr>";
				echo "<td>".($line_num + 1)."</td>".$line; 
				echo "</tr>";
			 } 
			?>
		</table>
	</body>
</html>