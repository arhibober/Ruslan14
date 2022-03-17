<?php 
	require dirname(dirname(dirname(dirname(__DIR__)))) . '/wp-config.php';
?>

var sharedThemeUrl="<?php echo get_template_directory_uri(); ?>";

var meny = Meny.create({
	// The element that will be animated in from off screen
	menuElement: document.querySelector( '.sidebar' ),
	
	// The contents that gets pushed aside while Meny is active
	contentsElement: document.querySelector( '.container' ),
	
	// [optional] The alignment of the menu (top/right/bottom/left)
	position: 'left',
	
	// [optional] The height of the menu (when using top/bottom position)
	height: 200,
	
	// [optional] The width of the menu (when using left/right position)
	width: 220,
	
	// [optional] Distance from mouse (in pixels) when menu should open
	threshold: 40,
	
	// [optional] Use mouse movement to automatically open/close
	mouse: true,
	
	// [optional] Use touch swipe events to open/close
	touch: true
});