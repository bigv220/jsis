$(document).ready(function() {
    
	$('#supermenu ul > li > a + div').each(function(index, element) {	
		
		var supermenu = $('#supermenu').offset();
		var ddown = $(this).parent().offset();
		
		i = (ddown.left + $(this).outerWidth()) - (supermenu.left + $('#supermenu').outerWidth());
		
		if (i > 0) {
			//$(this).css('margin-left', '-' + (i -10) + 'px');
			$(this).css('text-align', 'center');
			$(this).css('margin-left', '-10px');
		}
	});
	$('#supermenu  ul  li  div .withimage .image').mouseover(
		function() {
			$(this).next().find('span').addClass('menu-hover');
		}
	);
	$('#supermenu  ul  li  div .withimage .name').mouseover(
		function() {
			$(this).prev().find('span').addClass('menu-hover');
		}
	);
	$('#supermenu  ul  li  div .withimage,#supermenu  ul  li  div .withimage').mouseleave(
	
		function() {
			
			$('.withimage a span').removeClass('menu-hover');
		}		
	);
});