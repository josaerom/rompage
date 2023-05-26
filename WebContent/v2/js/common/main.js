$(function(){
	var main = {
			$el : $('.main-wrap'),
			init : function(){				
				var myFullpage = $('#fullpage').fullpage({
				    anchors: ['section01', 'section02', 'section03', 'section04'],				    
				    navigation: true,
				    navigationPosition: 'fp-nav',
				    navigationTooltips: ['롬페이지 소개 영역', '이력서 영역', '포트폴리오 영역', '관리자 영역'],
				    responsiveHeight: 350,
				    lockAnchors: true,
				    afterLoad : function(anchorLink, index){
				    	//index == 1 ? $('.scroll_wrap').stop().slideUp(600) : $('.scroll_wrap').stop().slideDown(600);
				    	index == 1 ? $('.scroll-wrap').removeClass('active') : $('.scroll-wrap').addClass('active');
				    }
				});
				setTimeout(function(){
					main.$el.addClass('init');
				}, 100)
				
				this.runSlick();
				this.addEvent();
			},
			runSlick: function(){
				_this = $('.section01')[0]
				var slider = new KeenSlider('#keen-slider-1550478309794', {
					loop : true,
					//slidesPerView : 1,
					arrows : false,
					dots: true,
					autoplay: false,
					autoplaySpeed: 8000,
					created: function (instance) {
						instance.settings(_this, instance);
					},
					slideChanged: function(instance) {						
						instance.updateClasses(_this, instance);
					},
					prevArrow: '<button type="button" class="slick-prev" aria-label="이전">이전<span class="icon" aria-hidden="true"><svg width="23px" height="40px"><path fill-rule="evenodd" fill="currentColor" d="M21.577,2.477 L3.668,19.984 L21.577,37.491 C22.160,38.061 22.160,38.985 21.577,39.555 C20.994,40.126 20.048,40.126 19.465,39.555 L0.726,21.238 C0.634,21.181 0.534,21.140 0.454,21.061 C0.150,20.764 0.013,20.373 0.025,19.984 C0.013,19.595 0.150,19.204 0.454,18.907 C0.535,18.828 0.635,18.786 0.728,18.729 L19.465,0.412 C20.048,-0.158 20.994,-0.158 21.577,0.412 C22.160,0.983 22.160,1.908 21.577,2.477 Z"/></svg></span></button>', // common.js variable
					nextArrow: '<button type="button" class="slick-next" aria-label="다음">다음 <span class="icon" aria-hidden="true"><svg width="23px" height="40px"><path fill-rule="evenodd" fill="currentColor" d="M21.546,21.061 C21.466,21.140 21.366,21.181 21.274,21.238 L2.535,39.555 C1.952,40.126 1.006,40.126 0.423,39.555 C-0.161,38.985 -0.161,38.061 0.423,37.491 L18.332,19.984 L0.423,2.477 C-0.161,1.908 -0.161,0.983 0.423,0.412 C1.006,-0.158 1.952,-0.158 2.535,0.412 L21.272,18.729 C21.365,18.786 21.465,18.828 21.546,18.907 C21.849,19.204 21.987,19.595 21.975,19.984 C21.987,20.373 21.849,20.764 21.546,21.061 Z"/></svg></span></button>', // common.js variable
					appendDots:null,
					duration: 1000,
					dragStart: function(instance){
					},
					dragEnd: function(instance){
						
					},
					beforeChange: function(instance){
					},
					afterChange: function(instance){
					}
				});
			},
			addEvent : function(){
				$('.top-btn button').click(function() {
					$.fn.fullpage.moveTo(1);
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
	main.init();
	
	
});
