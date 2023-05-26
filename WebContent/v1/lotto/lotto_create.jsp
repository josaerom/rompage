<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<div id="LOTTO_01" class="tac mt50">						
		<form id="createForm">
			<ul class="num">
				<li><input type="text" name="num0" readonly="readonly" /></li>
				<li><input type="text" name="num1" readonly="readonly" /></li>
				<li><input type="text" name="num2" readonly="readonly" /></li>
				<li><input type="text" name="num3" readonly="readonly" /></li>
				<li><input type="text" name="num4" readonly="readonly" /></li>
				<li><input type="text" name="num5" readonly="readonly" /></li>			
			</ul>	
			<div class="btn_wrap mb20">							
				<button class="btn btn_lg btn_pot create_btn" id="createBtn" type="button">번호추첨</button>
				<button class="btn btn_lg" id="resetBtn" type="button">RESET</button>
				<button class="btn btn_lg" id="saveBtn" type="button">저장</button>				
			</div>
		</form>
		<span class="bullet_pot">번호를 직접입력 하여 수동또는 반자동으로 이용 가능합니다.</span>
	</div>
</div>
</body>
<script>
(function myLotto(){
	var self = $("#LOTTO_01");
	var isForm = $('#createForm');
	/* $('#getBtn').off('click').on('click',function(){
		$.ajax({
			url : "http://www.645lotto.net/ajax_jsonNew.asp?sGameNo=605",
			success : function(data){
				console.log(data);
			}
		});
	}); */
		
	//생성버튼
	$('#createBtn').off('click').on('click',function(){
		$('ul.num input').removeClass()
		$('input[readonly=readonly]').val("");
		$.ajax({
			url : "/lotto/create.cmd",
			data : isForm.serialize(),
			success : function(data){
				var lottoNum = eval('('+data+')');
				for(var i=0; i<6; i++){
					$("input[name=num"+i+"]").removeClass().val(lottoNum.lotto[i].num).attr('class','num_bg_'+lottoNum.lotto[i].num);					
				}
				for(var i=0; i<6; i++){
					(function looper (i) {
						setTimeout(function() {
							$("input[name=num"+i+"]").addClass('bounce animated');
							if ( 10 > ++i ){
								looper (i);
							}
						}, 70);
					})(0);					
				}
			}
		});	
	});
	//text
	//숫자만 입력, 45보다 큰수 입력 못하게 제한
	$('input[name^=num]').on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/gi,""));
		if($(this).val()<1 || $(this).val() >45){
			$(this).val("");
		}
	});
	//textbox클릭 시, 입력가능하도록 변환	
	$('input[name^=num]').off('click').on('click',function(){			
		var selectIdx = Number(this.name.substr(3,4));
		var selectInput = $('input[name=num'+selectIdx+']');
		if(selectIdx != 0){
			var idx = selectIdx-1;
			var selectBefore = $('input[name=num'+idx+']');
			if(selectBefore.attr('readonly') == undefined){
				selectInput.css('background','#ffe09e');
				selectInput.removeAttr('readonly');
			}
		}else{
			selectInput.css('background','#ffe09e');
			selectInput.removeAttr('readonly');
		}
	});	
	$('input[name^=num]').off('keypress').on('keypress',function(){
		var selectIdx = Number(this.name.substr(3,4));
		var selectInput = $('input[name=num'+selectIdx+']');
		if(selectIdx != 0){
			var idx = selectIdx-1;
			var selectBefore = $('input[name=num'+idx+']');
			if(selectBefore.attr('readonly') == undefined){
				selectInput.css('background','#ffe09e');
				selectInput.removeAttr('readonly');
			}
		}else{
			selectInput.css('background','#ffe09e');
			selectInput.removeAttr('readonly');
		}
	});
		
	
	//reset버튼 클릭 시, 모두 초기화상태로 변환
	$('#resetBtn').off('click').on('click',function(){
		$('input[name^=num]').val("");
		$('input[name^=num]').attr('readonly','readonly');
		$('input[name^=num]').removeAttr('style').removeClass();
	});
	//저장
	$('#saveBtn').off('click').on('click',function(){
		if('${sessionScope.user.U_ID }' == ''){
			alert('로그인 후 이용가능합니다.');
			return;
		}
		if(!validation()){
			return;
		}
		$.ajax({
			url : "/lotto/insert.cmd",
			data : isForm.serialize(),
			success : function(data){
				if(data){
					alert('저장이 완료되었습니다.');
				}else{
					alert('저장 중 오류가 발생하였습니다.');
				}
			}
		});
	});
	
	function validation(){
		if(rom.util.isNull($('input[name=num0]').val()) || rom.util.isNull($('input[name=num1]').val()) ||
				rom.util.isNull($('input[name=num2]').val()) || rom.util.isNull($('input[name=num3]').val()) ||
				rom.util.isNull($('input[name=num4]').val()) || rom.util.isNull($('input[name=num5]').val())){
			alert('번호를 추첨해 주세요.');
			$('#createBtn').focus();
			return false;
		}
		return true;
	}
	
	self.fnSetUser = function(user){
		$.ajax({
			url : "/setUser.do",
			data : {user : user},
			success : function(data){
				$('#dialog').hide();
				$('#tabs').tabs({active:0});
				$('.nav ul li').removeAttr('style');
				$('.nav ul li').first().css('background','#FAA6A6');
			}
		});
	}
	window['LOTTO_01'] = self;
	
})();
</script>
