<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리</title>
<link rel="stylesheet" href="/v1/css/swiper.css">
<link rel="stylesheet" href="/v1/css/swiper_main.css">
</head>
<body>
<div class="content">		
	<header>
		<div class="header-swipers">
			<div class="swiper-container header-swiper-back-2">
				<div class="swiper-wrapper">
					<div class="swiper-slide"></div>
					<div class="swiper-slide"></div>
				</div>
			</div>
			<div class="swiper-container header-swiper-back-1">
				<div class="swiper-wrapper">
					<div class="swiper-slide"></div>
					<div class="swiper-slide"></div>
				</div>
			</div>
			<div class="swiper-container header-swiper-front">
				<div class="swiper-pagination swiper-pagination-white"></div>
				<div class="swiper-button-next swiper-button-white"></div>
				<div class="swiper-button-prev swiper-button-white"></div>
				<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="/v1/img/gallery/gallery_01.jpg" alt="갤러리 이미지1">
				</div>
				<div class="swiper-slide">
					<img src="/v1/img/gallery/gallery_02.jpg" alt="갤러리 이미지2">
				</div>
				<!-- <div class="swiper-slide swiper-slide-gallery">
					<div class="swiper-container swiper-gallery-top">
						<div class="slide-title demo-iframe-title">Build Complex Touch Galleries</div>
						<div class="swiper-wrapper">
							<div data-background="http://lorempixel.com/1200/600/nature/1" class="swiper-slide swiper-lazy">
								<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							</div>
							<div data-background="http://lorempixel.com/1200/600/nature/2" class="swiper-slide swiper-lazy">
								<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							</div>
							<div data-background="http://lorempixel.com/1200/600/nature/3" class="swiper-slide swiper-lazy">
								<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							</div>
							<div data-background="http://lorempixel.com/1200/600/nature/4" class="swiper-slide swiper-lazy">
								<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							</div>
							<div data-background="http://lorempixel.com/1200/600/nature/5" class="swiper-slide swiper-lazy">
								<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
							</div>
						</div>
					</div>
					<div class="swiper-container swiper-gallery-thumbs">
						<div class="swiper-wrapper">
							<div style="background-image:url(http://lorempixel.com/300/200/nature/1)" class="swiper-slide"></div>
							<div style="background-image:url(http://lorempixel.com/300/200/nature/2)" class="swiper-slide"></div>
							<div style="background-image:url(http://lorempixel.com/300/200/nature/3)" class="swiper-slide"></div>
							<div style="background-image:url(http://lorempixel.com/300/200/nature/4)" class="swiper-slide"></div>
							<div style="background-image:url(http://lorempixel.com/300/200/nature/5)" class="swiper-slide"></div>
						</div>
					</div>
				</div>
				<div class="swiper-slide last-centered-slide">
					test4
				</div>
				</div> -->
			</div>
		</div>
		</header>
</div>
<script src="/v1/js/swiper.js"></script>
<script src="/v1/js/main.js"></script>
<script type="text/javascript">
(function(){
	$('.spot h1').text('GALLERY | 갤러리');
	$('.font_size').hide();
})();
</script>
</body>
</html>
