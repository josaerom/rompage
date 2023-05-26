<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오</title>
<link href="/v1/css/portfolio.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- content -->
<div class="content">
	<div>
		<div class="description">
        	<h1>${info.THUMBNAIL_MEMO }</h1>
        	<h3>${info.ORDER_ORG }</h3>
            <p class="desc_date">${info.SDATE } ~ ${info.EDATE }</p>
            <p class="desc_cont">${info.CONTENT }</p>
        </div>				
	</div>
	<c:forEach var="item" items="${detail }">
		<div class="ex">
			<img src="/v1/img/portfolio/${item.IMG }" alt="${item.MEMO }">
			<p><span class="bullet_pot">${item.MEMO }</span></p>
		</div>
	</c:forEach>
	
	<div class="list_btn">
		<a class="btn btn_lg btn_pot" href="/portfolio/portfolio.cmd">목록</a>
	</div>
</div>
<!-- content -->
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('PORTFOLIO | 포트폴리오');
	
	var thumb_area = $('a.thumb_area'); //썬내일 영역a태그
	
	thumb_area.on('mouseenter', function(){
		$(this).find('.thumb_memo').slideDown();
	}).on('mouseleave', function(){
		$(this).find('.thumb_memo').slideUp();
	});
	var i = 0;
	$(window).scroll(function(){
		if($(window).scrollTop() >= $('.description').offset().top - 500){
        	$('.description').addClass('on');
        }
        if($(window).scrollTop() >= $('.ex:eq('+i+')').offset().top - 500){
        	$('.ex:eq('+i+')').addClass('on');
        	if(i < $('.ex').length-1){        		
        		i++;
        	}
        }
	});
	
})();
</script>
</body>
</html>
