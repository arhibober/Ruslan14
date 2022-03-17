console.log (" jqhshh");
var CONTENT_TOP = 100;
		jQuery (document).ready (function(){
			console.log (" jqhshh");			
			console.log (" jqhshh: " + jQuery ("header.site-header").height ());
			console.log (" jqhshh20px: " + (jQuery ("header.site-header").height () + 20) + "px;");
			jQuery ("#overlay").css ("top", (jQuery ("header.site-header").height () + 20) + "px;");
			jQuery ("#but_r").click(function(){
				jQuery(".nice-image").removeClass();
				jQuery(".nice-image").addClass("container");
			});			   
			jQuery("#cont").change(function() {
						/*if ( jQuery("#cont option:selected").val() != "" ) {
								jQuery(".nice-image").removeClass();
								var cl = "container "+ $("#cont option:selected").val() + "";
								jQuery(".nice-image").addClass(cl.toLowerCase());
						}*/
				});
				jQuery ("#overlay span").bind ("click", function () {
					console.log ("jjjj");
					jQuery("#fancy_overlay").css ("display", "block !important");
					jQuery("#fancy_loading").css ("display", "block !important");
					jQuery("#fancy_outer").css ("display", "block !important");
				});				
});
			
function fancy ()
{
	//function () {
		console.log ("jjjj");
		jQuery("#fancy_overlay").css ("display", "block !important");
		jQuery("#fancy_loading").css ("display", "block !important");
		jQuery("#fancy_outer").css ("display", "block !important");
	//}
}
			
			
	
// BIG IMAGE CLASS 
function BigImage (src, title)
{
	this.title = title;
	this.src = src;
	this.isInit = false;
	this.init();
	return this;
}

BigImage.prototype = 
{
	init: function ()
	{
		var that = this;
		var img_id = window.location.href.split ("/") [window.location.href.split ("/").length - 1];
		var album = window.location.href.split ("/") [4];
		console.log (" init: " + window.location.href);
		this.$el = jQuery('<img src="'+this.src+'" title="' + this.title + '" class="nice-image positioned fade loading"><br/><span class="picture_title">' + this.title + '</span><br/><a href="/Ruslan14/zakaz-kartiny?guid=' + this.src + '&mode=reproduction&album=' + album + '" class="picture-buy" onclick="event.stopImmediatePropagation()">Заказать картину</a><a href="/Ruslan14/zakaz-kartiny?guid=' + this.src + '&mode=copy&album=' + album + '" class="picture-buy picture-buy-copy" onclick="event.stopImmediatePropagation()">Заказать печатную копию на холсте</a><a href="http://localhost/Ruslan14/podbor-ramy-dlya-kartiny?guid=' + this.src + '&ourl=' + window.location + '" class="picture-buy frame-link">Посмотреть в раме</a>' 
		);
		this.el = this.$el.get(0);

		this.isInit = true;

		this.preload.apply(this);

		jQuery(window).on('resize',function(){
			that.resize.apply( that );
		});		
		console.log(" init: " + window.location.href);		
		console.log(" img_id: " + img_id);
					
			console.log(" img_id_ajax: " + img_id);
	},


	// Should prepare img tag + add events on it
	preload : function( endF ) {
		// body...
		var that = this;
		if (!this.isInit){
			this.init();
		};

		if (! this.checkLoaded()){
			// console.log(">> starting _preload!! ");

			clearInterval(that.preloadInt); 
			this.preloadInt = setInterval(function(){
					if (that.checkLoaded()){
					 	window.requestAnimationFrame(function(){
					 		// console.log(">> checkLoaded",that.preloadInt);
					 		that.resize();
					 		if (endF) endF();
					 	});
					 	clearInterval(that.preloadInt); 
					 		
					}
			},33); // end interval 
		} else {
			window.requestAnimationFrame(function(){
			 		that.resize();
			 		if (endF) endF();
		 	});
		}
		console.log(" preload: " + window.location.href);
	},

	// Check if image has loaded and return true / false
	checkLoaded : function() {
	    if ( this.hasLoaded ) return true;
	    if ( this.hasError ) return true; // it failed.. let the rest load
	    // console.log(">> doing the checkLoad",this.preloadInt, this.el);

	    if ( this.el.complete && this.el.naturalWidth !== 0 ) {
    	    this.$el.trigger('load');
   
    	    if (this.preloadInt){
    	    	clearInterval(this.preloadInt); 		//clear the preload() interval
    		}

        	this.hasLoaded = true;
        	// this.$el.removeClass('loading');

        	// this.$parent.removeClass('loading');
        	
        	var that = this;
        	setTimeout(function(){
        		that.$el.addClass('done');
        	},100);
        	

        	// console.log(">> image finished loading ",this);

        	return true;
        }

        return false;
		//console.log(" check loaded: " + window.location.href);
	},

	show: function(){
		
		function _showSelf(){
			that.resize();
			
			that.$el.removeClass('fade');
			that.$el.removeClass('done');
			that.$el.addClass('loading');
			// console.log(">> BigImage > _showSelf() what be the opacity? ",that.$el.css('opacity'));
			window.requestAnimationFrame(function(){
				that.$el.addClass('fade');
				that.$el.addClass('done');
			});
		}

		var that = this;

		this.preload.apply(this, [_showSelf] );
		console.log(" show: " + window.location.href);
	},

	resize : function(){
			var ww = jQuery('#overlay').width();
			var wh = jQuery('#overlay').height();

			var imgW = this.el.naturalWidth || this.$el.width();
			var imgH = this.el.naturalHeight || this.$el.height();
			var newImgW = imgW;
			var newImgH = imgH;
			CONTENT_TOPw = 0.6*ww;
			CONTENT_TOPh = 0.6*wh;
			if ( imgW > ww - CONTENT_TOPw/2){
				newImgW = ww - CONTENT_TOPw/2;
				newImgH = imgH/imgW * newImgW;
				console.log(">> this.resize 1",newImgW,newImgH, imgW, imgH, ww, wh);
			}

			if ( newImgH > wh - CONTENT_TOPh/2){
				newImgH = wh - CONTENT_TOPh/2;
				newImgW = imgW/imgH * newImgH;
console.log(">> this.resize 2",newImgW,newImgH, imgW, imgH, ww, wh);
/*console.log(">> el[0]: ",this.$el[0]);
this.$el[0].css("top",20);*/
console.log(">> el top: ",this.$el[0]);
			}
			newImgW = Math.round( newImgW );
			newImgH = Math.round( newImgH );

			var l = ( ww - newImgW )/2;
			var t = ( wh - newImgH )/2 - 82;
			t=20;
			//if(this.$el[0].tagName == "IMG"){
			/*this.$el[0].css({"top":t,"left":l,"width":newImgW,"height":newImgH});
			 console.log(">> this.resize ",t,l,newImgW,newImgH, imgW, imgH, ww, wh, " resine: " + window.location.href);	*/
			 /*var str_el = this.$el[0].outerHTML;
			 str_el = str_el.substring(0,str_el.length - 1) + ' style = "' +'top: ' + t + '; left: ' + l + '; width:' + newImgW + '; height: ' + newImgH + '">';
			 console.log(">> str_el : ",str_el );
			 this.$el[0] = str_el;*/
			/* console.log(">> str_el : ",str_el );
			 (this.$el[0]).attr('style', 'top: ' + t + ', left: ' + l + ', width:' + newImgW + ', height: ' + newImgH);*/
			 //console.log(">> el[0]: ",this.$el[0]);
			//}			 
			jQuery(".nice-image").css("top", t);
			jQuery(".nice-image").css("left", l);
			jQuery(".nice-image").css("width", newImgW);
			jQuery(".nice-image").css("height", newImgH);
		
	}
}
//document.write ('<a href="/zakaz-kartiny?id=' + window.location.href.split ("/") [window.location.href.split ("/").length - 1]+ '" class="picture-buy">Заказать копию на холсте</a>');
// -- end BIG IMAGE CLASS

