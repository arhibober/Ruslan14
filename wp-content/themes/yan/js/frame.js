$(document).ready
		(
			function ()
			{
				$("#coord").css ("left", (($(window).width - $("#coord").width) / 2) + "px");
				$("#but_r").click
				(
					function ()
					{
						$("#coord").removeClass ();
						$("#coord").addClass("container");
					}
				);			   
				$("input[name=cont]").change
				(
					function ()
					{	
						if ($("input[name=cont]:checked").val () != "")
						{
							$("#coord").removeClass();
							var cl = "container "+ $("input[name=cont]:checked").val() + "";
							$("#coord").addClass(cl.toLowerCase());
						}
					}
				);
			}
		);                                               