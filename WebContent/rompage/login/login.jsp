<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/v1/img/common/favicon.ico" type="image/x-icon" />
<script src="/v1/js/jquery.1.11.1.js"></script>
<script src="/v1/js/jquery.1.11.4.ui.min.js"></script>
<link href="/v1/css/common.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/login.css" rel="stylesheet" type="text/css" />
<title>로그인 : ROMPAGE</title>
</head>
<body>
<div id="login_wrap">
	<div class="logo">
		<a href="/"><img src="/v1/img/common/logo_main.png" alt="ROMPAGE로고" ></a>
	</div>
	<div id="login_container">
		<form name="frmNIDLogin" id="frmNIDLogin" method="post">
			<fieldset>
			<legend>로그인 입력폼</legend>
			<div class="section_7n3 login">
				<div>
					<div class="input_box">
						<label for="id" id="label_id" class="lbl_in">아이디</label>
						<input type="text" id="id" name="id" maxlength="41" title="아이디" accesskey="L" placeholder="아이디" class="int">
					</div>
	                <div class="input_box"><label for="pw" id="label_pw" class="lbl_in">비밀번호</label><input type="password" id="pw" name="pw" maxlength="16" title="비밀번호" placeholder="비밀번호" class="int">
	                    <div class="error_box_v2" style="display: none" id="div_capslock">
	                        <p><strong>Caps Lock</strong>이 켜져 있습니다.</p>
	                    </div>
	                </div>
				</div>
				<div class="keeping">
					<button id="loginBtn" type="button">LOGIN</button>
				</div>
			</div>
			<div class="btn_lnk">
				<a href="/">GUEST</a>
				<!-- <a href="#">JOIN</a> -->
			</div>
			</fieldset>
		</form>		
	</div>	
</div>
<div class="mt50" id="footer">
	<p class="copyright">Copyright © 2016 ROMPAGE All rights reserved.</p>
</div>
<script type="text/javascript">
(function(){
	var loginBtn = $('#loginBtn');
	var frmNIDLogin = $('#frmNIDLogin');
	var id = $('#id');
	loginBtn.on('click', function(){
		$.ajax({
			url: "/login/loginAction.cmd",
			data : frmNIDLogin.serialize(),
			success: function(result){
				var data = $.parseJSON(result);
				if(data.result == 'true'){
					window.location.href = '/';	
				}else{
					alert('로그인정보를 다시 확인해 주세요.');
					id.focus();
				}
			}
		});
	});
	
	//비밀번호 엔터 로그인
    $('#pw').keypress(function(event){
        if(event.keyCode == 13){
        	loginBtn.click();
        }
    });
})();
</script>
</body>
</html>