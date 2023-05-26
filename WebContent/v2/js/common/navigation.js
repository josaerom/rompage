$(document).ready(function(){
	var navigation = {
			$el : $('header'),
			$nav : $('.nav li'),
			$version : $('.version'),
			$mobileBtn : $('.nav-2depth-btn'),
			$hamburger : $('.menu-hamburger'),
			init : function(){
				this.addEvent();
			},
			addEvent : function(){
				var _this = navigation;
				
				_this.$nav.on('mouseover focusin focus keydown', function(e){
					$(this).children('.nav-2depth').addClass('active');
					if(e.shiftKey) $(this).children('.nav-2depth').removeClass('active');
				}).on('mouseleave', function(){
					$(this).children('.nav-2depth').removeClass('active');
				});
				
				_this.$nav.find('.nav-2depth a:last').on('focusout', function(){
					$(this).parents('.nav-2depth').removeClass('active');
				})
				
				_this.$version.find('button').on('click', function(){
					$(this).parent().toggleClass('active');
					_this.ariaExpanded($(this));
				});
				_this.$version.find('button').on('keydown', function(e) {
				     var code = e.keyCode || e.which;
				     if (e.shiftKey && code === 9) {
				    	 _this.$version.removeClass('active');
				    	 _this.ariaExpanded($(this), false);
				     }
				});
				
				_this.$hamburger.off('click').on('click', function(){
					$(this).children().toggleClass('on');
					$('header').toggleClass('on').hasClass('on') ? $(".header-on").stop().slideDown(600) : $(".header-on").stop().slideUp(600);
					_this.ariaExpanded($(this));
					$(this).focus();
				});
				
				_this.$mobileBtn.on('click', function(){				    
				    $(this).siblings('.nav-2depth-on').toggleClass('on').hasClass('on') ? $(this).siblings('.nav-2depth-on').stop().slideDown(600) : $(this).siblings('.nav-2depth-on').stop().slideUp(600);
				    _this.ariaExpanded($(this));
				})
				
				$('.header-on .nav > li:last-child a:last').on('keydown', function(e) {
				     var code = e.keyCode || e.which;
				     if (!e.shiftKey && code === 9) {
				    	 $('.menu-hamburger').click();
				     }
				});
				_this.$version.find('ul li:last a').on('keydown', function(e) {
				     var code = e.keyCode || e.which;
				     if (!e.shiftKey && code === 9) {
				    	 _this.$version.removeClass('active');
				    	 _this.ariaExpanded($('.version button'));
				     }
				});
				
			}, 
			ariaExpanded : function(target, only){
				if(typeof only != 'undefined'){
					target.attr('aria-expanded', only)
				}else{
					target.attr('aria-expanded') == 'true' ? target.attr('aria-expanded', false) : target.attr('aria-expanded', true);
				}
			}
	}
	navigation.init();
	
});