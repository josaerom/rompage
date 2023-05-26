$(document).ready(function(){
	var bntDirContainer = $('.dir_container');
	
	bntDirContainer.on('click', function(){
		var container = $('.content');
		var focusable = container.find(':header:visible, :focusable');
		var focusable1st = focusable.eq(0);
		
		if(!focusable1st.is(':focusable')){
			focusable1st.attr('tabindex','0');
		}
		console.log(focusable1st)
		focusable1st.focus();
	});
	
	$('img').on('error', function(){
		$(this).attr({'src' : '/v1/img/error/no_image.JPG'});
		$(this).wrap('<div class="no_image_wrap"></div>');
		$(this).before('<div class="no_image">NO IMAGE</div>');
	});
});