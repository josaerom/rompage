<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>포트폴리오 상세페이지</title>
<link href="/v2/css/portfolio-detail.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- content -->

<input type="hidden" name="rNum" value="${rNum }">
<input type="hidden" name="currentPage" value="${currentPage }">
<div id="portfolioDetail"></div>

<script crossorigin src="/v2/js/library/react.development.js"></script>
<script crossorigin src="/v2/js/library/react-dom.development.js"></script>
<script src="/v2/js/library/babel.min.js"></script>
<script src="/v2/js/library/polyfill.min.js"></script>

<script src="/v2/js/portfolio/dist/portfolioDetail.js"></script>
</body>
</html>
