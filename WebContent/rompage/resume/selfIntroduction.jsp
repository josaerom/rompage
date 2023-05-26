<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자기소개서</title>
<link href="/v1/css/resume.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content self_wrap">
	<div class="table">
    	<div class="cell">
    		<div class="slide_wrap">
		        <ul id="slide_banner">
		        	<li><img src="/v1/img/intro/intro_03.jpg" alt="자기소개서 이미지"></li>
		        	<li><img src="/v1/img/intro/intro_04.jpg" alt="자기소개서 이미지"></li>
		            <li><img src="/v1/img/intro/intro_01.jpg" alt="자기소개서 이미지"></li>		            
		            <li><img src="/v1/img/intro/intro_02.jpg" alt="자기소개서 이미지"></li>		                     
		        </ul>				
		    </div>
	        <div class="container"></div>
	    </div>
	    <div class="cell self_txt">
	        <div class="intro_section on">
		    	<h2>${intro.TITLE }</h2>
				<p>${intro.INTRO }</p>
		    </div>
		    <c:if test="${intro.GROW ne '' }">
		    	<div class="intro_section">
				    <h3>성장과정</h3>
				    <img class="fl mr20" src="/v1/img/intro/intro_sub_02.jpg" alt="성장과정 이미지">
				    <p>	${intro.GROW }</p>
			    	<div class="clear"></div>
			    </div>
		    </c:if>
		    
		    <c:if test="${intro.CHARACTER_YN ne '' }">
			    <div class="intro_section">
			    	<h3 class="fr">성격의 장단점</h3>
			    	<div class="clear"></div>
			    	<img class="fr ml20" src="/v1/img/intro/intro_sub_03.jpg" alt="성격의 장단점 이미지">
			    	<p>${intro.CHARACTER_YN }</p>
			    	<div class="clear"></div>
			    </div>
		    </c:if>
		    
		    <c:if test="${intro.APPL_REASON ne '' }">
			    <div class="intro_section">
			    	<h3>지원동기</h3>
			    	<img class="fl mr20" src="/v1/img/intro/intro_sub_05.jpg" alt="지원동기 이미지">
			    	<p>${intro.APPL_REASON }</p>
			    	<div class="clear"></div>
			    </div>
		    </c:if>
		    
		    <c:if test="${intro.HOPE ne '' }">
			    <div class="intro_section">
			    	<h3 class="fr">입사 후 포부</h3>
			    	<div class="clear"></div>
			    	<img class="fr ml20" src="/v1/img/intro/intro_sub_01.jpg" alt="입사 후 포부 이미지">
			    	<p>${intro.HOPE }</p>
			    	<div class="clear"></div>
			    </div>
		    </c:if>
		    
		    <c:if test="${intro.SPECIAL ne '' }">
			    <div class="intro_section">
			    	<h3>특기사항</h3>
			    	<img class="fl mr20" src="/v1/img/intro/intro_sub_04.jpg" alt="특기사항 이미지">
			    	<p>${intro.SPECIAL }</p>
			    	<div class="clear"></div>
			    </div>
		    </c:if>
	    </div>
	    
	</div>
</div>
<script type="text/javascript">
(function(){	
	//title
	$('.spot h1').text('INTRODUCE | 자기소개서');
	//$('#slide_banner').bxSlider();
	var mySlider = $( '#slide_banner' ).bxSlider( {
        mode: 'fade',// 가로 방향 수평 슬라이드
        speed: 700,        // 이동 속도를 설정
        pager: false,      // 현재 위치 페이징 표시 여부 설정
        moveSlides: 1,     // 슬라이드 이동시 개수
        //slideWidth: 500,   // 슬라이드 너비
        //slideHeight: 200,
        minSlides: 1,      // 최소 노출 개수
        maxSlides: 1,      // 최대 노출 개수
        slideMargin: 0,    // 슬라이드간의 간격
        auto: true,        // 자동 실행 여부
        autoHover: true,   // 마우스 호버시 정지 여부
        controls: false    // 이전 다음 버튼 노출 여부
    } );

   //이전 버튼을 클릭하면 이전 슬라이드로 전환
    $( '#prevBtn' ).on( 'click', function () {
        mySlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
        return false;              //<a>에 링크 차단
    } );

   //다음 버튼을 클릭하면 다음 슬라이드로 전환
    $( '#nextBtn' ).on( 'click', function () {
        mySlider.goToNextSlide();  //다음 슬라이드 배너로 이동
        return false;
    } );
   
    var i = 1;
	$(window).scroll(function(){
		if($('.intro_section').length > 1){
			if($(window).scrollTop() >= $('.intro_section:eq('+i+')').offset().top - 500){
	        	$('.intro_section:eq('+i+')').addClass('on');
	        	if(i < $('.intro_section').length-1){        		
	        		i++;
	        	}
	        }
		}		
	});
})();
</script>
</body>
</html>
