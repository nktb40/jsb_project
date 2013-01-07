$(document).ready(function() {
			$("#display_s_images a").click(function(e) {
				var img = $(this).find("img");
				var img_link = $("#display_b_image a");
				img_link.attr('href', img.attr('data-b-img'));
				var s_img = $("#display_b_image img");
				s_img.attr("src", img.attr('data-s-img'));
				e.preventDefault();
			});
			
			$("#b_image").fancybox({
		      'opacity'		: true,
				'overlayShow'	: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'none'
			});
			});