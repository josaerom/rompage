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
	<ul class="port_main">
		<c:forEach var="item" items="${main }">
			<li>
				<a href="/portfolio/detail.cmd?rNum=${item.RNUM }" class="thumb_area">
					<img class="thumb_img" src="/v1/img/portfolio/${item.THUMBNAIL_IMG }" alt="${item.THUMBNAIL_MEMO }" >
					<h2 class="thumb_memo">${item.THUMBNAIL_MEMO }<br><span>${item.ORDER_ORG }</span></h2>					
				</a>
			</li>
		</c:forEach>
	</ul>
	<div class="clear"></div>
</div>
<!-- content -->
<script type="text/javascript">
(function(){	
	//title
	$('.spot h1').text('PORTFOLIO | 포트폴리오');
	var thumb_area = $('a.thumb_area'); //썬내일 영역a태그
	
	thumb_area.on('mouseenter', function(){
		$(this).find('.thumb_memo').slideDown();
		$(this).removeClass('off');
		$(this).addClass('on');
	}).on('mouseleave', function(){
		$(this).find('.thumb_memo').slideUp();
		$(this).removeClass('on');
		$(this).addClass('off');
	});
	
	
})();
</script>
</body>
</html>
