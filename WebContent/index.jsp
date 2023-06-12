<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<link rel="preload" href="/v2/image/main/main_01.jpg" as="image" fetchpriority="high" />
<link href="/v2/css/jquery.fullpage.css" rel="stylesheet" type="text/css" />
<link href="/v2/css/main.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main-wrap">
	<div id="fullpage">
	    <section class="section section01">
	    	<div class="bg">
	    		<picture>
	    			<source media="(min-width:768px)" srcset="/v2/image/main/main_01.jpg">			
	    			<source media="(max-width:767px)" srcset="/v2/image/main/m_main_01.jpg">
			    	<img alt="롬페이지 메인화면 배경" src="/v2/image/main/main_01.jpg" aria-hidden="true">
	    		</picture>
	    	</div>
	    	<div class="section01-wrap">
		    	<div class="keen-slider-wrap">
		    		<ul class="keen-slider" id="keen-slider-1550478309794">
		    			<li class="carousel-box keen-slider__slide">
		    				<div class="text-wrap">
					    		<h2>안녕하세요. 저는 개발자 조새롬입니다 :)</h2>
					    		<p>오늘보다 내일 더 개발을 잘 할 예정입니다.</p>
					    	</div>
		    			</li>
		    			<li class="carousel-box keen-slider__slide">
		    				<div class="text-wrap">
		    					<div class="desc">
						    		JAVA MVC패턴으로 구현
									SCSS 를 gulp를 사용하여 css구현
									database를 이용한 데이터 관리
									jqeury, react, vanilajs, vuejs 를 이용한 프론트앤드 구성
									sitemesh3을 이용한 탬플릿
									WAI-ARIA 이용한 웹접근성 실현
									IE11, Chrome, Firfox, Edge, tablat, ios, android
									WAVE툴을 사용하여 웹접근성 검증 완료
								</div>
					    	</div>
		    			</li>
		    		</ul>
		    	</div>
			    <div class="keen-slider-dot-wrap dots"></div>
		    </div>
	    </section>
	    <section class="section section02">
	    	<div class="bg">
	    		<picture>
	    			<source media="(min-width:768px)" data-srcset="/v2/image/main/main_02.jpg">			
	    			<source media="(max-width:767px)" data-srcset="/v2/image/main/m_main_02.jpg">
		    		<img alt="롬페이지 메인 이력서 배경" data-src="/v2/image/main/main_02.jpg" aria-hidden="true">
	    		</picture>
	    	</div>
	    	<div class="text-wrap">
	    		<h2>이력서</h2>
	    		<p>바닐라js로 구현한 이력서 페이지 입니다.</p>
	    		<p>저의 정보, 이력, 학력 등.. 열심히 살아 온 저를 소개합니다.</p>
	    		<a href="/resume" aria-label="이력서 자세히 보기">LEARN MORE</a>
	    	</div>
	    </section>
	    <section class="section section03">
	    	<div class="bg">
	    		<picture>
	    			<source media="(min-width:768px)" data-srcset="/v2/image/main/main_03.jpg">			
	    			<source media="(max-width:767px)" data-srcset="/v2/image/main/m_main_03.jpg">
			    	<img alt="롬페이지 메인 포트폴리오 배경" data-src="/v2/image/main/main_03.jpg" class="lazyload" aria-hidden="true">
	    		</picture>
	    	</div>
	    	<div class="text-wrap">
		    		<h2>포트폴리오</h2>
		    		<p>react로 구현한 포트폴리오 페이지 입니다.</p>
		    		<p>제가 작업한 프로젝트들을 한 눈에 볼 수 있어요.</p>
		    		<a href="/portfolio" aria-label="포트폴리오 자세히 보기">LEARN MORE</a>
		    	</div>
	    </section>
	    <section class="section section04">
	    	<div class="bg">
		    	<picture>
	    			<source media="(min-width:768px)" data-srcset="/v2/image/main/main_04.jpg" >			
	    			<source media="(max-width:767px)" data-srcset="/v2/image/main/m_main_04.jpg">
			    	<img alt="롬페이지 메인 관리자 배경" data-src="/v2/image/main/main_04.jpg" aria-hidden="true">
	    		</picture>
		    </div>
		    <div class="text-wrap">
		    		<h2>관리자</h2>
		    		<p>vue js로 구현한 관리자 페이지 입니다.</p>
		    		<p>롬페이지의 데이터를 관리할 수 있는 마법같은 공간입니다.</p>
		    		<a href="/resume" aria-label="관리자 자세히 보기">LEARN MORE</a>
		    	</div>
	    </section>
	</div>
</div>

<div class="scroll-wrap">
	<div class="top-btn"><button type="button" aria-label="제일 위로 이동">TOP</button></div>
</div>
<script type="text/javascript" src="/v2/js/library/jquery.min.js"></script>
<script type="text/javascript" src="/v2/js/library/jquery.fullpage.js"></script>
<script type="text/javascript" src="/v2/js/library/keenslider.js"></script>
<script type="text/javascript" src="/v2/js/common/main.js"></script>

</body>
</html>