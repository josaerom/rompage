<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>준비중</title>
<style type="text/css">
.spot{width: 100%;height: 0;padding-bottom: 35%;background: url(/v1/img/error/setting.jpg) no-repeat;background-size: cover;}
.spot h1{text-align: center;padding-top: 15%;font-size: 28px;font-weight: bold;color: #fff;}
</style>
</head>
<body>
<div class="content">
	<div class="tac">	
		<span class="bullet_pot">현재 페이지는 준비중에 있습니다.</span><br><br>
		<a href="/" class="btn btn_lg btn_pot">메인으로</a>
	</div>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('SETTING | 준비중');
})();
</script>
</body>
</html>
