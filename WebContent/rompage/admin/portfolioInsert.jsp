<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 등록</title>
<link href="/v1/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div class="tac mb20">
		<span class="bullet_pot">관리자 권한이 주어져야 입력,수정,삭제가 가능합니다.</span>
	</div>
	<form id="insertForm" name="insertForm" method="post" enctype="multipart/form-data">
		<h2><label for="THUMBNAIL_IMG">썸네일 이미지</label></h2>
		<div class="section">
			<div class="thumb_img"><img class="thumb_img_review" src="" alt="썸네일 이미지"></div>			
			<input id="THUMBNAIL_IMG" name="THUMBNAIL_IMG" type="file" onchange="rom.util.readURL(this, 'thumb_img_review');" >
		</div>
		
		<div class="section_5n5">
			<div>
				<h2><label for="THUMBNAIL_MEMO">썸네일 설명</label></h2>
				<div class="section"><input class="w80p" id="THUMBNAIL_MEMO" name="THUMBNAIL_MEMO" type="text" maxlength="24"></div>
			</div>
			<div>
				<h2><label for="ORDER_ORG">발주처</label></h2>
				<div class="section"><input class="w80p" id="ORDER_ORG" name="ORDER_ORG" type="text" maxlength="24"></div>			
			</div>
		</div>
		
		
		<h2><label for="SDATE">기간</label></h2>
		<div class="section">
			<input id="SDATE" name="SDATE" type="text" maxlength="8" title="시작일">
			~ <input id="EDATE" name="EDATE" type="text" maxlength="8" title="종료일">
			<span class="bullet_pot">ex) 20160901</span>
		</div>
		
		<h2><label for="CONTENT">내용</label></h2>
		<div class="section"><textarea class="w100p" rows="10" id="CONTENT" name="CONTENT"></textarea></div>
		
		<h2>노출여부</h2>
		<div class="section">
			<input id="VIEW_Y" name="VIEW_YN" type="radio" value="Y" checked> <label for="VIEW_Y">예</label>
			<input id="VIEW_N" name="VIEW_YN" type="radio" value="N"> <label for="VIEW_N"> 아니오</label>
		</div>
		<div class="tac mt50 mb80">
			<button id="insertBtn" type="button" class="btn btn_lg btn_pot">등록</button>	
			<a type="button" class="btn btn_lg" href="/admin/portfolioSelect.cmd">취소</a>
		</div>	
	</form>
	
	<h2>상세설명</h2>	
	<div class="section">
		<button id="addBtn" type="button" class="btn btn_pot">추가</button>
		<span class="bullet_pot">등록버튼 누른 순서대로 등록됩니다.</span>
		<form class="sub_section" id="detailInsertForm1" name="detailInsertForm1" method="post" enctype="multipart/form-data">		
			<div class="mt20">
				<div class="section_5n5">
					<div>
						<label for="IMG1"><span class="bullet">이미지</span></label> <br>
						<div class="sub_img"><img class="sub_img_review" src="/v1/img/error/no_image.JPG" alt="세부 이미지"></div>
						<input class="mb30" id="IMG1" name="IMG1" type="file" onchange="rom.util.readURL(this,'sub_img_review');">					
					</div>
					<div>
						<label for="MEMO1"><span class="bullet">설명</span></label> <br>
						<textarea class="w100p" rows="15" id="MEMO1" name="MEMO1"></textarea> <br>						
					</div>
				</div>
				<div class="btnWarp tar">
					<button type="button" class="btn btn_pot detailInsertBtn">등록</button>
					<button type="button" class="btn delBtn none">삭제</button>
				</div>
				<div class="clear"></div>	
			</div>
			<input type="hidden" name="rNum" value="MEMO1">
			<input type="hidden" name="pNum" value="0">
		</form>
	</div>
	
	<div class="tac mt50 mb80">
		<a type="button" class="btn btn_lg" href="/admin/portfolioSelect.cmd">목록</a>
	</div>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('ADMIN | 포트폴리오 등록');	
	//관리자 : U_AUTH가 90인 사용자만 관리가능
	if('${sessionScope.user.U_AUTH }' != '90'){
		$('.content button').attr('disabled', true);
	}
	
	var insertForm = $('#insertForm');
	var pNum = 0;
	
	/* var pNum = 28;
	$('.content').find('input[name=pNum]').val(pNum); */ 
	
	/* 필수입력값 */
	var THUMBNAIL_IMG = $('input[name=THUMBNAIL_IMG]'); //썸네일 이미지
	var THUMBNAIL_MEMO = $('input[name=THUMBNAIL_MEMO]'); //썸네일 설명
	var SDATE = $('input[name=SDATE]'); //시작일
	var EDATE = $('input[name=EDATE]'); //종료일
	var CONTENT = $('textarea[name=CONTENT]'); //내용
	var VIEW_YN = $('input[name=VIEW_YN]'); //노출여부
	
	var insertBtn = $('#insertBtn'); //등록버튼
	
	/* 상세설명 */
	var addBtn = $('#addBtn'); //추가버튼	
	var sub_section = $('.sub_section'); //상세설명
	var sub_section_html = sub_section.clone().wrapAll('<div/>').parent().html(); //상세설명 html
	var cnt = 1;
	
	/*************** 등록버튼 클릭시 ********************/
	insertBtn.on('click', function(){
		if(!vaildation()){ //validation체크
			return false;
		}
		insert();
	});	
	function insert() {
		insertForm.ajaxForm({
			url: "/admin/portInsertAction.cmd",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){
				var data = $.parseJSON(result);
				if(data.result == 'true'){
					alert('등록이 완료되었습니다.');
					pNum = data.pNum;
					$('input[name=pNum]').val(data.pNum);
				}else{
					alert('등록 중 오류가 발행하였습니다.');
				}
			}
		});
		insertForm.submit();
	}
	//validation체크
	function vaildation(){		
		if(rom.util.isNull(THUMBNAIL_IMG.val())){ //썸네일 이미지
			alert("썸네일 이미지를 입력해 주세요.");
			THUMBNAIL_IMG.focus();
			return false;		
		}
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
	/*************** 등록버튼 클릭시 end ********************/
	
	//상세등록 버튼 클릭시
	$('.content').on('click', '.detailInsertBtn', function(){
		if($('input[name=pNum]').val() == '0'){
			alert('포트폴리오 정보를 먼저 입력해 주세요');
			insertBtn.focus();
			return false;
		}
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
				if(result == 'true'){
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
			form.find('textarea[name*=MEMO]').focu();
			return false;		
		}
		return true;
	}
	
	
	//상세설명 추가버튼 클릭시
	addBtn.on('click', function(){
		cnt++;
		var re_memo = 'MEMO' + cnt;
		var re_img = 'IMG' + cnt;
		var re_detailInsertForm = 'detailInsertForm' + cnt;
		var html = sub_section_html.replace(/MEMO1/g, re_memo)
			.replace(/IMG1/g, re_img)
			.replace(/detailInsertForm1/g, re_detailInsertForm)
			.replace('none', '');		
		if(pNum == 0){
			alert('포트폴리오 정보를 먼저 입력해 주세요');
			insertBtn.focus();
			return false;
		}
		$('.sub_section').last().after(html); //상세설명 추가
		$('.content').find('input[name=pNum]').val(pNum);
	});
	
	//상세설명 삭제버튼 클릭시
	$('.content').on('click', '.delBtn', function(){
		$(this).parent().parent().parent().remove();
	});	
})();

</script>
</body>
</html>
