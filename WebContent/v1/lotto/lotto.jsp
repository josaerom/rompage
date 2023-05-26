<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로또</title>
<link href="/v1/css/lotto.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div id="tabs">	
		<ul class="tab_select">				
			<li><a href="/v1/lotto/lotto_create.jsp">CREATE</a></li>
		    <li><a href="/v1/lotto/lotto_list.jsp">LIST</a></li>
		    <li><a href="/v1/lotto/lotto_result.jsp">RESULT</a></li>
		</ul>				
		<div id="tabs-1" class="tab_panel">
		</div>		
	</div>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('LOTTO | 로또');
	//tab
	$( "#tabs" ).tabs();
})();
</script>
</body>
</html>
