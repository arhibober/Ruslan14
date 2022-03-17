/* LINEAR PARTITION ALGORITHMS */

console.log (" jqhshh");
var linearPartition = function (seq, k) {

    var i, n, partitionTable, table, solution, ans = [],

        finalResult = [];



    if (k <= 0) {

        return finalResult;

    }



    n = seq.length - 1;



    if (k > n) {

        for (i = 0; i < seq.length; i++) {

            finalResult.push([seq[i]]);

        }



        return finalResult;

    }



    partitionTable = linearPartitionTable(seq, k);



    table = partitionTable[0];

    solution = partitionTable[1];



    k = k - 2;



    while (k >= 0) {

        var partialAns = [];



        for (i = solution[n - 1][k] + 1; i < n + 1; i++) {

            partialAns.push(seq[i]);

        }



        partialAns = [partialAns];



        ans = partialAns.concat(ans);

        n = solution[n - 1][k];

        k = k - 1;

    }



    for (i = 0; i < n + 1; i++) {

        finalResult.push(seq[i]);

    }



    finalResult = [finalResult];



    return finalResult.concat(ans);

};





var linearPartitionTable = function (seq, k) {

    var i, j, n = seq.length,

        row = [],

        table = [],

        solution = [];



    // Create the table

    for (i = 0; i < n; i++) {

        row = [];

        for (j = 0; j < k; j++) {

            row.push(0);

        }

        table.push(row);

    }



    // Create solution

    for (i = 0; i < n - 1; i++) {

        row = [];

        for (j = 0; j < k - 1; j++) {

            row.push(0);

        }

        solution.push(row);

    }



    for (i = 0; i < n; i++) {

        table[i][0] = seq[i] + (i ? table[i - 1][0] : 0);

    }



    for (i = 0; i < k; i++) {

        table[0][i] = seq[0];

    }



    for (i = 1; i < n; i++) {

        for (j = 1; j < k; j++) {

            var listToMin = [],

                x;

            for (x = 0; x < i; x++) {

                listToMin.push([Math.max.apply(Math, [table[x][j - 1], table[i][0] - table[x][0]]), x]);

            }



            var result = {

                computed: Infinity,

                value: Infinity

            };

            for (x = 0; x < listToMin.length; x++) {

                listToMin[x][0] < result.computed && (result = {

                    value: listToMin[x],

                    computed: listToMin[x][0]

                });

            }



            table[i][j] = result.value[0];

            solution[i - 1][j - 1] = result.value[1];

        }

    }



    return [table, solution];

};





// options



/**



images = [{

    width:

    height:

    ... Custom info

}]



options = {

    containerWidth: int,

    preferedImageHeight: int,

    border: int,

    spacing: int

}



**/

var linearPartitionFitPics = function (images, options) {

    options.border = options.border || 0;

    options.spacing = options.spacing || 0;



    var index = 0,

        partition, rowBuffer = [],

        rows, summedWidth = 0,

        summedRatios = 0,

        weights = [];



    for (var i = 0; i < images.length; i++) {

        images[i].aspectRatio = images[i].width / images[i].height;

        summedWidth += images[i].aspectRatio * options.preferedImageHeight;

    }



    rows = Math.round(summedWidth / options.containerWidth);



    console.log(rows);



    if (rows < 1) {

        for (i = 0; i < images.length; i++) {

            images[i].width = parseInt(options.preferedImageHeight * photo.aspectRatio, 10);

            images[i].height = options.preferedImageHeight;

        }

    } else {

        for (i = 0; i < images.length; i++) {

            weights.push(parseInt(images[i].aspectRatio * 100, 10));

        }



        partition = linearPartition(weights, rows);



        for (i = 0; i < partition.length; i++) {

            var row = partition[i];

            var rowWidth = options.containerWidth;



            if(options.spacing){

                rowWidth = rowWidth - (options.spacing * (row.length - 1));

            }



            summedRatios = 0;

            rowBuffer = [];



            for (j = 0; j < row.length; j++) {

                rowBuffer.push(images[index++]);

            }



            for (j = 0; j < rowBuffer.length; j++) {

                summedRatios += rowBuffer[j].aspectRatio;

            }





            for (j = 0; j < rowBuffer.length; j++) {

                var image = rowBuffer[j];

                image.width = parseInt(rowWidth / summedRatios * image.aspectRatio, 10);

                image.height = parseInt(rowWidth / summedRatios, 10);

                if(j === rowBuffer.length - 1){

                    image.break = true;

                }

            }

        }

    }



    return images;

};

























jQuery(document).ready(function($){



	var CONTENT_TOP = 0;

	var GALLERY_MARGIN = 0;

	var SIDEBAR_WIDTH = 250;



	// UTILS

	function opacityFlash( $el ){

		$el.addClass('flash');

		setTimeout(function(){

			$el.removeClass('flash');

		},500);	

	}

	// -- 





	// var $frame = $("#frame");

	// var $imgs = $frame.find('img');

	// var $overlay = $('#overlay');

	

	// var CONTENT_TOP = 150;

	// var GALLERY_MARGIN = 0;

	



	// SLIDESHOW MANAGER MODULE

	

	var SlideshowManager = (function(){

		var THUMB_HEIGHT = 150;

		var currentMaxH;

		var currentMaxW;

		var currentImageInd = 0;



		var models_arr = [];



		var $frame = $("#frame");

		var $thumbs = $frame.find('img');

		var $overlay = $('#overlay');

		var $controls = $overlay.find('.controls');

		var $container = $('body > .container');

		var $info = $('#info');



		var isOpen = false;

		var isInitMouse = false;

		var isInitOverlay = false;

		

		// private

		function _init(){


			$info.appendTo('body > .sidebar');
			$thumbs.each(function(ind, imgEl){

				var $imgEl = $(imgEl);

				

				$imgEl.attr('ind',ind);

				$imgEl.parent().attr('ind',ind);



				// Set correct sizes

				var orW = $(imgEl).data().origWidth;

				var orH = $(imgEl).data().origHeight;



				var model = {

					el: imgEl,

					$el : $imgEl,

					mobilebSrc: $imgEl.data().srcMobile,

					fullSrc: $imgEl.data().src,

					id: ind,

					bigImage: null,

					fullSrc: $imgEl.parent().attr('href'),

					urlId: $imgEl.parent().parent().data().urlId.toString(),

					width: orW,

					height: orH,

					originalImage: imgEl,
					
					title: $imgEl.attr('title')

				}



				models_arr[ ind ] = model;







				var newH = THUMB_HEIGHT; // +1 fix white border under images

				var newW = Math.round( newH * orW / orH );





				var $liHolder = $(imgEl).parent().parent();

				// $liHolder.css({width: newW, height: newH});

					

			

			});



			//console.log(">> models_arr",models_arr);





			// initialize slider

			$frame.sly({

				// itemNav: 'basic',

				activateOn: 'click',

				mouseDragging: 1,

				touchDragging: 1,

				releaseSwing: 1,



				keyboardNavBy:'items',





				scrollBar: '#scrollbar',

				scrollBy: 100,

				speed: 300,

				elasticBounds: 1,

				easing: 'easeOutExpo',



				dragHandle: 1,

				dynamicHandle: 1,

				clickBar: 1

			});



			// $frame.sly('init');



			_resize();



			// register resize 

			$(window).on('resize',_resize);



	

			 var bLazy = new Blazy({ 

					multi: [ {

							  width: 768 // max-width

							, src: 'data-src-mobile'

					}],

					container: '#frame'

			});

	

			



			$("body").keydown(function(e) {

						if(e.keyCode == 37) { // left

							opacityFlash( $('.arrow-left') );

						}

						else if(e.keyCode == 39) { // right

							opacityFlash( $('.arrow-right') );

							// if in big image mode right = next => currentImageInd + 1							

									

						}

			});





			// ADD URL SUPPORT

			// $frame.sly('on','active', _activatedSlide);





			Path.map("#/img/:urlId").to(function(){

				_doActivateSlide( this.params['urlId'] );

			});

			

			Path.root('#/');

			Path.listen();





			// open big image

			$('.full_image').on('click',function(ev){

				ev.preventDefault();

				var ind = $(this).attr( 'ind' );

				console.log("open big image ind:",ind);

				_openBigImage( ind );

			});



			$overlay.find('.image_holder').on('click',function(ev){

				// //console.log(">> stuff",ev);

				// if (ev.target.className == 'image_holder') 

				// _closeBigImage();

			});







			$overlay.find('.arrow-left_small').on('click',function(ev){

				_goPrev({source:'arrow'});

			});



			$overlay.find('.arrow-right_small').on('click',function(ev){

				_goNext({source:'arrow'});

			});



			$info.find('.show_thumbs').on('click',function(){

				if (isOpen){

					_closeBigImage();

				}

			});



			$("body").keydown(function(e) {

						if(e.keyCode == 37) { // left

							opacityFlash( $('.arrow-left') );

							opacityFlash( $('.arrow-left_small') );

							_goPrev({source:'keyboard'});

						}

						else if(e.keyCode == 39) { // right

							opacityFlash( $('.arrow-right') );

							opacityFlash( $('.arrow-right_small') );

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





		function _doActivateSlide( urlId ){

			// console.log(">> _doActivateSlide", urlId, models_arr);

			var ind = -1;

			

			for (var i = 0; i < models_arr.length; i++) {

			

				if (models_arr[i].urlId === urlId){

					ind = i;

					break;

				}	

			};



			// console.log(">> ind",ind);



			if (ind === -1){

				return;

			}



			if (ind == currentImageInd ) return;



			_openBigImage(ind, {source:'url'});

		}







		function _setActiveUrlPath( urlId ){



			window.location = '#/img/'+urlId;



		}



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
				newImgInst = new BigImage( models_arr[ind].fullSrc, models_arr[ind].title);

				models_arr[ind].bigImage = newImgInst;				

			}  else {

				newImgInst = models_arr[ind].bigImage;

			}



			$overlay.find('.image_holder').empty().append( newImgInst.$el );

			$overlay.find('.desc').html(" ( " + (ind + 1) + " / "+ models_arr.length +" ) ")

			



			$info.removeClass('hidden').addClass('out').addClass('fade').addClass('in').removeClass('out');



			$info.find('.desc').html("  " + (ind + 1) + " / "+ models_arr.length +"  ")





			newImgInst.show();	

			if (!info || info.source!='keyboard') $frame.sly('activate',ind);



			// console.log(">> activate sly ",ind);

			currentImageInd = ind;



			_setMouseGraphics( info );



			_setActiveUrlPath( models_arr[ind].urlId );



			// click to go next.. maybe not yet ?!

			newImgInst.$el.on('click',function(ev){

				//_goNext();
				console.log ("jjjj");
				jQuery("#fancy_overlay").css ("display", "block !important");
				jQuery("#fancy_loading").css ("display", "block !important");
				jQuery("#fancy_outer").css ("display", "block !important");

			});



			// show pointer if next..

			if ( currentImageInd < models_arr.length-1 ){

				// newImgInst.$el.css('cursor','pointer');

			}



			

		}



		function _closeBigImage(){

			console.log(">> _closeBigImage");

			

			$info.removeClass('in').removeClass('fade').addClass('hidden');



			isOpen = false;

			$overlay.addClass('hidden');

			$overlay.find('.image_holder').empty();

			window.location = '#/';

			

			_resetMouseGraphics();



		}





		// Replace mouse cursor with graphics

		function _setMouseGraphics( info ){

			var $mouse;

			var isLeft = true;



			if (info && info.isLeft !== null){

				isLeft = info.isLeft;

			}



			if (!isInitOverlay){

				$overlay.on('click',function(ev){

					if (isOpen){

						if (isLeft){

							// go prev

							console.log(">> _goPrev by mouse",isLeft);

							_goPrev({source:'mouse',isLeft: true});

						} else {

							// go next

							console.log(">> _goNext by mouse",isLeft);

							_goNext({source:'mouse',isLeft: false});

						}

					}

				}); // end $overlay.on('click'...)

				isInitOverlay = true;



				$overlay.mousemove(function(e){

					var x = Math.round( e.clientX - $(document).scrollLeft() - 37.5 );

					var y = Math.round( e.clientY + $(document).scrollTop() - 38);



					 console.log(">> mouse positions ",x);

					// console.log(">> sharedThemeUrl ",sharedThemeUrl);



					/*if (x > SIDEBAR_WIDTH - 50 + $overlay.width()/2){

						if (isLeft){



							$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-right-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-right-mouse.png), none'});

							isLeft = false;

						}

					} else {

						if (!isLeft){

							$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-left-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-left-mouse.png), none'});

							isLeft = true;

						}

					}*/
					if (x > $overlay.width()/2){
							isLeft = false;
						}
					else {
							isLeft = true;
						}
						console.log(">> x ",x);
						console.log(">> y ",y);
						console.log(">> $overlay.width()/2 ",$overlay.width()/2);
						console.log(">> isLeft ",$overlay.width()/2);
						console.log(">> pbost ",$(".picture-buy").offset().top);
						if (y <= $(".picture-buy").offset().top - 58)
						{
							if (isLeft)
								$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-left-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-left-mouse.png), none'});
							else
								$overlay.css({'cursor':'url(' + sharedThemeUrl + '/img/arrow-right-mouse.cur), url(' + sharedThemeUrl + '/img/arrow-right-mouse.png), none'});
						}

					// $mouse.css('left', x).css('top',y);

				});



			}

			

			// if (!isInitMouse){

			// 	$mouse = $('<div id="mouse" class="hidden"></div>');



			// 	$('body').append($mouse);

			// 	isInitMouse = true;

			// } else {

			// 	$mouse = $('#mouse');

			// }



			// $overlay.mouseout(function( e ){

			// 	if($(e.relatedTarget).is('#mouse')) { return false; }

			// 	$mouse.hide();

			// 	$(this).css("cursor","none");

			// 	return false;

			//  });

			// $overlay.mouseenter(function( e ){

			// 	 if($(e.fromElement).is('#mouse')) { return false; }

			// 	$mouse.show();

			// 	return false;

			//  });

			console.log(">> _setMouseGraphics init isLeft?! ", isLeft, info);
			/*if (x > $overlay.width()/2){
							that.isLeft = false;
						}
					else {
							that.isLeft = true;
						}*/
						console.log(">> _setMouseGraphics init isLeftuu?! ", isLeft, info);
						//console.log(">> x?!", x, info);



			



		}





		// Mouse back to normal

		function _resetMouseGraphics(){



		}





		function _resize(){

			//console.log(">> doResize() ");



			var fullWidth = 0;



			var maxw = $(window).width(); // max screen width

			var maxh = $(window).height(); // max screen width



            var resized_images = linearPartitionFitPics(models_arr, {

                containerWidth: maxw - 80,

                preferedImageHeight: parseInt(maxh / 4, 10),

                spacing: 4

            });



            $.each(models_arr, function(index, image){

                $(image.originalImage).height(image.height).width(image.width).css("margin-bottom", 4);;

                if(!image.break){

                    $(image.originalImage).css("margin-right", 4);

                }

            });





			$('body > .container').width( maxw - 40 );



			setTimeout(function(){



				var $lis = $frame.find('li');

				var h = $($lis[$lis.length-1]).position().top + $($lis[$lis.length-1]).height() + 30;

				



				$('#items').height( h );



				console.log(">> setTimeout $('#items').height()",$('#items').height());

				$frame.sly('reload');

				$('#items').height( h );



				if (h > maxh){

					$('#scrollbar').removeClass('hidden');				

				} else {

					

					$('#scrollbar').addClass('hidden');				

				}



			},1000);

			



		}

		// public

		return {

			init: function(){

				_init();

			}

		} 

	}());



	SlideshowManager.init();











	





	// TODO: think of a clean slideshow impplementation..

	// imgs..

	// click one.. 

	// click next..

	// url ?











});