<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서</title>
<link href="/v1/css/resume.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="content">	
	<div class="quick_wrap">
		<span class="bullet">바로가기</span><br>
		<button class="btn_quick" type="button">기본정보</button>
		<button class="btn_quick" type="button">이력</button>
		<button class="btn_quick" type="button">프로젝트 수행</button>
		<button class="btn_quick" type="button">자격/면허</button>
		<button class="btn_quick" type="button">보유기술 및 능력</button>
		<button class="btn_quick" type="button">교육이수내역</button>
		<button class="btn_quick" type="button">학력</button>
		<button class="btn_quick" type="button">가족관계</button>
	</div>
	<h2>기본정보</h2>
	<div class="section">
		<div class="table info">
			<div class="cell">
				<img class="photo fr" src="/v1/img/resume/${info.PHOTO }" alt="이력서 사진">
			</div>
			<div class="cell">
				<span class="info_name">${info.KOR_NAME }</span>( ${info.CHIN_NAME } )<br>
				<span class="info_eng_name">${info.ENG_NAME1 }</span><br>
				${info.AGE } 살 ( ${info.GENDER } )<br>				
				${info.BIRTH } <br><br>
				${info.ADDR }<br>
				${info.TEL1 } - ${info.TEL2 } - ${info.TEL3 }<br>
				${info.EMAIL }<br>
			</div>
		</div>
		<div class="clear"></div>
		<%-- <table class="botn">
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
					<td rowspan="5" class="tb_first tac"><img class="photo" src="${info.PHOTO }" alt="이력서 사진"></td>
					<th scope="row" class="tb_first">이름</th>
					<td></td>
					<th scope="row">영문명</th>
					<td>${info.ENG_NAME1 } ${info.ENG_NAME2 }</td>
					<th scope="row">한문</th>
					<td class="tb_last">${info.CHIN_NAME }</td>
				</tr>
				<tr>
					<th scope="row">나이</th>
					<td>${info.AGE }</td>
					<th scope="row">성별</th>
					<td>${info.GENDER }</td>
					<th scope="row">생년월일</th>
					<td class="tb_last">${info.BIRTH }</td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td colspan="5" class="tb_last">${info.ADDR }</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td colspan="5" class="tb_last">${info.TEL1 } - ${info.TEL2 } - ${info.TEL3 }</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td colspan="5" class="tb_last">${info.EMAIL }</td>
				</tr>
			</tbody>
		</table> --%>
	</div>
	
	<h2>이력</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>사회생활 이력 테이블</caption>
			<colgroup>
				<col style="width: 30%">
				<col style="width: 20%">
				<col style="width: 15%">
				<col style="width: 35%">
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">근무기간</th>
					<th scope="col">근무처명</th>
					<th scope="col">소속팀</th>
					<th scope="col" class="tb_last">담당업무</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${work }">
					<tr>
						<td class="tb_first tac">
							<fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMM"/>
							<fmt:formatDate value="${sdate }" pattern="yyyy.MM"/> ~
							<fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMM"/>
							<fmt:formatDate value="${edate }" pattern="yyyy.MM"/> 
							(${item.WORK_MON }개월)
						</td>
						<td>${item.WORK_NAME }</td>
						<td>${item.WORK_TEAM }</td>
						<td class="tb_last">${item.PART }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h2>프로젝트 수행</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>프로젝트 수행 이력 테이블</caption>
			<colgroup class="">
				<col style="width: 20%">
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 30%">
				<col style="width: 20%">			
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">프로젝트 기간</th>
					<th scope="col">직책</th>
					<th scope="col">발주처</th>
					<th scope="col" class="tb_last">수행업무</th>
					<th scope="col" class="tb_last">소속</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${project }">
					<tr>
						<td class="tb_first tac">
							<fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${sdate }" pattern="yyyy.MM.dd"/> ~
							<fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${edate }" pattern="yyyy.MM.dd"/>
						</td>
						<td>${item.POSITION }</td>
						<td>${item.ORDER_ORG }</td>
						<td>${item.DUTY }</td>
						<td class="tb_last">${item.WORK_NAME }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h2>자격/면허</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>자격/면허 정보 테이블</caption>
			<colgroup>
				<col style="width: 40%">
				<col style="width: 25%">
				<col style="width: 25%">
				<col style="width: 10%">				
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">자격/면허 명</th>
					<th scope="col">발급기관명</th>
					<th scope="col">취득일</th>
					<th scope="col" class="tb_last">합격구분</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${license }">
					<tr>
						<td class="tb_first">${item.NAME }</td>
						<td>${item.ISSU_ORG }</td>
						<td class="tac">
							<fmt:parseDate value="${item.GET_DATE }" var="getdate" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${getdate }" pattern="yyyy.MM.dd"/>
						</td>						
						<td class="tb_last">${item.RESULTS }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h2>보유기술 및 능력</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>보유기술 및 능력 테이블</caption>
			<colgroup>
				<col style="width: 25%">
				<col style="width: 15%">
				<col style="width: 60%">			
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">보유능력</th>
					<th scope="col">수준</th>
					<th scope="col" class="tb_last">상세내용</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${skill }">
					<tr>
						<td class="tb_first">${item.SKILL_NAME }</td>
						<td class="tac">${item.LEVEL }</td>		
						<td class="tb_last">${item.MEMO }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h2>교육이수내역</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>교육이수내역 테이블</caption>
			<colgroup>
				<col style="width: 15%">
				<col style="width: 20%">
				<col style="width: 15%">
  				<col style="width: 40%">
  				<col style="width: 10%">
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">교육기간</th>
					<th scope="col">교육명</th>
					<th scope="col">교육기관</th>
					<th scope="col">교육내용</th>
					<th scope="col" class="tb_last">비고</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${study }">
					<tr>
						<td class="tb_first tac">
							<fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${sdate }" pattern="yyyy.MM.dd"/> ~
							<fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${edate }" pattern="yyyy.MM.dd"/>
						</td>
						<td>${item.NAME }</td>
						<td>${item.ORG_NAME }</td>
						<td>${item.CONTENT }</td>		
						<td class="tb_last">${item.MEMO }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h2>학력</h2>
	<div class="section">
		<div class="school_list">			
			<c:forEach var="item" items="${school }">
				<div>
					<img src="/v1/img/resume/${item.PHOTO }" alt="${item.GUBUN } 사진">
					<div>
						<h5>${item.GUBUN }</h5>
						<p>
							<c:if test="${item.NAME ne '-' && item.NAME ne '' }">${item.NAME }</c:if>
							<c:if test="${item.MAJOR ne '-' && item.MAJOR ne ''}">(${item.MAJOR })</c:if><br>
							${item.ADDR }<br>
							<c:if test="${item.RESULTS ne '-' && item.RESULTS ne ''}">${item.RESULTS }</c:if><br>
							<fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMM"/>
							<fmt:formatDate value="${sdate }" pattern="yyyy년 MM월"/>
							<c:if test="${item.EDATE ne ''}"> 
								~ <fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMM"/>
								<fmt:formatDate value="${edate }" pattern="yyyy년 MM월"/>
							</c:if>
						</p>
					</div>
					<div class="school_bg"></div>					
				</div>
			</c:forEach>			
		</div>
		<div class="clear"></div>
	</div>
	
	<h2>가족관계</h2>
	<div class="section st_none">
		<table class="botn">
			<caption>교육이수내역 테이블</caption>
			<colgroup>
				<col style="width: 25%">
				<col style="width: 25%">
				<col style="width: 25%">
  				<col style="width: 25%">
			</colgroup>
			<thead>			
				<tr>
					<th scope="col" class="tb_first">관계</th>
					<th scope="col">성명</th>
					<th scope="col">나이</th>
					<th scope="col" class="tb_last">동거여부</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="item" items="${family }">
					<tr>
						<td class="tb_first tac">${item.REL }</td>
						<td>${item.NAME }</td>
						<td>${item.BIRTH }</td>	
						<td class="tb_last">${item.LIVE_YN }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('RESUME | 이력서');
	var btn_quick = $('.btn_quick'); //바로가기 버튼
	var contents = $('.content');
	btn_quick.click(function () {
	    var _y = contents.find('h2:eq(' + ($(this).index() -2) + ')').position().top - 50;
	    pageMove(_y);
	});
	
	//스크롤링
	function pageMove(targetY) {
	    $('html,body').stop().animate({
	        scrollTop: targetY
	    }, 1200, "easeOutExpo")
	}
	
})();
</script>
</body>
</html>
