<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ROMPAGE : 메인</title>
<!-- <link rel="preload" href="/v2/image/main/main_01.jpg" as="image" fetchpriority="high" /> -->
<link href="/v2/css/main.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="section full">
	<div class="component NT0001">	
		<span class="c-rolling__txt active">ROMPAGE에 오신 것을 환영합니다 :)</span>
		<span class="c-rolling__txt">DEVELOPER</span>
		<span class="c-rolling__txt">안녕하세요 ROMPAGE에 오신 것을 환영합니다 :)</span>
	</div>
</div>
<!-- 
setInterval(()=>{
   if(document.querySelector('.NT0001 .c-rolling__txt.active').nextElementSibling === null){
       document.querySelector('.NT0001 .c-rolling__txt.active').classList.remove('active');
        document.querySelector('.NT0001 .c-rolling__txt').classList.add('active');
   } else {
       document.querySelector('.NT0001 .c-rolling__txt.active').nextElementSibling.classList.add('active');
        document.querySelector('.NT0001 .c-rolling__txt.active').classList.remove('active');
   }
},4000);
 -->
<div class="section full">
	<div class="component BN0001">
		<div class="c-floating-contents">
			<div class="c-floating-contents__floor">			
				<video class="c-media__video js-video desktop-only" loop muted autoplay>
					<source src="https://www.lg.com/content/dam/channel/wcms/uk/membership/home-hero-membership-desktop-uk.mp4" type="video/mp4">
				</video>
			</div>
			<div class="c-floating-contents__floating">
	    		<p>안녕하세요<i class="smile"></i></p>
	    		<p>
	    			저는
	    			<span>DEVELOPER</span>
	    			<span>PUBLISHER</span>
	    			<span>ARTIST</span>
	    			조새롬입니다.
	    		</p>
	    	</div>
    	</div>
	</div>
</div>
<div class="section full">
	<div class="component BN0002">
	
	</div>
</div>
<div class="section">
	<div class="component LS0002">
	
	</div>
</div>
<div class="section">
	<div class="component TX0002">
	
	</div>
</div>
<div class="section">
	<div class="component LS0002">
	
	</div>
</div>
<div class="section">
	<div class="component TX0002">
	
	</div>
</div>

</body>
</html>