(function(){
	var self = {};
	var timer = null;
	
	function showMessage(){
		var div = '<div class="loader" style="z-index: 220;"></div>';
		div += '<div class="ui-widget-overlay loader_bg" style="z-index: 210;"></div>';
		$('body').append(div);
		
		$('.loader').position({
			my : 'center',
			at : 'center',
			of : window
		});		
	}
	
	function hideMessage(){
		$('.loader').remove();
		$('.loader_bg').remove();
	}
	
	self.show = function () {
		showMessage();
	};
	self.hide = function () {
		hideMessage();
	};
	self.setTimeout = function (time) {

		if (timer !== null) {
			clearTimeout(timer);
			timer = null;
		}
		showMessage()
		timer = setTimeout(function () {
			hideMessage(true);
		}, time);
	};
	
	if(typeof rom == 'undefined'){
		window.rom = {};
	}
	rom.loader = self;
})();