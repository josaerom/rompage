<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 관리</title>
<link href="/v1/css/portfolio.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- content -->
<div class="content">
	<div class="tac mb20">
		<span class="bullet_pot">관리자 권한이 주어져야 입력,수정,삭제가 가능합니다.</span>
	</div>
	<div class="tac mb50">
		<a type="button" class="btn btn_lg btn_pot" href="/admin/portfolioInsert.cmd">등록</a>
	</div>
	
	<ul class="port_main">
		<c:forEach var="item" items="${main }" varStatus="status">
			<li>	
				<div class="admin_btn">					
					<input id="VIEW_Y${status.index }" name="VIEW_YN${status.index }" type="radio" value="Y" <c:if test="${item.VIEW_YN == 'Y' }">checked</c:if> > <label for="VIEW_Y${status.index }"> 보임</label>
					<input id="VIEW_N${status.index }" name="VIEW_YN${status.index }" type="radio" value="N" <c:if test="${item.VIEW_YN == 'N' }">checked</c:if> > <label for="VIEW_N${status.index }"> 숨김</label>
					<input type="hidden" name="rNum${status.index }" value="${item.RNUM }">
					<input type="hidden" name="imgNm${status.index }" value="${item.THUMBNAIL_IMG }">
					<button type="button" class="btn fr delBtn">삭제</button>
				</div>
				<div>			
					<a href="/admin/portfolioUpdate.cmd?rNum=${item.RNUM }" class="thumb_area">
						<img src="/v1/img/portfolio/${item.THUMBNAIL_IMG }" alt="${item.THUMBNAIL_MEMO }" >
						<h2 class="thumb_memo">${item.THUMBNAIL_MEMO }<br><span>${item.ORDER_ORG }</span></h2>
					</a>
				</div>				
			</li>			
		</c:forEach>
	</ul>
	<div class="clear"></div>
</div>
<!-- content -->
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('ADMIN | 포트폴리오 관리');	
	//관리자 : U_AUTH가 90인 사용자만 관리가능
	if('${sessionScope.user.U_AUTH }' != '90'){
		$('.content button').attr('disabled', true);
		$('input[type=radio]').attr('disabled', true);
	}
	var thumb_area = $('a.thumb_area'); //썬내일 영역a태그
	
	thumb_area.on('mouseenter', function(){
		$(this).find('.thumb_memo').slideDown();
		//$(this).find('.thumb_img').effect( 'scale', { percent: 120});
	}).on('mouseleave', function(){
		$(this).find('.thumb_memo').slideUp();
		//$(this).find('.thumb_img').effect( 'scale', { percent: 100});
	});
	
	$('input[type=radio]').on('change', function(){
		var input = new Object();
		input['VIEW_YN'] = $(this).val();
		input['rNum'] = $(this).parent().find('input[name*=rNum]').val();
		$.ajax({
			url: "/admin/portViewUpdateAction.cmd",
			data : input,
			success: function(result){
				
			}
		});
	});
	$('.delBtn').on('click', function(){
		var input = new Object();
		input['rNum'] = $(this).parent().find('input[name*=rNum]').val();
		input['imgNm'] = $(this).parent().find('input[name*=imgNm]').val();	
		if(confirm('정말 삭제하시겠습니까?')){
			$.ajax({
				url: "/admin/portfolioDeleteAction.cmd",
				data : input,
				success: function(result){
					console.log(result);
					if(result == 'true'){
						alert('삭제가 완료되었습니다.');
						location.reload();	
					}else{
						alert('삭제중 오류가 발생하였습니다.');
					}
					
				}
			});	
		}		
	});
	
})();
</script>
</body>
</html>
