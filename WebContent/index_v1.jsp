<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/v1/img/common/favicon.ico" type="image/x-icon" />
<link href="/v1/css/common.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/main.css" rel="stylesheet" type="text/css" />
<title>메인 : ROMPAGE</title>
</head>
<body>
<div id="main_wrap">	
	<div class="logo">
		<a href="/"><img src="/v1/img/common/logo_main.png" alt="ROMPAGE로고" ></a>
	</div>
	<div id="main_container">
		<ul class="menu_list">
			<li>
				<a href="/resume/resume.cmd" class="menu">					
					<img src="/v1/img/main/main_menu1.png" alt="이력서 메뉴 이미지">
					<div class="menu_bg"></div>
					<h2>이력서</h2>
					<div class="menu_line"></div>
				</a>
			</li>
			<li>
				<a href="/portfolio/portfolio.cmd" class="menu">
					<img src="/v1/img/main/main_menu2.png" alt="포트폴리오 메뉴 이미지">					
					<div class="menu_bg"></div>
					<h2>포트폴리오</h2>
					<div class="menu_line"></div>
				</a>
			</li>
			<li>
				<a href="/gallery/gallery.cmd" class="menu">
					<img src="/v1/img/main/main_menu3.png" alt="갤러리 메뉴 이미지">					
					<div class="menu_bg"></div>
					<h2>갤러리</h2>
					<div class="menu_line"></div>
				</a>
			</li>
			<li>
				<a href="/v1/lotto/lotto.cmd" class="menu">
					<img src="/v1/img/main/main_menu4.png" alt="로또 메뉴 이미지">					
					<div class="menu_bg"></div>
					<h2>로또</h2>
					<div class="menu_line"></div>
				</a>
			</li>
		</ul>		
		<div class="clear"></div>
		<div class="login_btn">
			<c:choose>				
				<c:when test="${sessionScope.user.U_ID eq null}">
					<a href="/login/login.cmd">로그인</a>
				</c:when>
				<c:otherwise>					
					<button type="button" class="logoutBtn">로그아웃</button>
				</c:otherwise>
			</c:choose>
			 &nbsp;&nbsp; | &nbsp;&nbsp; ROMPAGE
		</div>
	</div>
	<div id="footer">
		<p class="copyright">Copyright © 2016 ROMPAGE All rights reserved.</p>
	</div>
</div>

<script src="/v1/js/jquery.1.11.1.js"></script>
<script src="/v1/js/jquery.1.11.4.ui.min.js"></script>
<script type="text/javascript">
(function(){
	var menu_list_a = $('a.menu');
	menu_list_a.on('mouseenter', function(){
		var size = $(this).find('h2').text().length;
		size = size * 20;
		$(this).find('.menu_line').animate({width: size+'px'},350);
		console.log($(this).find('img'))
		$(this).find('img').animate({opacity: '0.7'},350);
	}).on('mouseleave', function(){
		$(this).find('.menu_line').animate({width:'10px'},350);
		$(this).find('img').animate({opacity: '1'},350);
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
})();
</script>

</body>
</html>