<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서 관리</title>
<link href="/v1/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content resume_wrap">
	<div class="tac mb20">
		<span class="bullet_pot">관리자 권한이 주어져야 입력,수정,삭제가 가능합니다.</span>
	</div>
	<h2>기본정보</h2>
	<form id="infoForm" name="infoForm" method="post">
		<div class="section st_none">
			<table class="botn">
				<caption>기본정보 테이블</caption>
				<colgroup>
					<col style="width: 20%">
					<col style="width: 10%">
					<col style="width: 20%">
					<col style="width: 10%">
					<col style="width: 15%">
					<col style="width: 10%">
					<col style="width: 15%">
				</colgroup>
				<tbody>				
					<tr>
						<td rowspan="5" class="tb_first tac">
							<img class="photo" src="/v1/img/resume/${info.PHOTO }" alt="이력서 사진">
							<input class="w80" name="PHOTO" type="file" onchange="rom.util.readURL(this, 'photo');" title="이력서사진등록" >
						</td>
						<th scope="row" class="tb_first"><label for="KOR_NAME">이름</label></th>
						<td><input id="KOR_NAME" type="text" name="KOR_NAME" value="${info.KOR_NAME }"> </td>
						<th scope="row"><label for="ENG_NAME1">영문명</label></th>
						<td>
							<input id="ENG_NAME1" type="text" name="ENG_NAME1" value="${info.ENG_NAME1 }" >						 
						</td>
						<th scope="row"><label for="CHIN_NAME">한문</label></th>
						<td class="tb_last"><input id="CHIN_NAME" type="text" name="CHIN_NAME" value="${info.CHIN_NAME }"></td>
					</tr>
					<tr>
						<th scope="row"><label for="SSN">주민등록번호</label></th>
						<td colspan="5" class="tb_last"><input id="SSN" class="w140" type="text" name="SSN" value="${info.SSN }" maxlength="13"></td>						
					</tr>
					<tr>
						<th scope="row"><label for="ADDR">주소</label></th>
						<td colspan="5" class="tb_last"><input id="ADDR" type="text" name="ADDR" value="${info.ADDR }"></td>
					</tr>
					<tr>
						<th scope="row"><label for="TEL1"></label> 전화번호</th>
						<td colspan="5" class="tb_last">
							<input class="w50" id="TEL1" type="text" name="TEL1" value="${info.TEL1 }" maxlength="4"> - 
							<input class="w50" type="text" name="TEL2" value="${info.TEL2 }" maxlength="4" title="전화번호 가운데자리"> - 
							<input class="w50" type="text" name="TEL3" value="${info.TEL3 }" maxlength="4" title="전화번호 끝자리">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="EMAIL">이메일</label></th>
						<td colspan="5" class="tb_last"><input id="EMAIL" type="text" name="EMAIL" value="${info.EMAIL }"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tac mt-50 mb80">
			<button id="infoBtn" type="button" class="btn btn_pot">수정</button>
		</div>
	</form>
	
	<h2>이력</h2>
	<div class="section st_none">
		<form id="workForm" name="workForm" method="post">
			<table id="workTable" class="botn">
				<caption>사회생활 이력 테이블</caption>
				<colgroup>
					<col style="width: 11%">
					<col style="width: 11%">
					<col style="width: 8%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 30%">
					<col style="width: 10%">
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">시작일</th>
						<th scope="col">종료일</th>
						<th scope="col">개월</th>
						<th scope="col">근무처명</th>
						<th scope="col">소속팀</th>
						<th scope="col">담당업무</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${work[0].SDATE ne NULL }">
							<c:forEach var="item" items="${work }" varStatus="status">
								<tr>
									<td class="tb_first tac"><input type="text" name="SDATE" value="${item.SDATE }" maxlength="6" title="시작일"></td>
									<td><input type="text" name="EDATE" value="${item.EDATE }"  maxlength="6" title="종료일"></td>
									<td><input type="text" name="WORK_MON" value="${item.WORK_MON }" maxlength="4" title="개월"></td>
									<td><input type="text" name="WORK_NAME" value="${item.WORK_NAME }" title="근무처명"></td>
									<td><input type="text" name="WORK_TEAM" value="${item.WORK_TEAM }" title="소속팀"></td>
									<td><input type="text" name="PART" value="${item.PART }" title="담당업무"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>	
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first tac"><input type="text" name="SDATE" value="" maxlength="8" title="시작일"></td>
								<td><input type="text" name="EDATE" value=""  maxlength="8" title="종료일"></td>
								<td><input type="text" name="WORK_MON" value="" maxlength="4" title="개월"></td>
								<td><input type="text" name="WORK_NAME" value="" title="근무처명"></td>
								<td><input type="text" name="WORK_TEAM" value="" title="소속팀"></td>
								<td><input type="text" name="PART" value="" title="담당업무"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
					
				</tbody>
			</table>		
			<div class="tac mt-50 mb80">
				<button id="workAddBtn" type="button" class="btn">추가</button>
				<button id="workBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>	
	
	<h2>프로젝트 수행</h2>
	<div class="section st_none">
		<form id="projectForm" name="projectForm" method="post">
			<table id="projectTable" class="botn">
				<caption>프로젝트 수행 이력 테이블</caption>
				<colgroup>
					<col style="width: 11%">
					<col style="width: 11%">
					<col style="width: 10%">
					<col style="width: 15%">
					<col style="width: 28%">
					<col style="width: 15%">
					<col style="width: 10%">				
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">시작일</th>
						<th scope="col">종료일</th>
						<th scope="col">직책</th>
						<th scope="col">발주처</th>
						<th scope="col">수행업무</th>
						<th scope="col">소속</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>		
					<c:choose>
						<c:when test="${project[0].SDATE ne NULL }">		
							<c:forEach var="item" items="${project }" varStatus="status">
								<tr>
									<td class="tb_first tac"><input type="text" name="SDATE" value="${item.SDATE }" maxlength="8" title="시작일"></td>
									<td><input type="text" name="EDATE" value="${item.EDATE }" maxlength="8" title="종료일"></td>
									<td><input type="text" name="POSITION" value="${item.POSITION }" title="직책"></td>
									<td><input type="text" name="ORDER_ORG" value="${item.ORDER_ORG }" title="발주처"></td>
									<td><input type="text" name="DUTY" value="${item.DUTY }" title="수행업무"></td>
									<td><input type="text" name="WORK_NAME" value="${item.WORK_NAME }" title="소속"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>	
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first tac"><input type="text" name="SDATE" value="" maxlength="8" title="시작일"></td>
								<td><input type="text" name="EDATE" value="${item.EDATE }" maxlength="8" title="종료일"></td>
								<td><input type="text" name="POSITION" value="" title="직책"></td>
								<td><input type="text" name="ORDER_ORG" value="" title="발주처"></td>
								<td><input type="text" name="DUTY" value="" title="수행업무"></td>
								<td><input type="text" name="WORK_NAME" value="" title="소속"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="tac mt-50 mb80">
				<button id="projectAddBtn" type="button" class="btn">추가</button>
				<button id="projectBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>
	
	<h2>자격/면허</h2>
	<div class="section st_none">
		<form id="licenseForm" name="licenseForm" method="post">
			<table id="licenseTable" class="botn">
				<caption>자격/면허 정보 테이블</caption>
				<colgroup>
					<col style="width: 30%">
					<col style="width: 25%">
					<col style="width: 25%">
					<col style="width: 10%">
					<col style="width: 10%">				
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">자격/면허 명</th>
						<th scope="col">발급기관명</th>
						<th scope="col">취득일</th>
						<th scope="col">합격구분</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>		
					<c:choose>
						<c:when test="${license[0].NAME ne NULL }">		
							<c:forEach var="item" items="${license }" varStatus="status">
								<tr>
									<td class="tb_first"><input type="text" name="NAME" value="${item.NAME }" title="자격/면허 명"></td>
									<td><input type="text" name="ISSU_ORG" value="${item.ISSU_ORG }" title="발급기관명"></td>
									<td class="tac"><input type="text" name="GET_DATE" value="${item.GET_DATE }" maxlength="8" title="취득일"></td>						
									<td class="tb_last"><input type="text" name="RESULTS" value="${item.RESULTS }" title="합격구분"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>	
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first"><input type="text" name="NAME" value="" title="자격/면허 명"></td>
								<td><input type="text" name="ISSU_ORG" value="" title="발급기관명"></td>
								<td class="tac"><input type="text" name="GET_DATE" value="" maxlength="8" title="취득일"></td>						
								<td class="tb_last"><input type="text" name="RESULTS" value="" title="합격구분"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="tac mt-50 mb80">
				<button id="licenseAddBtn" type="button" class="btn">추가</button>
				<button id="licenseBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>
	
	<h2>보유기술 및 능력</h2>
	<div class="section st_none">
		<form id="skillForm" name="skillForm" method="post">
			<table id="skillTable" class="botn">
				<caption>보유기술 및 능력 테이블</caption>
				<colgroup>
					<col style="width: 25%">
					<col style="width: 15%">
					<col style="width: 50%">
					<col style="width: 10%">			
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">보유능력</th>
						<th scope="col">수준</th>
						<th scope="col">상세내용</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>		
					<c:choose>
						<c:when test="${skill[0].SKILL_NAME ne NULL }">		
							<c:forEach var="item" items="${skill }" varStatus="status">
								<tr>
									<td class="tb_first"><input type="text" name="SKILL_NAME" value="${item.SKILL_NAME }" title="보유능력"></td>
									<td class="tac"><input type="text" name="LEVEL" value="${item.LEVEL }" title="수준"></td>		
									<td class="tb_last"><input type="text" name="MEMO" value="${item.MEMO }" title="상세내용"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>	
							</c:forEach>							
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first"><input type="text" name="SKILL_NAME" value="" title="보유능력"></td>
								<td class="tac"><input type="text" name="LEVEL" value="" title="수준"></td>		
								<td class="tb_last"><input type="text" name="MEMO" value="" title="상세내용"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="tac mt-50 mb80">
				<button id="skillAddBtn" type="button" class="btn">추가</button>
				<button id="skillBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>
	
	<h2>교육이수내역</h2>
	<div class="section st_none">
		<form id="studyForm" name="studyForm" method="post">
			<table id="studyTable" class="botn">
				<caption>교육이수내역 테이블</caption>
				<colgroup>
					<col style="width: 11%">
					<col style="width: 11%">
					<col style="width: 15%">
					<col style="width: 15%">
	  				<col style="width: 28%">
	  				<col style="width: 10%">
	  				<col style="width: 10%">
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">시작일</th>
						<th scope="col">종료일</th>
						<th scope="col">교육명</th>
						<th scope="col">교육기관</th>
						<th scope="col">교육내용</th>
						<th scope="col">비고</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${study[0].SDATE ne NULL }">	
							<c:forEach var="item" items="${study }" varStatus="status">
								<tr>
									<td class="tb_first tac"><input type="text" name="SDATE" value="${item.SDATE }" maxlength="8" title="시작일"></td>
									<td><input type="text" name="EDATE" value="${item.EDATE }" maxlength="8" title="종료일"></td>
									<td><input type="text" name="NAME" value="${item.NAME }" title="교육명"></td>
									<td><input type="text" name="ORG_NAME" value="${item.ORG_NAME }" title="교육기관"></td>
									<td><input type="text" name="CONTENT" value="${item.CONTENT }" title="교육내용"></td>		
									<td><input type="text" name="MEMO" value="${item.MEMO }" title="비고"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>	
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first tac"><input type="text" name="SDATE" value="" maxlength="8" title="시작일"></td>
								<td><input type="text" name="EDATE" value="" maxlength="8" title="종료일"></td>
								<td><input type="text" name="NAME" value="" title="교육명"></td>
								<td><input type="text" name="ORG_NAME" value="" title="교육기관"></td>
								<td><input type="text" name="CONTENT" value="" title="교육내용"></td>		
								<td><input type="text" name="MEMO" value="" title="비고"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="tac mt-50 mb80">
				<button id="studyAddBtn" type="button" class="btn">추가</button>
				<button id="studyBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>
	
	<h2>학력</h2>
	<div class="section">
		<div class="school_list">		
			<c:forEach var="item" items="${school }">					
				<div class="school_section">
					<form id="schoolForm${item.RNUM }" name="schoolForm" method="post">
						<div><img class="school_img" src="/v1/img/resume/${item.PHOTO }" alt="${item.GUBUN } 사진"></div>
						<input type="file" name="PHOTO" title="사진" onchange="rom.util.readURL(this, 'school_img');">
						<div class="mt15">
							<label for="GUBUN${item.RNUM }">구분</label><input type="text" id="GUBUN${item.RNUM }" name="GUBUN" value="${item.GUBUN }"><br>
							<label for="NAME${item.RNUM }">기관명</label><input type="text" id="NAME${item.RNUM }" name="NAME" value="${item.NAME }"><br>
							<label for="MAJOR${item.RNUM }">전공</label><input type="text" id="MAJOR${item.RNUM }" name="MAJOR" value="${item.MAJOR }"><br>
							<label for="ADDR${item.RNUM }">소재지</label><input type="text" id="ADDR${item.RNUM }" name="ADDR" value="${item.ADDR }"><br>
							<label for="RESULTS${item.RNUM }">졸업여부</label><input type="text" id="RESULTS${item.RNUM }" name="RESULTS" value="${item.RESULTS }"><br>
							<label for="SDATE${item.RNUM }">입학일</label><input type="text" id="SDATE${item.RNUM }" name="SDATE" value="${item.SDATE }" maxlength="6"><br>
							<label for="EDATE${item.RNUM }">졸업일</label><input type="text" id="EDATE${item.RNUM }" name="EDATE" value="${item.EDATE }" maxlength="6">						
						</div>
						<div class="school_btn_wrap mt15">
							<button type="button" class="btn btn_pot schoolUpdateBtn">수정</button>
							<button type="button" class="btn schoolDeleteBtn">삭제</button>
						</div>	
						<div class="school_bg"></div>
						<input type="hidden" name="RNUM" value="${item.RNUM }">
						<input type="hidden" name="PHOTO_URL" value="${item.PHOTO }">
					</form>									
				</div>						
			</c:forEach>		
		</div>
		<div class="clear"></div>
		<div class="school_btn">
			<button id="schoolAddBtn" type="button" class="btn">추가</button>
		</div>		
	</div>
	
	<h2>가족관계</h2>
	<div class="section st_none">
		<form id="familyForm" name="familyForm" method="post">
			<table id="familyTable" class="botn">
				<caption>가족관계 테이블</caption>
				<colgroup>
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 15%">
	  				<col style="width: 15%">
	  				<col style="width: 15%">
	  				<col style="width: 15%">
	  				<col style="width: 10%">
				</colgroup>
				<thead>			
					<tr>
						<th scope="col" class="tb_first">관계</th>
						<th scope="col">성명</th>
						<th scope="col">주민등록번호 앞자리</th>
						<th scope="col">동거여부</th>
						<th scope="col">학교</th>
						<th scope="col">직업</th>
						<th scope="col" class="tb_last"></th>
					</tr>
				</thead>
				<tbody>		
					<c:choose>
						<c:when test="${family[0].REL ne NULL }">		
							<c:forEach var="item" items="${family }" varStatus="status">
								<tr>
									<td class="tb_first tac"><input type="text" name="REL" value="${item.REL }" title="관계"></td>
									<td><input type="text" name="NAME" value="${item.NAME }" title="성명"></td>
									<td><input type="text" name="BIRTH" value="${item.BIRTH }" maxlength="6" title="주민등록번호 앞자리"></td>	
									<td><input type="text" name="LIVE_YN" value="${item.LIVE_YN }" title="동거여부"></td>
									<td><input type="text" name="SCHOOL" value="${item.SCHOOL }" title="학교"></td>
									<td><input type="text" name="JOB" value="${item.JOB }" title="직업"></td>
									<td class="tac tb_last"><button type="button" class="btn delBtn <c:if test="${status.last }" > none </c:if>">삭제</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="tb_first tac"><input type="text" name="REL" value="" title="관계"></td>
								<td><input type="text" name="NAME" value="" title="성명"></td>
								<td><input type="text" name="BIRTH" value="" maxlength="6" title="주민등록번호 앞자리"></td>	
								<td><input type="text" name="LIVE_YN" value="" title="동거여부"></td>
								<td><input type="text" name="SCHOOL" value="" title="학교"></td>
								<td><input type="text" name="JOB" value="" title="직업"></td>
								<td class="tac tb_last"><button type="button" class="btn delBtn none">삭제</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="tac mt-50 mb80">
				<button id="familyAddBtn" type="button" class="btn">추가</button>
				<button id="familyBtn" type="button" class="btn btn_pot">수정</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
(function(){	
	//title
	$('.spot h1').text('ADMIN | 이력서 관리');
	//관리자 : U_AUTH가 90인 사용자만 관리가능
	if('${sessionScope.user.U_AUTH }' != '90'){
		$('.content button').attr('disabled', true);
	}
	
	var infoForm = $('#infoForm');
	var infoBtn = $('#infoBtn');
	
	var KOR_NAME = $('input[name=KOR_NAME]');
	var ENG_NAME1 = $('input[name=ENG_NAME1]');
	var ENG_NAME2 = $('input[name=ENG_NAME2]');
	var CHIN_NAME = $('input[name=CHIN_NAME]');
	var SSN = $('input[name=SSN]');
	var ADDR = $('input[name=ADDR]');
	var TEL1 =  $('input[name=TEL1]');
	var TEL2 =  $('input[name=TEL2]');
	var TEL3 =  $('input[name=TEL3]');
	var EMAIL = $('input[name=EMAIL]');
	var PHOTO = $('input[name=PHOTO]');
	
	/*************** 기본정보 수정버튼 클릭시 ********************/
	infoBtn.on('click', function(){
		if(!vaildation()){ //validation체크
			return false;
		}
		
		if(rom.util.isNull(PHOTO.val())){ //썸네일 이미지
			infoUpdate();
		}else{
			infoUpdateMulti();
		}
		
	});	
	function infoUpdate() {
		$.ajax({
			url: "/admin/infoUpdateAction.cmd",
			data : infoForm.serialize(),
			success: function(result){
				var data = $.parseJSON(result);	
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	function infoUpdateMulti() {
		infoForm.ajaxForm({
			url: "/admin/infoUpdateMultiAction.cmd",
			enctype: "multipart/form-data",
			success: function(result){
				var data = $.parseJSON(result);
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
		infoForm.submit();
	}
	//validation체크
	function vaildation(){
		if(rom.util.isNull(KOR_NAME.val())){ //이름
			alert("이름을 입력해 주세요.");
			KOR_NAME.focus();
			return false;		
		}
		if(!rom.util.chkPatten( KOR_NAME.val() ,'regKor')){
			alert("한글입력만 가능합니다.");
			KOR_NAME.focus();
			return false;
		}
		if(rom.util.isNull(ENG_NAME1.val())){ //영문 성
			alert("영문 성을 입력해 주세요.");
			ENG_NAME1.focus();
			return false;		
		}
		if(!rom.util.chkPatten( ENG_NAME1.val() ,'regAlpha')){ //영문 성
			alert("영어입력만 가능합니다.");
			ENG_NAME1.focus();
			return false;		
		}
		/* if(rom.util.isNull(ENG_NAME2.val())){ //영문 이름
			alert("영문 이름을 입력해 주세요.");
			ENG_NAME2.focus();
			return false;		
		}
		if(!rom.util.chkPatten( ENG_NAME2.val() ,'regAlpha')){ //영문 이름
			alert("영어입력만 가능합니다.");
			ENG_NAME2.focus();
			return false;		
		} */
		if(rom.util.isNull(CHIN_NAME.val())){ //한문이름
			alert("한문이름을 입력해 주세요.");
			CHIN_NAME.focus();
			return false;		
		}
		if(rom.util.isNull(SSN.val())){ //주민등록번호
			alert("주민등록번호를 입력해 주세요.");
			SSN.focus();
			return false;		
		}
		if(!rom.util.chkPatten( SSN.val() ,'regIdNum')){ //주민등록번호
			alert("주민등록번호를 정확히 입력해주세요.");
			SSN.focus();
			return false;		
		}
		if(rom.util.isNull(ADDR.val())){ //주소를 입력해 주세요.
			alert("주소를 입력해 주세요.");
			ADDR.eq(0).focus();
			return false;		
		}
		if(rom.util.isNull(TEL1.val()) || rom.util.isNull(TEL2.val()) || rom.util.isNull(TEL3.val())){ //전화번호
			alert("전화번호를 입력해 주세요.");
			TEL1.eq(0).focus();
			return false;		
		}
		if(!rom.util.chkPatten( TEL1.val() + TEL2.val() + TEL3.val() ,'regNum')){ //전화번호
			alert("숫자 입력만 가능합니다.");
			TEL1.focus();
			return false;		
		}
		if(rom.util.isNull(EMAIL.val())){ //이메일
			alert("이메일을 입력해 주세요.");
			EMAIL.focus();
			return false;		
		}
		if(!rom.util.chkPatten( EMAIL.val() ,'regMail')){ //이메일
			alert("이메일을 정확히 입력해주세요.");
			EMAIL.focus();
			return false;		
		}
		
		return true;
	}
	/*************** 기본정보 수정 버튼 클릭시 end ********************/
	
	
	
	/*************** 공통 ********************/
	//tr추가
	function addTr(table){
		console.log(table.find('tbody tr').first().clone().wrapAll('<tr/>').parent().html());
		console.log(table.find('tbody tr').first());
		var html = table.find('tbody tr').first().clone().wrapAll('<tr/>').parent().html();
		html = html.replace(/none/g, '');
		table.find('tbody tr').first().before(html);
		table.find('tbody tr').first().find('input').val('');
		table.find('tbody tr').first().find('input').first().focus();
	}
	
	//삭제버튼
	$('.content').on('click', '.delBtn', function(){
		console.log($(this).parent().parent());
		$(this).parent().parent().remove();
	});	
	//동일name을가진 input값 체크하는 로직
	function focusAction(obj, alertTxt1, reg, alertTxt2){
		var resule = true;
		$.each(obj, function( index, value ) {
			if(value.value == ''){
				alert(alertTxt1);
				$(this).focus();
				resule =  false;
				 return false;
			}else if(reg != null){
				if(!rom.util.chkPatten(value.value ,reg)){
					alert(alertTxt2);
					$(this).focus();
					resule =  false;
					 return false;
				}	
			}
		});
		return resule;
	}
	/*************** 공통 end ********************/
	
	/*************** 이력 수정버튼 클릭시 ********************/	
	//이력추가
	var workAddBtn = $('#workAddBtn'); //추가버튼
	var workTable = $('#workTable');
	workAddBtn.on('click', function(){
		addTr(workTable);
	});
	
	var workBtn = $('#workBtn');
	
	workBtn.on('click', function(){
		if(!vailWork()){ //validation체크
			return false;
		}
		workUpdate();		
	});	
	function workUpdate() {
		$.ajax({
			url: "/admin/workUpdate.cmd",
			data : $('#workForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailWork(){
		if(!focusAction($('#workForm').find('input[name=SDATE]'), '시작일을 입력해 주세요.','regDateyyyyMM', "yyyyMM 형식에 맞게 입력해 주세요.")){ //시작일
			return false;		
		}
		if(!focusAction($('#workForm').find('input[name=EDATE]'),  '종료일을 입력해 주세요.', 'regDateyyyyMM', "yyyyMM 형식에 맞게 입력해 주세요.")){ //종료일
			return false;		
		}
		if(!focusAction($('#workForm').find('input[name=WORK_MON]'),  '개월수를 입력해 주세요.', 'regNum', "숫자 입력만 가능합니다.")){ //개월
			return false;		
		}
		if(!focusAction($('#workForm').find('input[name=WORK_NAME]'),  '근무처명을 입력해 주세요.')){ //근무처명
			return false;		
		}
		return true;
	}	
	/*************** 이력 수정버튼 클릭시 end ********************/
	
	/*************** 프로젝트 수정버튼 클릭시 ********************/	
	//프로젝트추가
	var projectAddBtn = $('#projectAddBtn'); //추가버튼
	var projectTable = $('#projectTable');
	projectAddBtn.on('click', function(){
		addTr(projectTable);
	});
	
	var projectBtn = $('#projectBtn');
	
	projectBtn.on('click', function(){
		if(!vailProject()){ //validation체크
			return false;
		}
		projectUpdate();		
	});	
	function projectUpdate() {
		$.ajax({
			url: "/admin/projectUpdate.cmd",
			data : $('#projectForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailProject(){
		if(!focusAction($('#projectForm').find('input[name=SDATE]'), '시작일을 입력해 주세요.','regDateDel', "yyyyMMdd 형식에 맞게 입력해 주세요.")){ //시작일
			return false;		
		}
		if(!focusAction($('#projectForm').find('input[name=EDATE]'),  '종료일을 입력해 주세요.', 'regDateDel', "yyyyMMdd 형식에 맞게 입력해 주세요.")){ //종료일
			return false;		
		}
		if(!focusAction($('#projectForm').find('input[name=DUTY]'),  '수행업무를 입력해 주세요.')){ //수행업무
			return false;		
		}
		return true;
	}	
	/*************** 프로젝트 수정버튼 클릭시 end ********************/
	
	/*************** 자격/면허 수정버튼 클릭시 ********************/	
	//프로젝트추가
	var licenseAddBtn = $('#licenseAddBtn'); //추가버튼
	var licenseTable = $('#licenseTable');
	licenseAddBtn.on('click', function(){
		addTr(licenseTable);
	});
	
	var licenseBtn = $('#licenseBtn');
	
	licenseBtn.on('click', function(){
		if(!vailLicense()){ //validation체크
			return false;
		}
		licenseUpdate();		
	});	
	function licenseUpdate() {
		$.ajax({
			url: "/admin/licenseUpdate.cmd",
			data : $('#licenseForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailLicense(){
		if(!focusAction($('#licenseForm').find('input[name=NAME]'),  '자격/면허 명을 입력해 주세요.')){ //자격/면허 명
			return false;		
		}
		if(!focusAction($('#licenseForm').find('input[name=ISSU_ORG]'),  '발급기관명을 입력해 주세요.')){ //발급기관명
			return false;		
		}
		if(!focusAction($('#licenseForm').find('input[name=GET_DATE]'), '취득일을 입력해 주세요.','regDateDel', "yyyyMMdd 형식에 맞게 입력해 주세요.")){ //취득일
			return false;		
		}
		if(!focusAction($('#licenseForm').find('input[name=RESULTS]'),  '합격구분을 입력해 주세요.')){ //합격구분
			return false;		
		}
		return true;
	}	
	/*************** 자격/면허 수정버튼 클릭시 end ********************/
	
	/*************** 보유기술 및 능력 수정버튼 클릭시 ********************/	
	//보유기술 및 능력추가
	var skillAddBtn = $('#skillAddBtn'); //추가버튼
	var skillTable = $('#skillTable');
	skillAddBtn.on('click', function(){
		addTr(skillTable);
	});
	
	var skillBtn = $('#skillBtn');
	
	skillBtn.on('click', function(){
		if(!vailSkill()){ //validation체크
			return false;
		}
		skillUpdate();		
	});	
	function skillUpdate() {
		$.ajax({
			url: "/admin/skillUpdate.cmd",
			data : $('#skillForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailSkill(){
		if(!focusAction($('#skillForm').find('input[name=SKILL_NAME]'),  '보유능력을 입력해 주세요.')){ //보유능력
			return false;		
		}
		if(!focusAction($('#skillForm').find('input[name=LEVEL]'),  '수준을 입력해 주세요.')){ //수준
			return false;		
		}
		if(!focusAction($('#skillForm').find('input[name=MEMO]'), '상세내용을 입력해 주세요.')){ //상세내용
			return false;		
		}
		return true;
	}	
	/*************** 보유기술 및 능력 수정버튼 클릭시 end ********************/
	
	/*************** 교육이수내역 수정버튼 클릭시 ********************/	
	//추가
	var studyAddBtn = $('#studyAddBtn'); //추가버튼
	var studyTable = $('#studyTable');
	studyAddBtn.on('click', function(){
		addTr(studyTable);
	});
	
	var studyBtn = $('#studyBtn');
	
	studyBtn.on('click', function(){
		if(!vailStudy()){ //validation체크
			return false;
		}
		studyUpdate();		
	});	
	function studyUpdate() {
		$.ajax({
			url: "/admin/studyUpdate.cmd",
			data : $('#studyForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailStudy(){
		if(!focusAction($('#studyForm').find('input[name=SDATE]'),  '시작일을 입력해 주세요.','regDateDel', "yyyyMMdd 형식에 맞게 입력해 주세요.")){ //보유능력
			return false;		
		}
		if(!focusAction($('#studyForm').find('input[name=EDATE]'),  '종료일을 입력해 주세요.','regDateDel', "yyyyMMdd 형식에 맞게 입력해 주세요.")){ //수준
			return false;		
		}
		if(!focusAction($('#studyForm').find('input[name=NAME]'), '교육명을 입력해 주세요.')){ //상세내용
			return false;		
		}
		if(!focusAction($('#studyForm').find('input[name=ORG_NAME]'), '교육기관을 입력해 주세요.')){ //상세내용
			return false;		
		}
		return true;
	}	
	/*************** 교육이수내역 수정버튼 클릭시 end ********************/
	
	/*************** 가족관계 수정버튼 클릭시 ********************/	
	//추가
	var familyAddBtn = $('#familyAddBtn'); //추가버튼
	var familyTable = $('#familyTable');
	familyAddBtn.on('click', function(){
		addTr(familyTable);
	});
	
	var familyBtn = $('#familyBtn');
	
	familyBtn.on('click', function(){
		if(!vailfamily()){ //validation체크
			return false;
		}
		familyUpdate();		
	});	
	function familyUpdate() {
		$.ajax({
			url: "/admin/familyUpdate.cmd",
			data : $('#familyForm').serialize(),
			success: function(result){
				console.log(result);
				var data = $.parseJSON(result);				
				if(data.result == 'true'){
					alert('수정이 완료되었습니다.');					
				}else{
					alert('수정 중 오류가 발행하였습니다.');
				}
			}
		});
	}
	
	function vailfamily(){
		if(!focusAction($('#familyForm').find('input[name=REL]'),  '관계를 입력해 주세요.')){ //관계
			return false;		
		}
		if(!focusAction($('#familyForm').find('input[name=NAME]'),  '성명을 입력해 주세요.')){ //성명
			return false;		
		}
		if(!focusAction($('#familyForm').find('input[name=BIRTH]'), '주민등록번호 앞자리를 입력해 주세요.', 'regDateyyMMdd', 'yyMMdd 형식으로 입력해주세요.')){ //나이
			return false;		
		}
		if(!focusAction($('#familyForm').find('input[name=LIVE_YN]'), '동거여부를 입력해 주세요.')){ //동거여부
			return false;
		}
		return true;
	}	
	/*************** 가족관계 수정버튼 클릭시 end ********************/
	
	/*************** 학력 추가버튼 클릭시 ********************/
	var schoolAddBtn = $('#schoolAddBtn'); //추가버튼
	var schoolTable = $('#schoolTable');
	var cnt = 0;
	
	schoolAddBtn.on('click', function(){
		cnt++;
		
		var rNum = $('input[name=R_NUM]').val();
		var html = '<div class="school_section">'
			+ '	<form id="schoolInsertForm'+cnt+'" name="schoolInsertForm" method="post">'
			+ '		<div><img class="school_img" src="/v1/img/error/no_image.JPG" alt="사진"></div>'
			+ '		<input type="file" name="PHOTO" title="사진" onchange="rom.util.readURL(this, \'school_img\');">'
			+ '		<div class="mt15">'
			+ '			<label for="INGUBUN'+cnt+'">구분</label><input type="text" id="INGUBUN'+cnt+'" name="GUBUN" value=""><br>'
			+ '			<label for="INNAME$'+cnt+'">기관명</label><input type="text" id="INNAME$'+cnt+'" name="NAME" value=""><br>'
			+ '			<label for="INMAJOR'+cnt+'">전공</label><input type="text" id="INMAJOR'+cnt+'" name="MAJOR" value=""><br>'
			+ '			<label for="INADDR'+cnt+'">소재지</label><input type="text" id="INADDR'+cnt+'" name="ADDR" value=""><br>'
			+ '			<label for="INRESULTS'+cnt+'">졸업여부</label><input type="text" id="INRESULTS'+cnt+'" name="RESULTS" value=""><br>'
			+ '			<label for="INSDATE'+cnt+'">입학일</label><input type="text" id="INSDATE'+cnt+'" name="SDATE" value="" maxlength="6"><br>'
			+ '			<label for="INEDATE'+cnt+'">졸업일</label><input type="text" id="INEDATE'+cnt+'" name="EDATE" value="" maxlength="6">'					
			+ '		</div>'
			+ '		<div class="school_btn_wrap mt15">'
			+ '			<button type="button" class="btn btn_pot schoolInsertBtn">등록</button>'
			+ '			<button type="button" class="btn schoolDelBtn">삭제</button>'
			+ '		</div>'
			+ '		<div class="school_bg"></div>'
			+ '	</form>	'
			+ '</div>';
		
		if($('.school_section').length == 0){
			$('.school_list').append(html); //상세설명 추가			
		}else{
			$('.school_section').first().before(html); //상세설명 추가
		}
		$('.school_section').first().find('input').first().focus();
	});
	/*************** 학력 추가버튼 클릭시 end ********************/
	
	/*************** 학력DIV 삭제버튼 클릭시 ********************/
	$('.content').on('click', '.schoolDelBtn', function(){
		$(this).parent().parent().parent().remove();
	});
	/*************** 학력DIV 삭제버튼 클릭시 end ********************/
	
	/*************** 학력 등록 버튼 클릭시 ********************/
	$('.content').on('click', '.schoolInsertBtn', function(){
		var id = $(this).parent().parent().attr('id');
		if(!detailVaildation(id)){
			return false;
		}
		schoollInsert(id);
	});	
	function schoollInsert(id){
		$('#'+id).ajaxForm({
			url: "/admin/schoolInsert.cmd",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){
				if(result == 'true'){
					alert('등록이 완료되었습니다.');
					location.reload();
				}else{
					alert('등록 중 오류가 발행하였습니다.');
				}
			}
		});
		$('#'+id).submit();
	}
	//validation체크
	function detailVaildation(id){
		var form = $('#'+id);
		if(rom.util.isNull(form.find('input[name=PHOTO]').val())){ //이미지
			alert("이미지를 등록해 주세요.");
			form.find('input[name=PHOTO]').focus();
			return false;		
		}
		if(rom.util.isNull(form.find('input[name=GUBUN]').val())){ //구분
			alert("구분을 입력해 주세요.");
			form.find('input[name=GUBUN]').focus();
			return false;		
		}
		if(rom.util.isNull(form.find('input[name=ADDR]').val())){ //소재지
			alert("소재지를 입력해 주세요.");
			form.find('input[name=ADDR]').focus();
			return false;		
		}
		if(rom.util.isNull(form.find('input[name=SDATE]').val())){ //입학일
			alert("입학일 입력해 주세요.");
			form.find('input[name=SDATE]').focus();
			return false;		
		}
		if(!rom.util.chkPatten(form.find('input[name=SDATE]').val() , 'regDateyyyyMM')){ //입학일
			alert("yyyyMM 형식으로 입력해 주세요.");
			form.find('input[name=SDATE]').focus();
			return false;		
		}
		return true;
	}
	/*************** 학력 등록 버튼 클릭시 end ********************/
	
	/*************** 학력 삭제버튼 클릭시 ********************/
	$('.content').on('click', '.schoolDeleteBtn', function(){
		var id = $(this).parent().parent().attr('id');
		console.log(id);
		if(confirm('정말 삭제하시겠습니까?')){
			detailDelete(id);
		}		
	});
	function detailDelete(id) {
		$.ajax({
			url: "/admin/schoolDelete.cmd",
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
	/*************** 학력 삭제버튼 클릭시 end ********************/
	
	/*************** 학력 수정버튼 클릭시 ********************/
	$('.content').on('click', '.schoolUpdateBtn', function(){
		var id = $(this).parent().parent().attr('id');
		var form = $('#'+id);
		if(rom.util.isNull(form.find('input[name=PHOTO]').val())){ //이미지
			schoolUpdate(id);
		}else{
			schoolUpdateMulti(id);
		}
	});
	function schoolUpdate(id) {
		$.ajax({
			url: "/admin/schoolUpdate.cmd",
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
	function schoolUpdateMulti(id){
		$('#'+id).ajaxForm({
			url: "/admin/schoolMultiUpdate.cmd",
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
	/*************** 학력 수정버튼 클릭시 end ********************/
})();
</script>
</body>
</html>
