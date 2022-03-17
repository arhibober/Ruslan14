<?php

function ztheme_customize_register( $wp_customize ) {        
// Settings, Sections, and Controls are defined here 

	// $wp_customize->add_setting( 'logo_color' , array(        
	// 												'default' => 'DADADA',
	// 												'type' => 'theme_mod',
	// 												'transport' => 'refresh',
	// 												'sanitize_callback' => 'sanitize_hex_color_no_hash', 
	// 											)
	// 				); 

 // 	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize,  'logo_color_control', array(
 // 																							'label'   => __( 'Logo Color', 'prowordpress' ),
	// 																		                'section' => 'colors',
	// 														                                'settings'=> 'logo_color',        
	// 																						)
 // 															)
	// 						); 	
} 

add_action( 'customize_register', 'ztheme_customize_register' );

?>