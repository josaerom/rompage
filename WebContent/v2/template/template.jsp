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
<link rel="shortcut icon" href="/common/img/common/favicon.ico" type="image/x-icon" />
<link href="/v2/css/common.min.css" rel="stylesheet" type="text/css" />
<sitemesh:write property="head"/>
</head>
<body>
<!-- wrap -->
<div class="wrap">
	<div id="skipToContent" class="skip_nav">
		<a href="#content" class="dir_container">메뉴 건너 뛰기</a>
	</div>
	<!-- header -->
	<!-- <header>
		<h1 class="logo"><a href="/"><img src="/v2/image/common/rompage_logo.png" alt="ROMPAGE로고" ><span class="sr-only">롬페이지</span></a></h1>		
		<nav class="gnb">			
			<ul class="nav pc">
				<li class="nav-list">
					<a href="/resume" class="title"><h2>이력서</h2></a>
					<div class="nav-2depth-wrap">
						<ul class="nav-2depth">
							<li class="nav-2depth-list"><a href="/resume" class="nav-first">이력서</a></li>
							<li class="nav-2depth-list"><a href="/resume/selfIntroduction" class="nav-last">자기소개서</a></li>
						</ul>
					</div>				
				</li>
				<li class="nav-list">
					<a href="/portfolio" class="title"><h2>포트폴리오</h2></a>
					<div class="nav-2depth-wrap">
						<ul class="nav-2depth">
							<li class="nav-2depth-list"><a href="/portfolio" class="nav-first">포트폴리오</a></li>
							<li class="nav-2depth-list"><a href="/career" class="nav-last">경력기술서</a></li>
						</ul>
					</div>
				</li>
				<li class="nav-list">
					<a href="/admin" class="title"><h2>관리자</h2></a>
					<div class="nav-2depth-wrap">
						<ul class="nav-2depth">
							<li class="nav-2depth-list"><a href="/admin/resumeUpdate" class="nav-first">이력서 관리</a></li>
							<li class="nav-2depth-list"><a href="/admin/selfIntroUpdate">자기소개서 관리</a></li>
							<li class="nav-2depth-list"><a href="/admin/portfolioSelect">포트폴리오 관리</a></li>
							<li class="nav-2depth-list"><a href="/rompage/prototype/main.jsp" class="nav-last" class="nav-last">프로토타입</a></li>
						</ul>
					</div>
				</li>
			</ul>
			<div class="right-menu">
				<div class="version">
					<button type="button" aria-expanded="false">VERSION</button>
					<ul>
						<li><a href="/index_v1.jsp">V1.0</a></li>
						<li><a href="/">V2.0</a></li>
					</ul>
				</div>
				<button type="button" class="menu-hamburger" id="hamburger" aria-expanded="false" aria-controls="allMenu">
					<span></span>
					<span></span>
					<span></span>
					<span class="sr-only">전체 메뉴</span>
				</button>	
			</div>
			
			<div class="header-on" id="allMenu" role="region" aria-labelledby="hamburger">
				<h1 class="logo"><a href="/"><img src="/v2/image/common/rompage_logo.png" alt="ROMPAGE로고" ><span class="sr-only">롬페이지</span></a></h1>		
				<nav class="gnb">
					<ul class="nav">
						<li>
							<h2>RESUME</h2>
							<button type="button" class="nav-2depth-btn" id="mNav1depth01" aria-expanded="false" aria-controls="mNav2depth01"><h2>RESUME</h2></button>
							<div class="nav-2depth-on" id="mNav2depth01" role="region" aria-labelledby="mNav1depth01">
								<ul>
									<li><a href="/resume">이력서</a></li>
									<li><a href="/resume/selfIntroduction">자기소개서</a></li>
								</ul>
							</div>				
						</li>
						<li>
							<h2>PORTFOLIO</h2>
							<button type="button" class="nav-2depth-btn" id="mNav1depth02" aria-expanded="false" aria-controls="mNav2depth02"><h2>PORTFOLIO</h2></button>
							<div class="nav-2depth-on" id="mNav2depth02" role="region" aria-labelledby="mNav1depth02">
								<ul>
									<li><a href="/portfolio">포트폴리오</a></li>
									<li><a href="/career">경력기술서</a></li>
								</ul>
							</div>
						</li>
						<li>
							<h2>ADMIN</h2>
							<button type="button" class="nav-2depth-btn" id="mNav1depth03" aria-expanded="false" aria-controls="mNav2depth03"><h2>ADMIN</h2></button>
							<div class="nav-2depth-on" id="mNav2depth03" role="region" aria-labelledby="mNav1depth03">
								<ul>
									<li><a href="/admin/resumeUpdate">이력서 관리</a></li>
									<li><a href="/admin/selfIntroUpdate">자기소개서 관리</a></li>
									<li><a href="/admin/portfolioSelect">포트폴리오 관리</a></li>
									<li><a href="/rompage/prototype/main.jsp" class="nav-last">프로토타입</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
			<div class="bg-drop"></div>
		</nav>
	</header> -->
	<!-- //header -->
	
	<!-- container -->
	<main id="content">
		<sitemesh:write property="body"/>		
	</main>
	<!-- //container -->

	<div class="scroll-wrap">
		<div class="top-btn"><button type="button" aria-label="제일 위로 이동">TOP</button></div>
	</div>
	
	<!-- footer -->	
	<footer id="footer">		
		<p class="copyright"><img data-src="/common/img/common/logo_footer.png" class="lazyload ico-copyright">Copyright © 2016 ROMPAGE All rights reserved.</p>
	</footer>	
	<!-- //footer -->
</div>	
<!-- //wrap -->
<script type="module" src="/v2/js/common/utils.js"></script>	
<script type="text/javascript" src="/v2/js/dist/navigation.js"></script>
</body>
</html>