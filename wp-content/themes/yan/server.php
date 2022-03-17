<?php
/** 
* Template Name: Заголовок фото 
**/
 get_header();
 
/*$data = array(
	"1" => "Андрей",
	"2" => "Алексей"
);*/
	global $wpdb;
	$sqlstr = "select post_title from wp_posts where id=".$_REQUEST ["id"];
	$title = $wpdb->get_results($sqlstr, ARRAY_A);
	$result = array
	(
		"title"	=>	$title [0]["post_title"]
	);	
	//print_r($result);
	echo json_encode ($result);