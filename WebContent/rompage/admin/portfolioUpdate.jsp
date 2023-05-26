<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 수정</title>
<link href="/v1/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div class="tac mb20">
		<span class="bullet_pot">관리자 권한이 주어져야 입력,수정,삭제가 가능합니다.</span>
	</div>
	<form id="insertForm" name="insertForm" method="post">
		<h2><label for="THUMBNAIL_IMG">썸네일 이미지</label></h2>
		<div class="section">
			<div class="thumb_img"><img class="thumb_img_review" src="/v1/img/portfolio/${info.THUMBNAIL_IMG }" alt="썸네일 이미지"></div>			
			<input id="THUMBNAIL_IMG" name="THUMBNAIL_IMG" type="file" onchange="rom.util.readURL(this, 'thumb_img_review');" >
		</div>
		
		<div class="section_5n5">
			<div>
				<h2><label for="THUMBNAIL_MEMO">썸네일 설명</label></h2>
				<div class="section"><input class="w80p" id="THUMBNAIL_MEMO" name="THUMBNAIL_MEMO" type="text" maxlength="24" value="${info.THUMBNAIL_MEMO }"></div>
			</div>
			<div>
				<h2><label for="ORDER_ORG">발주처</label></h2>
				<div class="section"><input class="w80p" id="ORDER_ORG" name="ORDER_ORG" type="text" maxlength="24" value="${info.ORDER_ORG }"></div>			
			</div>
		</div>
		
		
		<h2><label for="SDATE">기간</label></h2>
		<div class="section">
			<input id="SDATE" name="SDATE" type="text" maxlength="8" title="시작일" value="${info.SDATE }">
			~ <input id="EDATE" name="EDATE" type="text" maxlength="8" title="종료일" value="${info.EDATE }">
			<span class="bullet_pot">ex) 20160901</span>
		</div>
		
		<h2><label for="CONTENT">내용</label></h2>
		<div class="section"><textarea class="w100p" rows="10" id="CONTENT" name="CONTENT"></textarea></div>
		
		<h2>노출여부</h2>
		<div class="section">
			<input id="VIEW_Y" name="VIEW_YN" type="radio" value="Y" <c:if test="${info.VIEW_YN == 'Y' }">checked</c:if> > <label for="VIEW_Y">예</label>
			<input id="VIEW_N" name="VIEW_YN" type="radio" value="N" <c:if test="${info.VIEW_YN == 'N' }">checked</c:if> > <label for="VIEW_N"> 아니오</label>
		</div>
		<div class="tac mt50 mb80">
			<button id="insertBtn" type="button" class="btn btn_lg btn_pot">수정</button>	
			<a type="button" class="btn btn_lg" href="/admin/portfolioSelect.cmd">취소</a>
		</div>
		<input type="hidden" name="R_NUM" value="${info.RNUM }">
		<script type="text/javascript">
			var contents = '${info.CONTENT }';
			contents = contents.replace(/<br>/g, '\r\n');
			contents = contents.replace(/&nbsp;/g, '\u0020');
			$('#CONTENT').val(contents);
		</script>
	</form>
	
	<h2>상세설명</h2>	
	<div class="section">
		<button id="addBtn" type="button" class="btn btn_pot">추가</button>
		<span class="bullet_pot">등록버튼 누른 순서대로 등록됩니다.</span>
		<div class="sub_section_wrap">
		<c:forEach var="item" items="${detail }" varStatus="status">
			<form class="sub_section" id="detailUpdateForm${status.index+1 }" name="detailUpdateForm${status.index+1 }" method="post">		
				<div class="mt20">
					<div class="section_5n5">
						<div>
							<label for="IMG${status.index+1 }"><span class="bullet">이미지</span></label> <br>
							<div class="sub_img"><img class="sub_img_review" src="/v1/img/portfolio/${item.IMG }" alt="세부 이미지"></div>
							<input class="mb30" id="IMG${status.index+1 }" name="IMG${status.index+1 }" type="file" onchange="rom.util.readURL(this,'sub_img_review');">
							<input type="hidden" name="imgNm" value="${item.IMG }">	
						</div>
						<div>
							<label for="MEMO${status.index+1 }"><span class="bullet">설명</span></label> <br>
							<textarea  class="w100p" rows="15" id="MEMO${status.index+1 }" name="MEMO${status.index+1 }"></textarea> <br>						
						</div>
					</div>
					<div class="btnWarp tar">
						<button type="button" class="btn btn_pot detailUpdateBtn">수정</button>
						<button type="button" class="btn detailDeleteBtn">삭제</button>
					</div>
					<div class="clear"></div>
				</div>
				<input type="hidden" name="pNum" value="${item.PNUM }">
				<input type="hidden" name="subrNum" value="${item.RNUM }">
				<input type="hidden" name="memoNum" value="MEMO${status.index+1 }">
				<input type="hidden" name="imgNum" value="IMG${status.index+1 }">
			</form>
						
			<script type="text/javascript">
				var contents = '${item.MEMO }';
				contents = contents.replace(/<br>/g, '\r\n');
				contents = contents.replace(/&nbsp;/g, '\u0020');
				$('#MEMO${status.index+1 }').val(contents);
			</script>
		</c:forEach>
		</div>		
	</div>
	
	<div class="tac mt50 mb80">
		<a type="button" class="btn btn_lg" href="/admin/portfolioSelect.cmd">목록</a>
	</div>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('ADMIN | 포트폴리오 수정');
	//관리자 : U_AUTH가 90인 사용자만 관리가능
	if('${sessionScope.user.U_AUTH }' != '90'){
		$('.content button').attr('disabled', true);
	}
	var insertForm = $('#insertForm');
	
	/* 필수입력값 */
	var THUMBNAIL_IMG = $('input[name=THUMBNAIL_IMG]'); //썸네일 이미지
	var THUMBNAIL_MEMO = $('input[name=THUMBNAIL_MEMO]'); //썸네일 설명
	var SDATE = $('input[name=SDATE]'); //시작일
	var EDATE = $('input[name=EDATE]'); //종료일
	var CONTENT = $('textarea[name=CONTENT]'); //내용
	var VIEW_YN = $('input[name=VIEW_YN]'); //노출여부
	
	var insertBtn = $('#insertBtn'); //메인수정버튼
		
	/* 상세설명 */
	var addBtn = $('#addBtn'); //추가버튼
	var cnt = 0;
	
	/*************** 메인수정버튼 클릭시 ********************/
	insertBtn.on('click', function(){
		if(!vaildation()){ //validation체크
			return false;
		}
		
		if(rom.util.isNull(THUMBNAIL_IMG.val())){ //썸네일 이미지
			insert();
		}else{
			insertMulti();
		}
		
	});	
	function insert() {
		$.ajax({
			url: "/admin/portUpdateAction.cmd",
			data : insertForm.serialize(),
			success: function(result){
				var data = $.parseJSON(result);				
				if(data.result =='true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	function insertMulti() {
		insertForm.ajaxForm({
			url: "/admin/portUpdateMultiAction.cmd",
			enctype: "multipart/form-data",
			success: function(result){
				var data = $.parseJSON(result);
				if(data.result == 'ture'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
		insertForm.submit();
	}
	//validation체크
	function vaildation(){
		if(rom.util.isNull(THUMBNAIL_MEMO.val())){ //썸네일 설명
			alert("썸네일 설명을 입력해 주세요.");
			THUMBNAIL_MEMO.focus();
			return false;		
		}
		if(rom.util.isNull(SDATE.val())){ //시작일
			alert("시작일을 입력해 주세요.");
			SDATE.focus();
			return false;		
		}
		if(!rom.util.isValidDate(SDATE.val())){
			alert("시작일을 YYYYmmdd으로 입력해 주세요.");
			SDATE.focus();
			return false;
		}
		if(rom.util.isNull(EDATE.val())){ //종료일
			alert("종료일을 입력해 주세요.");
			EDATE.focus();
			return false;		
		}
		if(!rom.util.isValidDate(EDATE.val())){
			alert("종료일을 YYYYmmdd으로 입력해 주세요.");
			EDATE.focus();
			return false;
		}
		if(rom.util.isNull(CONTENT.val())){ //내용
			alert("내용을 입력해 주세요.");
			CONTENT.focus();
			return false;		
		}
		if(rom.util.isNull(VIEW_YN.val())){ //노출여부
			alert("노출여부를 선택해 주세요.");
			VIEW_YN.eq(0).focus();
			return false;		
		}
		return true;
	}
	/*************** 메인수정 버튼 클릭시 end ********************/
	
	/*************** 상세설명 수정버튼 클릭시 ********************/
	$('.content').on('click', '.detailUpdateBtn', function(){
		var id = $(this).parent().parent().parent().attr('id');
		var form = $('#'+id);
		if(rom.util.isNull(form.find('input[name*=IMG]').val())){ //이미지
			detailUpdate(id);
		}else{
			detailUpdateMulti(id);
		}
	});
	function detailUpdate(id) {
		$.ajax({
			url: "/admin/detailUpdateAction.cmd",
			data : $('#'+id).serialize(),
			success: function(result){
				if(result == 'true'){
					alert('수정이 완료되었습니다.');
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	function detailUpdateMulti(id){
		$('#'+id).ajaxForm({
			url: "/admin/detailUpdateMultiAction.cmd",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){
				if(result == 'true'){
					alert('수정이 완료되었습니다.');
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
		$('#'+id).submit();
	}
	/*************** 상세설명 수정버튼 클릭시 end ********************/
	
	/*************** 상세설명 삭제버튼 클릭시 ********************/
	$('.content').on('click', '.detailDeleteBtn', function(){
		var id = $(this).parent().parent().parent().attr('id');		
		if(confirm('정말 삭제하시겠습니까?')){
			detailDelete(id);
		}		
	});
	function detailDelete(id) {
		$.ajax({
			url: "/admin/detailDeleteAction.cmd",
			data : $('#'+id).serialize(),
			success: function(result){
				if(result == 'true'){
					alert('삭제가 완료되었습니다.');
				}else{
					alert('삭제 중 오류가 발행하였습니다.');
				}
			}
		});
		$('#'+id).submit();
	}
	/*************** 상세설명 삭제버튼 클릭시 end ********************/
	
	/*************** 상세설명 추가버튼 클릭시 ********************/
	addBtn.on('click', function(){
		cnt++;
		var rNum = $('input[name=R_NUM]').val();
		var html =  '<form class="sub_section" id="detailInsertForm'+cnt+'" name="detailInsertForm'+cnt+'" method="post" enctype="multipart/form-data">'		
			+'	<div class="mt20">'
			+'		<div class="section_5n5">'
			+'			<div>'
			+'				<label for="INIMG'+cnt+'"><span class="bullet">이미지</span></label> <br>'
			+'				<div class="sub_img"><img class="sub_img_review" src="/v1/img/error/no_image.JPG" alt="세부 이미지"></div>'
			+'				<input class="mb30" id="INIMG'+cnt+'" name="INIMG'+cnt+'" type="file" onchange="rom.util.readURL(this,\'sub_img_review\');">'					
			+'			</div>'
			+'			<div>'
			+'				<label for="INMEMO'+cnt+'"><span class="bullet">설명</span></label> <br>'
			+'				<textarea class="w100p" rows="15" id="INMEMO'+cnt+'" name="INMEMO'+cnt+'"></textarea> <br>'						
			+'			</div>'
			+'		</div>'
			+'		<div class="btnWarp tar">'
			+'			<button type="button" class="btn btn_pot detailInsertBtn">등록</button>'
			+'			<button type="button" class="btn delBtn">삭제</button>'
			+'		</div>'
			+'		<div class="clear"></div>'	
			+'	</div>'
			+'	<input type="hidden" name="rNum" value="INMEMO'+cnt+'">'
			+'	<input type="hidden" name="pNum" value="'+rNum+'">'
			+'</form>';
			
		if(rom.util.isNull($('.sub_section').attr('id'))){
			$('.sub_section_wrap').after(html); //상세설명 추가
		}else{
			$('.sub_section').last().after(html); //상세설명 추가
		}
		
	});
	/*************** 상세설명 추가버튼 클릭시 end ********************/
	
	/*************** 상세등록 버튼 클릭시 ********************/
	//상세등록 버튼 클릭시
	$('.content').on('click', '.detailInsertBtn', function(){
		var id = $(this).parent().parent().parent().attr('id');
		if(!detailVaildation(id)){
			return false;
		}
		detailInsert(id);
	});	
	function detailInsert(id){
		$('#'+id).ajaxForm({
			url: "/admin/detailInsertAction.cmd",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){
				if(result){
					alert('등록이 완료되었습니다.');
					$('#'+id).find('.btnWarp').addClass('none');
				}else{
					alert('등록 중 오류가 발행하였습니다.');
				}
			}
		});
		$('#'+id).submit();
	}
	// 상세설명 validation체크
	function detailVaildation(id){
		var form = $('#'+id);
		if(rom.util.isNull(form.find('input[name*=IMG]').val())){ //이미지
			alert("이미지를 등록해 주세요.");
			form.find('input[name*=IMG]').focus();
			return false;		
		}
		if(rom.util.isNull(form.find('textarea[name*=MEMO]').val())){ //설명글
			alert("설명을 입력해 주세요.");
			form.find('textarea[name*=MEMO]').focus();
			return false;		
		}
		return true;
	}
	/*************** 상세등록 버튼 클릭시 end ********************/
	
	/*************** 상세설명 삭제버튼 클릭시 ********************/
	$('.content').on('click', '.delBtn', function(){
		$(this).parent().parent().parent().remove();
	});
	/*************** 상세설명 삭제버튼 클릭시 end ********************/
	
	
	
	
	
	
	
	
	
	
})();

</script>
</body>
</html>
