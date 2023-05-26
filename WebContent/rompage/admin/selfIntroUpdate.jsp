<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자기소개서 관리</title>
<link href="/v1/css/resume.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div class="tac mb20">
		<span class="bullet_pot">관리자 권한이 주어져야 입력,수정,삭제가 가능합니다.</span>
	</div>
	<form id="insertForm" name="insertForm" method="post">
		<h2><label for="TITLE">제목</label></h2>
		<div class="section"><input class="w100p" id="TITLE" name="TITLE" type="text"  value=""></div>
		
		<h2><label for="INTRO">이력서</label></h2>
		<div class="section"><textarea class="w100p" id="INTRO" name="INTRO" rows="20"></textarea></div>
		
		<h2><label for="GROW">성장과정</label></h2>
		<div class="section"><textarea class="w100p" id="GROW" name="GROW" rows="10"></textarea></div>
		
		<h2><label for="CHARACTER_YN">성격의 장단점</label></h2>
		<div class="section"><textarea class="w100p" id="CHARACTER_YN" name="CHARACTER_YN" rows="10"></textarea></div>
		
		<h2><label for="APPL_REASON">지원동기</label></h2>
		<div class="section"><textarea class="w100p" id="APPL_REASON" name="APPL_REASON" rows="10"></textarea></div>
		
		<h2><label for="HOPE">입사 후 포부</label></h2>
		<div class="section"><textarea class="w100p" id="HOPE" name="HOPE" rows="10"></textarea></div>
		
		<h2><label for="SPECIAL">특기사항</label></h2>
		<div class="section"><textarea class="w100p" id="SPECIAL" name="SPECIAL" rows="10"></textarea></div>
	
		<div class="tac mt50 mb80">
			<button id="insertBtn" type="button" class="btn btn_lg btn_pot">등록</button>
		</div>
	</form>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('ADMIN | 자기소개서 관리');	
	//관리자 : U_AUTH가 90인 사용자만 관리가능
	if('${sessionScope.user.U_AUTH }' != '90'){
		$('.content button').attr('disabled', true);
	}
	
	$('#TITLE').val('${intro.TITLE }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#INTRO').append('${intro.INTRO }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#GROW').append('${intro.GROW }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#CHARACTER_YN').append('${intro.CHARACTER_YN }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#APPL_REASON').append('${intro.APPL_REASON }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#HOPE').append('${intro.HOPE }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	$('#SPECIAL').append('${intro.SPECIAL }'.replace(/<br>/g, "\r\n").replace(/&nbsp;/g, "\u0020"));
	
	
	var insertBtn = $('#insertBtn'); //등록버튼
	var title = $('input[name=TITLE]'); //제목
	var INTRO = $('textarea[name=INTRO]'); //이력서
	var insertForm = $('#insertForm');
	/*************** 등록버튼 클릭시 ********************/
	insertBtn.on('click', function(){
		if(!vaildation()){ //validation체크
			return false;
		}
		insert();		
	});	
	function insert() {
		$.ajax({
			url: "/admin/selfIntroUpdateAction.cmd",
			data : insertForm.serialize(),
			type : 'POST',
			success: function(result){
				console.log(result)
				if(result == 'true'){
					alert('등록이 완료되었습니다.');					
				}else{
					alert('등록 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	//validation체크
	function vaildation(){
		if(rom.util.isNull(title.val())){ //제목
			alert("제목을 입력해 주세요.");
			title.focus();
			return false;		
		}
		if(rom.util.isNull(INTRO.val())){ //이력서
			alert("이력서 내용을 입력해 주세요.");
			INTRO.focus();
			return false;		
		}
		
		return true;
	}
	/*************** 등록버튼 클릭시 ********************/
})();
</script>
</body>
</html>
