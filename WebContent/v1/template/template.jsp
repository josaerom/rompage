<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><sitemesh:write property="title"/> : ROMPAGE</title>
<link rel="shortcut icon" href="/v1/img/common/favicon.ico" type="image/x-icon" />
<link href="/v1/css/common.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/animate.min.css" rel="stylesheet" type="text/css" />
<link href="/WEB-APP/nwagon/Nwagon.css" rel="stylesheet" type="text/css" />
<script src="/v1/js/jquery.1.11.1.js"></script>
<script src="/v1/js/jquery.1.11.4.ui.min.js"></script>
<script src="/v1/js/jquery.form.min.js"></script>
<script src="/v1/js/jquery.bxslider.js"></script>
<script src="/v1/js/layout.js"></script>
<script src="/WEB-APP/dialog/dialog.js"></script>
<script src="/WEB-APP/loader/loader.js"></script>
<script src="/WEB-APP/nwagon/Nwagon.js"></script>
<script src="/WEB-APP/common/agent.js"></script>
<script src="/v1/js/util.js"></script>
<sitemesh:write property="head"/>
</head>
<body>
<!-- wrap -->
<div id="wrap">
	<div id="top"></div>
	<!-- header -->
	<div id="header">
		<div id="skipToContent">
			<a href="#containerAcc" class="dir_container">메뉴 건너 뛰기</a>
		</div>
		<div class="top_line"></div>
		<div class="top_line_pot"></div>
		<div class="logo">
			<a href="/"><img src="/v1/img/common/logo.png" alt="ROMPAGE로고" ></a>
		</div>
		<button class="menu_btn hide_pc_show_mobile"><img src="/v1/img/common/menu_icon.png" alt="메뉴오픈"></button>
		<div class="gnb">
			<div class="nav_2depth_bg show_pc_hide_mobile"></div>
			<div class="login_wrap hide_pc_show_mobile">
				<c:choose>				
					<c:when test="${sessionScope.user.U_ID eq null}">
						<button type="button" class="btn btn_lg btn_pot loginBtn">로그<br>인</button>
					</c:when>
					<c:otherwise>
						<span class="user_name">${sessionScope.user.U_NAME }</span>님 반가워요:)<br><br>
						<button type="button" class="btn btn_lg btn_pot logoutBtn">로그<br>아웃</button>
					</c:otherwise>
				</c:choose>
				<!-- <a href="#" class="btn btn_lg btn_pot">로그인</a>
				<a href="#" class="btn btn_lg btn_pot">로그아웃</a>
				<a href="#" class="btn btn_lg">회원가입</a>
				<a href="#" class="btn btn_lg">회원정보</a> -->
			</div>
			<ul class="nav">
				<li>
					<a href="#">이력서</a>
					<div class="nav_2depth">
						<ul>
							<li><a href="/resume/resume.cmd">이력서</a></li>
							<li><a href="/resume/selfIntroduction.cmd">자기소개서</a></li>
						</ul>
					</div>					
				</li>
				<li>
					<a href="#">포트폴리오</a>
					<div class="nav_2depth">
						<ul>
							<li><a href="/portfolio/portfolio.cmd">포트폴리오</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="#">갤러리</a>
					<div class="nav_2depth">
						<ul>
							<li><a href="/gallery/gallery.cmd">갤러리</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="#">로또</a>
					<div class="nav_2depth">
						<ul>
							<li><a href="/v1/lotto/lotto.cmd">로또</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="#">관리자</a>
					<div class="nav_2depth">
						<ul>
							<li><a href="/admin/resumeUpdate.cmd">이력서 관리</a></li>
							<li><a href="/admin/selfIntroUpdate.cmd">자기소개서 관리</a></li>
							<li><a href="/admin/portfolioSelect.cmd">포트폴리오 관리</a></li>
							<li><a href="/rompage/prototype/main.jsp" class="nav_last show_pc_hide_mobile">프로토타입</a></li>
						</ul>
					</div>
				</li>
			</ul>
			<button type="button" class="btn_menu_off on hide_pc_show_mobile"><span class="blind">메뉴 닫기</span></button>							
		</div>
		<!-- title -->
		<div class="spot">
			<h1></h1>
		</div>
		<!-- title -->	
		<div class="font_size">
			<button type="button" class="btn font_plus">가 + <span class="blind">글씨 확대</span></button>
			<button type="button" class="btn font_minus">가 - <span class="blind">글씨 축소</span></button>
		</div>
	</div>
	<!-- //header -->
	
	<div class="scroll_area"> 
	<!-- container -->
		<div id="container">
			<sitemesh:write property="body"/>			
		</div>
		<!-- //container -->
		
		<!-- aside -->
		<div class="aside">
			<div class="top_line"></div>
			<button type="button" class="btn_aside on show_pc_hide_mobile"><span class="blind">사이드메뉴 버튼</span></button>
			<div class="aside_content show_pc_hide_mobile">	
				<c:choose>				
					<c:when test="${sessionScope.user.U_ID eq null}">
						<a href="/login/login.cmd" class="btn btn_lg btn_pot">로그인</a>
					</c:when>
					<c:otherwise>
						<span class="user_name">${sessionScope.user.U_NAME }</span> 반가워요:)<br>
						<button type="button" class="btn btn_lg btn_pot logoutBtn">로그아웃</button>
					</c:otherwise>
				</c:choose>				
				<!-- 
				<a href="#" class="btn btn_lg">회원가입</a>
				<a href="#" class="btn btn_lg">회원정보</a>			
				<a href="#" class="btn btn_lg">즐겨찾기</a> -->
			</div>
			<a href="/" class="btn_aside_home show_pc_hide_mobile"><span class="blind">home</span></a>
			<a href="#" class="btn_aside_top"><span class="blind">top</span></a>			
		</div>
		<!-- //aside -->
		
		<!-- footer -->
		<div id="footer">		
			<p class="copyright">Copyright © 2016 ROMPAGE All rights reserved.</p>
		</div>
		<!-- //footer -->
	</div>
</div>	
<!-- //wrap -->
<script type="text/javascript">
	(function(){
		//메뉴
		var gnb = $('.gnb');
		var nav1depthLi = $('.nav >li ');
		var navAllA = $('.nav a ');
		var nav2depthDiv = $('.nav_2depth');
		var nav2depthBg = $('.nav_2depth_bg');
		
		var device = 'pc';
		if($( window ).width() < 767){
			device = 'mobile';
		}else{
			device = 'pc';
		}
		
		/* 리사이즈 */
		$( window ).resize(function() {
			if($( window ).width() < 767){
				device = 'mobile';
				gnb.css({'display':'none', 'left':'-250px'}); //메뉴 숨김
				$('.loader_bg').remove(); //백그라운드 제거
				closeAside();
			}else{
				device = 'pc';
				gnb.css({'display':'block', 'left':'0'}); //메뉴 보임
				$('.loader_bg').remove(); //백그라운드 제거
			}
		});
		
		//메뉴
		var navTop = $('.gnb').offset().top;
		var spotTop = $('.spot').offset().top - 5;
		var scrollAreaTop = $('.scroll_area').offset().top;
		$(window).on('scroll', function(){
			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
			if (navTop < position) {
				$('.gnb').addClass('fixed');
				
            } else {
            	$('.gnb').removeClass('fixed');
            }
			if(device == 'mobile' || rom.agent.isMobile){ //모바일일 경우 상단 spot부분을 고정시킨다
				/* if (spotTop < position) {
					$('.spot').addClass('fixed');					
					$('.scroll_area').addClass('fixed');
					$('.scroll_area').css('top',scrollAreaTop + 'px');			
	            } else {	
	            	$('.spot').removeClass('fixed');
	            	$('.scroll_area').removeClass('fixed');
	            	$('.scroll_area').css('top','auto');
	            } */				
			}
		});
		
		function showNav2depth(obj){ //서브메뉴 보이기
			if(device == 'mobile' || rom.agent.isMobile){
				obj.find('.nav_2depth').addClass('on');
			}else{
				nav2depthDiv.addClass('on');
				nav2depthBg.addClass('on');			
				gnb.addClass('bon');
			}
		}
		function hideNav2depth(obj){ //서브메뉴 숨기기
			if(device == 'mobile' || rom.agent.isMobile){
				obj.find('.nav_2depth').removeClass('on');
			}else{
				nav2depthDiv.removeClass('on');
				nav2depthBg.removeClass('on');
				gnb.removeClass('bon');
			}
		}		
		nav1depthLi.on('mouseenter',function(){ //대메뉴 마우스오버
			$(this).find('a').addClass('on');
			showNav2depth($(this));
		}).on('mouseleave',function(){
			$(this).find('a').removeClass('on');
			hideNav2depth($(this));
		});
		nav1depthLi.on('click',function(){ //대메뉴 마우스오버
			$(this).find('a').addClass('on');
			showNav2depth($(this));
		});
		nav2depthBg.on('mouseenter',function(){ //메뉴 배경에 마우스올렸을 경우 서브메뉴 열림 유지
			showNav2depth($(this));
		}).on('mouseleave',function(){
			hideNav2depth($(this));
		});		
		nav2depthDiv.on('mouseenter',function(){ //서브메뉴 div에 마우스 올렸을 경우 서브메뉴 열림 유지
			showNav2depth($(this));
		});
		nav2depthDiv.on('focusin',function(){ //서브메뉴 div에 포커스가 있을 경우 서브메뉴 열림 유지
			$(this).parent().children('a').addClass('on');
		}).on('focusout',function(){
			$(this).parent().children('a').removeClass('on');
		});
		navAllA.on('focusin',function(){//네비게이션 모든 a링크에 포커스가 있을 경우 서븜뉴 열림
			$(this).addClass('on');
			showNav2depth($(this));
		}).on('focusout',function(){
			$(this).removeClass('on');
		});
		$('.nav_last').on('focusout',function(){
			hideNav2depth($(this));
		});
		
		//사이드메뉴
		var aside = $(".aside"); //사이드메뉴 div
		var btnAside = $('.btn_aside'); //열기/닫기버튼
		
		function openAside(){ //열기
			aside.animate({right:'160'},350);
			btnAside.addClass('off').removeClass('on');
		}
		function closeAside(){//닫기
			aside.animate({right:'0'},350);
			btnAside.addClass('on').removeClass('off');
		}		
		aside.on('click','.on',  function () { //열기버튼
			openAside();
	    });
		aside.on('click','.off',  function () {//닫기버튼
			closeAside();
	    });
		btnAside.on('keydown', function (e) {//shift+tab키 닫기
			var keyCode = e.keyCode || e.which;
            var shiftTab = e.shiftKey && keyCode == 9;
            if (shiftTab) {
            	closeAside();
            }
		});
		$('.btn_aside_home').on('keydown', function(e){//tab키 닫기
			var keyCode = e.keyCode || e.which;
            if (keyCode == 9) {
            	closeAside();
            }
		});
		$('.aside_content a').on('focusin', function(){//컨텐츠버튼 포커스시 오픈
			openAside();
		});		
		
		//top버튼
		$('.btn_aside_top').bind('click', function () {
		    $('html,body').stop().animate({
		        scrollTop: 0
		    }, 1200, "easeOutExpo")
		});
		
		
		$('.menu_btn').on('click', function(){ //모바일 메뉴오픈 버튼 클릭시
			gnb.css('display','block');
			gnb.animate({left:'0'},350);
			var div = '<div class="ui-widget-overlay loader_bg" style="z-index: 50; background-color:#000;"></div>';
			$('body').append(div);
		});
		$('.btn_menu_off').on('click', function(){// 모바일 메뉴 닫기 버튼 클릭시
			gnb.animate({left:'-250px'},350);
			$('.loader_bg').remove();
		});
		
		var logoutBtn = $('.logoutBtn');
		logoutBtn.on('click', function(){
			$.ajax({
				url: "/login/logout.cmd",
				success: function(result){
					var data = $.parseJSON(result);	
					if(data.result){
						window.location.reload();		
					}else{
						alert('로그아웃 오류');
					}
				}
			});
		});		
		
		var loginBtn = $('.loginBtn');
		loginBtn.on('click', function(){
			window.location.href = '/login/login.cmd';
		});
		
		//폰트 확대
		$('.font_plus').on('click', function(){
			if(device == 'mobile' || rom.agent.isMobile){ //모바일
				if($('body').css('font-size') == '17px'){
					return;
				}	
			}else{
				if($('body').css('font-size') == '20px'){
					return;
				}
			}
			
			$('body, .user_name, h1, h2, h3, h4, h5, .bullet, thead th, tbody th, span, p, a').css({'font-size':'+=1'});
			$('.content a, button').css({'height':'+=1'});
			$('.nav_2depth_bg').css({'height':'+=7'});
			$('thead th, tbody th, tbody td').css({'padding-top':'+=2', 'padding-bottom':'+=2'});				
			$('.school_list > div').css({'width':'+=10'});			
		});
		//폰트 축소
		$('.font_minus').on('click', function(){
			if($('body').css('font-size') == '14px'){
				return;
			}
			$('body, .user_name, h1, h2, h3, h4, h5, .bullet, thead th, tbody th, span, p, a').css({'font-size':'-=1'});
			$('.content a, button').css({'height':'-=1'});
			$('.nav_2depth_bg').css({'height':'-=7'});
			$('thead th, tbody th, tbody td').css({'padding-top':'-=2', 'padding-bottom':'-=2'});
			$('.school_list > div').css({'width':'-=10'});						
		});
	})();
	
</script>	
	
</body>
</html>