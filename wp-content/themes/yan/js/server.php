<?php
/*$data = array(
	"1" => "Андрей",
	"2" => "Алексей"
);*/
	global $wpdb;
	$sqlstr = "select post_title from wp_posts where id=".$_REQUEST ["id"];
	$title = $wpdb->get_results($sqlstr);
	$result = array
	(
		"title"	=>	$title [0]["post_title"]
	);	
	echo json_encode ($result);