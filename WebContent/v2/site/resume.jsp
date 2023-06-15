<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>이력서</title>
        <link href="/v2/css/resume.min.css" rel="stylesheet" type="text/css" />
        <link rel="preload" href="/v2/image/main/main_02.jpg" as="image" fetchpriority="high" />
      </head>

      <body>
        <!-- content -->
        <section class="top-banner active">
          <div class="top-banner-bg">
            <div class="inner-wrap">
              <div class="title-motion active" aria-hidden="true">
                <span>R</span><span>E</span><span>S</span><span>U</span><span>M</span><span>E</span>
              </div>
              <h1 class="sr-only">이력서</h1>
            </div>
          </div>
        </section>
        <div class="quick-wrap collapse" role="tablist">
          <span class="sr-only">바로가기</span>
          <button class="quick-collapse-btn">닫기</button>
          <ul class="quick-list">
            <li class="quick-item">
              <button data-link="section01" role="tab" aria-controls="tabpanel01">기본정보</button>
            </li>
            <li class="quick-item">
              <button data-link="section02" role="tab" aria-controls="tabpanel02">이력</button>
            </li>
            <li class="quick-item">
              <button data-link="section03" role="tab" aria-controls="tabpanel03">프로젝트 수행</button>
            </li>
            <li class="quick-item">
              <button data-link="section04" role="tab" aria-controls="tabpanel04">자격/면허</button>
            </li>
            <li class="quick-item">
              <button data-link="section05" role="tab" aria-controls="tabpanel05">보유기술 및 능력</button>
            </li class="quick-item">
            <li class="quick-item">
              <button data-link="section06" role="tab" aria-controls="tabpanel06">교육이수내역</button>
            </li>
            <li class="quick-item">
              <button data-link="section07" role="tab" aria-controls="tabpanel07">학력</button>
            </li>
          </ul>
        </div>
        <section class="content">
          <div class="sction-wrap">
            <h2 class="title" id="section01">기본정보</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel01" role="tabpanel">
              <div class="table info">
                <div class="cell">
                  <img class="photo fr" src="/common/img/resume/${info.PHOTO }" alt="이력서 사진">
                </div>
                <div class="cell">
                  <span class="info_name">${info.KOR_NAME }</span>( ${info.CHIN_NAME } )<br>
                  <span class="info_eng_name">${info.ENG_NAME1 }</span><br>
                  ${info.AGE } 살 ( ${info.GENDER } )<br>
                  ${info.TEL1 } - ${info.TEL2 } - ${info.TEL3 }<br>
                  ${info.EMAIL }<br>
                </div>
              </div>
              <div class="clear"></div>
            </div>
          </div>

          <div class="sction-wrap">
            <h2 class="title" id="section02">이력</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel02" role="tabpanel">
              <table class="rwd-table">
                <caption>사회생활 이력 테이블</caption>
                <colgroup>
                  <col style="width: 30%">
                  <col style="width: 20%">
                  <col style="width: 15%">
                  <col style="width: 35%">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">근무기간</th>
                    <th scope="col">근무처명</th>
                    <th scope="col">소속팀</th>
                    <th scope="col">담당업무</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${work }">
                    <tr>
                      <td data-th="근무기간">
                        <fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMM" />
                        <fmt:formatDate value="${sdate }" pattern="yyyy.MM" /> ~
                        <fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMM" />
                        <fmt:formatDate value="${edate }" pattern="yyyy.MM" />
                        (${item.WORK_MON }개월)
                      </td>
                      <td data-th="근무처명">${item.WORK_NAME }</td>
                      <td data-th="소속팀">${item.WORK_TEAM }</td>
                      <td data-th="담당업무">${item.PART }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

          <div class="sction-wrap">
            <h2 class="title" id="section03">프로젝트 수행</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel03" role="tabpanel">
              <table class="rwd-table">
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
                    <th scope="col">프로젝트 기간</th>
                    <th scope="col">직책</th>
                    <th scope="col">발주처</th>
                    <th scope="col">수행업무</th>
                    <th scope="col">소속</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${project }">
                    <tr>
                      <td data-th="프로젝트 기간">
                        <fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMMdd" />
                        <fmt:formatDate value="${sdate }" pattern="yyyy.MM.dd" /> ~
                        <fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMMdd" />
                        <fmt:formatDate value="${edate }" pattern="yyyy.MM.dd" />
                      </td>
                      <td data-th="직책">${item.POSITION }</td>
                      <td data-th="발주처">${item.ORDER_ORG }</td>
                      <td data-th="수행업무">${item.DUTY }</td>
                      <td data-th="소속">${item.WORK_NAME }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="sction-wrap">
            <h2 class="title" id="section04">자격/면허</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel04" role="tabpanel">
              <table class="rwd-table">
                <caption>자격/면허 정보 테이블</caption>
                <colgroup>
                  <col style="width: 40%">
                  <col style="width: 25%">
                  <col style="width: 25%">
                  <col style="width: 10%">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">자격/면허 명</th>
                    <th scope="col">발급기관명</th>
                    <th scope="col">취득일</th>
                    <th scope="col">합격구분</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${license }">
                    <tr>
                      <td data-th="자격/면허 명">${item.NAME }</td>
                      <td data-th="발급기관명">${item.ISSU_ORG }</td>
                      <td data-th="취득일">
                        <fmt:parseDate value="${item.GET_DATE }" var="getdate" pattern="yyyyMMdd" />
                        <fmt:formatDate value="${getdate }" pattern="yyyy.MM.dd" />
                      </td>
                      <td data-th="합격구분">${item.RESULTS }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

          <div class="sction-wrap">
            <h2 class="title" id="section05">보유기술 및 능력</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel05" role="tabpanel">
              <table class="rwd-table">
                <caption>보유기술 및 능력 테이블</caption>
                <colgroup>
                  <col style="width: 25%">
                  <col style="width: 75%">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">보유능력</th>
                    <th scope="col">상세내용</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${skill }">
                    <tr>
                      <td data-th="보유능력">${item.SKILL_NAME }</td>
                      <td data-th="상세내용">${item.MEMO }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <div class="sction-wrap">
              <h2 class="title" id="section06">교육이수내역</h2>
              <button class="collapse-btn">닫기</button>
              <div class="section fade" id="tabpanel06" role="tabpanel">
                <table class="rwd-table">
                  <caption>교육이수내역 테이블</caption>
                  <colgroup>
                    <col style="width: 15%">
                    <col style="width: 20%">
                    <col style="width: 15%">
                    <col style="width: 50%">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">교육기간</th>
                      <th scope="col">교육명</th>
                      <th scope="col">교육기관</th>
                      <th scope="col">교육내용</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="item" items="${study }">
                      <tr>
                        <td data-th="교육기간">
                          <fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMMdd" />
                          <fmt:formatDate value="${sdate }" pattern="yyyy.MM.dd" /> ~
                          <fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMMdd" />
                          <fmt:formatDate value="${edate }" pattern="yyyy.MM.dd" />
                        </td>
                        <td data-th="교육명">${item.NAME }</td>
                        <td data-th="교육기관">${item.ORG_NAME }</td>
                        <td data-th="교육내용">${item.CONTENT }</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <div class="sction-wrap">
            <h2 class="title" id="section07">학력</h2>
            <button class="collapse-btn">닫기</button>
            <div class="section fade" id="tabpanel07" role="tabpanel">
              <div class="school_list">
                <c:forEach var="item" items="${school }">
                    <!-- <img src="/common/img/resume/${item.PHOTO }" alt="${item.GUBUN } 사진"> -->
                      <h5>${item.GUBUN }</h5>
                      <p>
                        <c:if test="${item.NAME ne '-' && item.NAME ne '' }">${item.NAME }</c:if>
                        <c:if test="${item.MAJOR ne '-' && item.MAJOR ne ''}">(${item.MAJOR })</c:if><br>
                        ${item.ADDR }<br>
                        <c:if test="${item.RESULTS ne '-' && item.RESULTS ne ''}">${item.RESULTS }</c:if><br>
                        <fmt:parseDate value="${item.SDATE }" var="sdate" pattern="yyyyMM" />
                        <fmt:formatDate value="${sdate }" pattern="yyyy년 MM월" />
                        <c:if test="${item.EDATE ne ''}">
                          ~
                          <fmt:parseDate value="${item.EDATE }" var="edate" pattern="yyyyMM" />
                          <fmt:formatDate value="${edate }" pattern="yyyy년 MM월" />
                        </c:if>
                      </p>
                    <div class="school_bg"></div>
                </c:forEach>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </section>

        <script src="/v2/js/resume/resume.js" type="text/javascript"></script>
      </body>

      </html>