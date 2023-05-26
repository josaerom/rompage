<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div id="LOTTO_03">
		<div id="resultText" class="result_wrap">
			<div class="title">나눔로또 <span class="title_cnt" id="resultCnt"></span>회</div>			
			<div class="num_wrap">
				<span id="resultNum0"></span>
				<span id="resultNum1"></span>
				<span id="resultNum2"></span>
				<span id="resultNum3"></span>
				<span id="resultNum4"></span>
				<span id="resultNum5"></span>
				<div class="bonus">+ <span id="resultNum6"></span></div>
			</div>
			<br><br>
			1등 총 <span class="b" id="resultRank"></span> 명
			<br>
			1게임당 당첨금액 <span class="b" id="resultMoney"></span> 원
		</div>
	</div>
</div>
</body>
<script>
(function myLottoResult(){
	var self = $("#LOTTO_03");
	
	self.resultView = function(){
		rom.loader.show();
		$.ajax({
			url : "/lotto/result.cmd",
			success : function(data){
				rom.loader.hide();
				var result = eval('('+data+')');
				$("#resultCnt").text(result.lottoNum[0].cnt);
				$("#resultRank").text(result.lottoNum[0].rank);
				$("#resultMoney").text(result.lottoNum[0].money);
				for(var i=0; i<7; i++){
					$("#resultNum"+i).text(result.lottoNum[i].num).addClass('num_bg_'+$.trim(result.lottoNum[i].num));	
				}	
			}
		});
	}
	
	window['LOTTO_03'] = self;	
	self.resultView();
})();
</script>