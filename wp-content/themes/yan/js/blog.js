jQuery(document).ready(function($){

	
	var sh = $('.site-header').height() + 30 - 7 + 23;
	// $('.container').css('padding-top',sh);
	// $('.container article:first').css('padding-top',0);

	var CONTENT_TOP = 150;
	var GALLERY_MARGIN = 0;

	// UTILS
	function opacityFlash( $el ){
		$el.addClass('flash');
		setTimeout(function(){
			$el.removeClass('flash');
		},500);	
	}
	// -- 

	$('article a').addClass('color');

	// SLIDESHOW MANAGER MODULE
	
	var SlideshowManager = (function(){

		var currentMaxH;
		var currentImageInd = 0;

		var models_arr = [];

		// var $frame = $("#frame");
		var $thumbs = $('.image-gallery img');
		var $overlay = $('#overlay');

		var isOpen = false;
		var isInitOverlay = false;

		// private
		function _init(){
			

			$thumbs.each(function(ind, imgEl){
				var $imgEl = $(imgEl);
				
				$imgEl.attr('ind',ind);
				$imgEl.parent().attr('ind',ind);

				var model = {
					el: imgEl,
					$el : $imgEl,
					thumbSrc: $imgEl.attr('src'),
					title: $imgEl.attr('title'),
					fullSrc: $imgEl.parent().attr('href'),
					id: ind,
					bigImage: null
				}

				models_arr[ ind ] = model;
			});

			//console.log(">> models_arr",models_arr);

			// li > a.full_image > img
			// open big image
			$('.popup').on('click',function(ev){
				ev.preventDefault();
				var ind = $(this).attr( 'ind' );
				_openBigImage( ind );
			});

			$overlay.find('.image_holder').on('click',function(ev){
				console.log(">> stuff",ev);
				if (ev.target.className.indexOf('nice-image') != -1){
					ev.preventDefault();
					_closeBigImage();

				}
			});

			$overlay.find('.arrow-left_small').on('click',function(ev){
				opacityFlash( $('.arrow-left') );
				_goPrev({source:'arrow'});
			});

			$overlay.find('.arrow-right_small').on('click',function(ev){
				opacityFlash( $('.arrow-right') );
				_goNext({source:'arrow'});
			});

			$("body").keydown(function(e) {
						if(e.keyCode == 37) { // left
							opacityFlash( $('.arrow-left') );
							_goPrev({source:'keyboard'});
						}
						else if(e.keyCode == 39) { // right
							opacityFlash( $('.arrow-right') );
							_goNext({source:'keyboard'});							
							// if in big image mode right = next => currentImageInd + 1							
						} else if (e.keyCode == 0 || e.keyCode == 32 ||  e.keyCode == 13){ // space & enter
							// _openBigImage( $('.slidee li.active .full_image').attr('href') );
							if ( isOpen ){
								_closeBigImage();
							} else {
								var ind = $('.slidee li.active .full_image').attr( 'ind' );
								_openBigImage( ind )
							}
						} else if (e.keyCode == 27){ 	// esc
								if (isOpen){
									_closeBigImage();
								}
									
						}
			});




		} // end init

		function _goNext( info ){
			if ( isOpen ){
				if ( currentImageInd < models_arr.length-1 ){
					_openBigImage( currentImageInd + 1, info );
				}
			}
			
		}

		function _goPrev( info ){
			if ( isOpen ){
				if ( currentImageInd > 0 ){
					_openBigImage( currentImageInd - 1, info );
				}
			}
		}

		function _openBigImage( ind, info ){
			ind = Number( ind );
			// console.log(">> _openBigImage ",models_arr, ind);	

			isOpen = true;

			$overlay.removeClass('hidden');
			var newImgInst;
			if (! models_arr[ind].bigImage ){
					console.log('title=' + models_arr[ind].title);
					
				newImgInst = new BigImage( models_arr[ind].fullSrc, models_arr[ind].title);
				models_arr[ind].bigImage = newImgInst;				
			}  else {
				newImgInst = models_arr[ind].bigImage;
			}

			$overlay.find('.image_holder').empty().append( newImgInst.$el );
			$overlay.find('.desc').html("  " + (ind + 1) + " / "+ models_arr.length +"  ")


			newImgInst.show();	

			// console.log(">> activate sly ",ind);
			currentImageInd = ind;
			_setMouseGraphics( info );

			// click to go next.. maybe not yet ?!
			newImgInst.$el.on('click',function(ev){
				//_goNext();
			});

			// show pointer if next..
			if ( currentImageInd < models_arr.length-1 ){
				// newImgInst.$el.css('cursor','pointer');
			}

			
		}

		function _closeBigImage(){
			isOpen = false;
			$overlay.addClass('hidden');
			$overlay.find('.image_holder').empty();
		}

		// Replace mouse cursor with graphics
		function _setMouseGraphics( info ){
			var that = this;
			var $mouse;
			that.isLeft = false;

			if (info && info.isLeft !== null){
				that.isLeft = info.isLeft;
			}
			console.log(">> mouse positions ",x,y);

			if (!isInitOverlay){
				$overlay.on('click',function(ev){
					if (isOpen && (ev.target.className != 'nice-image')){
						if (that.isLeft){
							// go prev
							console.log(">> _goPrev by mouse",that.isLeft);
							_goPrev({source:'mouse',isLeft: true});
						} else {
							// go next
							console.log(">> _goNext by mouse",that.isLeft);
							_goNext({source:'mouse',isLeft: false});
						}
					}
				}); // end $overlay.on('click'...)
				isInitOverlay = true;

				$overlay.mousemove(function(e){
					var x = Math.round( e.clientX );
					// var y = Math.round( e.clientY + $(document).scrollTop() - 38 );

					// console.log(">> mouse positions ",x,y);
					// console.log(">> sharedThemeUrl ",sharedThemeUrl);
							console.log(">> x?! ", x);
							console.log(">> $overlay.width()/2?! ", $overlay.width()/2);

					/*if (x > $overlay.width()/2){
						if (that.isLeft){
							$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-right-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-right-mouse.png), none'});
							that.isLeft = false;
						}
					} else {
						console.log(">> x.. in stanga ", that.isLeft);
						if (!that.isLeft){
							$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-left-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-left-mouse.png), none'});
							that.isLeft = true;
						}
					}*/
					// $mouse.css('left', x).css('top',y);
				});

			}
			
			//TODO .. find out how to take x position from mouse ?!!
			//console.log(">> _setMouseGraphics init that.isLeft?! ", "kk");
			//console.log(">> x?! ee ", "kk");

			if (x > $overlay.width()/2){
							that.isLeft = false;
						}
					else {
							that.isLeft = true;
						}
			
			
			console.log(">> $overlay.width()", $overlay.width());
			/*if (that.isLeft){
				$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-left-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-left-mouse.png), none'});
			} else {
				$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-right-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-right-mouse.png), none'});
			}*/

		}

		// public
		return {
			init: function(){
				_init();
			}
		} 
	}());

	SlideshowManager.init();


});