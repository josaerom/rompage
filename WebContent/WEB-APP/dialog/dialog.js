(function(){
	var self = {};
	
	var option ={
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				Cancel: function() {
					dialog.dialog( "close" );
				}
			},
			open : function(){
				
			},
			close: function() {
			},
			show: {
				effect: "clip",
				duration: 300
			},
			hide: {
				effect: "clip",
				duration: 200
			}
	};
	
	self.open = function(obj, userOption){
		console.log('this');
		$.extend(option, userOption);
		dialog = obj.dialog(option);
		if(!rom.util.isNull(userOption.load)){
			console.log(userOption.load);
			dialog.load(userOption.load);
		}
		if(userOption.layout == false){
			console.log(userOption.layout);
			$('.ui-dialog-content').css('padding','0');
			$('.ui-dialog-titlebar').hide();
			$('.ui-dialog').css({'background':'transparent', 'border':'0'});
			$('.ui-dialog-content').css({'background':'transparent', 'border':'0'});
		}
		dialog.dialog( "open" );
		$('.ui-dialog-content').attr('tabindex',0);
	}
	
	if(typeof rom == 'undefined'){
		window.rom = {};
	}
	rom.dialog = self;
})();