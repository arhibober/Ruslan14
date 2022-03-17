<?php 

/** 

* ZTheme WordPress functions and definitions 

* 

* @package ztheme 

*/ 



require( get_template_directory() . '/inc/theme-options.php' );



define('ZTHEME_VERSION', '0.1');







if ( ! function_exists( 'ztheme_setup' ) ) : 

	function ztheme_setup() { 

		/**                 

		* Add default posts and comments RSS feed links to head

	    */                

		add_theme_support( 'automatic-feed-links' ); 



		add_theme_support( 'custom-background' );

		/** 

		* It enables you  to attach an image to any post or page that can be included specifically in your templates.

		*/

		add_theme_support( 'post-thumbnails' ); 

		

		/**                

		* This theme uses wp_nav_menu() in one location.                

		*/               

		register_nav_menus( array('primary' => __( 'Primary Menu' ) ) );		





		// add_image_size( 'gallery-thumb', 900, 600, false );

		add_image_size( 'gallery-thumb', 0, 300, true );

		add_image_size( 'featured', 600, 0, true );

	} 

endif; // ztheme_setup 



add_action( 'after_setup_theme', 'ztheme_setup' );







/** 

* Enqueue scripts and styles */ 



function ztheme_scripts_and_styles() {        


	// create styles

	$theme = wp_get_theme(); 

	

	wp_register_style( 'ztheme-reset-style',  get_template_directory_uri() . '/css/reset.css');

	

	wp_register_style( 'ztheme-gallery-style',  get_template_directory_uri() . '/css/gallery.css',  array( 'ztheme-reset-style','style' ));

	

	// js

	wp_register_script( 'ztheme-pace-script', get_template_directory_uri() . '/js/libs/pace.min.js', array( 'jquery' ), ZTHEME_VERSION, true );

	

	wp_register_script( 'ztheme-path-script', get_template_directory_uri() . '/js/libs/path.min.js', array( 'jquery' ), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-meny-script', get_template_directory_uri() . '/js/libs/meny.js', array( 'jquery' ), ZTHEME_VERSION, true );

	

	wp_register_script( 'ztheme-sly-script', get_template_directory_uri() . '/js/libs/sly.min.js', array( 'jquery' ), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-ease-script', get_template_directory_uri() . '/js/libs/jquery.easing.1.3.js', array( 'jquery' ), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-bigImage-script', get_template_directory_uri() . '/js/bigImage.js', array(), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-blazy-script', get_template_directory_uri() . '/js/libs/blazy.js', array(), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-shared-script', get_template_directory_uri() . '/js/shared.js.php', array('ztheme-meny-script'), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-gallery-script', get_template_directory_uri() . '/js/gallery.js', array( 'jquery','ztheme-pace-script', 'ztheme-path-script', 'ztheme-blazy-script','ztheme-ease-script','ztheme-shared-script','ztheme-bigImage-script', 'ztheme-sly-script' ), ZTHEME_VERSION, true );



	wp_register_script( 'ztheme-blog-script', get_template_directory_uri() . '/js/blog.js', array( 'jquery','ztheme-pace-script','ztheme-shared-script','ztheme-bigImage-script'), ZTHEME_VERSION, true );

wp_register_script( 'ztheme-frame-script', get_template_directory_uri() . '/js/libs/frame.js', array(), ZTHEME_VERSION, true );

	// add reset.css FIRST!

	wp_enqueue_style( 'ztheme-reset-style'); 





	// add general style.css

	wp_enqueue_style( 'style', get_stylesheet_uri() ); 



	// add styles per template

	if ( ztheme_is_template('template-gallery1.php') || ztheme_is_template('template-gallery.php')) {  
	

		wp_enqueue_style('ztheme-gallery-style'); 

		// wp_enqueue_script('ztheme-sly-script'); 

		wp_enqueue_script('ztheme-gallery-script'); 



		// remove plugin scripts/styles

		wp_dequeue_style( 'easy-image-gallery' );

		wp_dequeue_style( 'pretty-photo' );

		wp_dequeue_style( 'fancybox' );

		// wp_deregister_script('pretty-photo');

		// wp_deregister_script('fancybox');

		deregisterScripts();

	} else {



		wp_enqueue_script( 'ztheme-blog-script' );

	}	

	// if (is_home()){

	// 	// deregisterScripts();

	// 	wp_enqueue_script( 'ztheme-blog-script' );

	// }



	// if (is_single()){

	// 	wp_enqueue_script( 'ztheme-blog-script' );

	// }

} 



function deregisterScripts(){

	wp_dequeue_style( 'easy-image-gallery' );

	$lightbox = easy_image_gallery_get_lightbox();



	switch ( $lightbox ) {

			

		case 'prettyphoto':

			

			// CSS

			wp_dequeue_style( 'pretty-photo' );



			// JS

			wp_dequeue_script( 'pretty-photo' );



		break;

		

		case 'fancybox':



			// CSS

			wp_dequeue_style( 'fancybox' );



			// JS

			wp_dequeue_script( 'fancybox' );



		break;



		default:

		break;

	}



}







add_action( 'wp_enqueue_scripts', 'ztheme_scripts_and_styles', 30 );

add_action('easy_image_gallery_scripts', 'deregisterScripts', 100);







function ztheme_is_template( $name = false ) {

	global $post; 

	$template_file = get_post_meta($post->ID,'_wp_page_template',TRUE); 

    

    // check for a template type        

    if( $name ):                

    	if ( $name === $template_file ):                       

    		return true;                

    	else:                       

    		return false;                

    	endif;        

    else:                

    	return $template_file;        

    endif; 

} 







/** UTIL HTML FUNCTIONS CALLED IN THE TEMPLATE FILES **/

function simple_copyright () {        

	echo "&copy; " . get_bloginfo('name') ." ". date("Y")." — <a href='http://zenphotothemes.net' class='homelink' title='Wordpress Photography Theme by ZenPhotoThemes.net'>ZPT</a>"; 

}





function the_ztheme_gallery(){

		global $post;

		// read ids as serialized string

		$attachment_ids = get_post_meta( $post->ID, '_easy_image_gallery', true );



		if ( !$attachment_ids )

			return;



		// explode string and filter false, null values

		$attachment_ids = explode( ',', $attachment_ids );

		$attachment_ids = array_filter( $attachment_ids );



		// get featured post images

		$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'feature' );

		$image_title = esc_attr( get_the_title( get_post_thumbnail_id( $post->ID ) ) );



		// css classes array

		$classes = array();



		// thumbnail count

		$classes[] = $attachment_ids ? 'thumbnails-' . count( $attachment_ids ) : '';



		// linked images - not sure if needed

		// $classes[] = easy_image_gallery_has_linked_images() ? 'linked' : '';



		$classes = implode( ' ', $classes );



?>

		<div id="frame" class="frame">

				

		    <ul id="items" class="image-gallery clear_fix <?php echo $classes; ?>">

	<?php

			foreach ( $attachment_ids as $attachment_id ) {



				$classes = array( 'thumb' );

				$immageArr = get_post($attachment_id);
				
				$title = $immageArr->post_title;
				// get original large image

				$image_link	= wp_get_attachment_image_src( $attachment_id, apply_filters( 'linked_image_size', 'full' ) );

				$image_width = 	$image_link[1];

				$image_height = $image_link[2];



				$image_link	= $image_link[0];



				$image_link_thumb	= wp_get_attachment_image_src( $attachment_id, 'gallery-thumb' );

				$image_link_thumb = $image_link_thumb[0];





				//get thumb image

				//$image = wp_get_attachment_image( $attachment_id, apply_filters( 'linked_image_size', 'full' ), '', array( 'alt' => trim( strip_tags( get_post_meta( $attachment_id, '_wp_attachment_image_alt', true ) ) ) ) );



				$image_caption = get_post( $attachment_id )->post_excerpt ? get_post( $attachment_id )->post_excerpt : '';



				$image_class = esc_attr( implode( ' ', $classes ) );



				$rel ="";



				$html = '<li class="img_holder fade" data-orig-width="'.$image_width.'" data-orig-height="'.$image_height.'" data-url-id="'.$attachment_id.'"><a href="'.$image_link.'" class="full_image"><img class="b-lazy fade" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="  data-src="'.$image_link_thumb.'" title="' . $title . '" data-orig-width="'.$image_width.'" data-orig-height="'.$image_height.'"></a><div class="flash"></div></li>';



				echo apply_filters( 'easy_image_gallery_html', $html, $rel, $image_link, $image_class, $image_caption, $image, $attachment_id, $post->ID );

			}

	?>

		    </ul>



	    </div>

		<div id="scrollbar" class="scrollbar hidden">

			<div class="handle">

				<div class="mousearea"></div>

			</div>

		</div>

<?php

}



function ztheme_get_bg_color(){

	$color = get_theme_mod( 'background_color' ); 

	if (isset($color)){ 

		echo '#'.$color; 

	}

}



function clearDefaultJs($js){

	$js = "";

	return $js;

}

add_filter( 'easy_image_gallery_prettyphoto_js', 'clearDefaultJs', 20);

add_filter( 'easy_image_gallery_fancybox_js', 'clearDefaultJs', 20);

if ( function_exists('register_sidebar') )
    register_sidebar(array(
        'name' => 'New Sidebar1',
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '<div class="title">',
        'after_title' => '</div>',
    ));
	
function wph_attachment_display_settings()
{
    update_option('image_default_link_type', 'link');
}
add_action('after_setup_theme', 'wph_attachment_display_settings');
?>