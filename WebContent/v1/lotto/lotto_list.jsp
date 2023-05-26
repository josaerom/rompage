<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div id="LOTTO_02">
		<div id="lottoList" class="tac">
			<ul>					
			</ul>
		</div>	
	</div>
</div>
<script>
(function() {
	var self = $('#LOTTO_02');
	
	self.fnFav = function(_this){
		var fav;
		var listIdx = $(_this).parent().parent().parent().find('input[name=listIdx]').val();
		if($(_this).parent().parent().parent().parent().hasClass('fav')){
			$(_this).parent().parent().parent().parent().removeClass('fav');			
			$(_this).text("☆");					
		}else{
			$(_this).parent().parent().parent().parent().addClass('fav');			
			$(_this).text("★");
			fav = "1";
		}
		$.ajax({
			url : "/lotto/update.cmd",
			data : { fav :fav , listIdx : listIdx},
			success : function(data){			
				
			}
		});
	}
	self.fnComp = function(_this){
		rom.loader.show();
		$.ajax({
			url : "/lotto/result.cmd",
			success : function(data){
				rom.loader.hide();
				var result = eval('('+data+')');
				var compNum ="";
				for(var i=0; i<6; i++){
					compNum = $(_this).parent().parent().parent().find('.num'+i).text();					
					for(var j=0; j<6; j++){
						if(compNum == $.trim(result.lottoNum[j].num)){
							$(_this).parent().parent().parent().find('.num'+i).addClass('bg_red');
						}
					}
					if(compNum == $.trim(result.lottoNum[6].num)){
						$(_this).parent().parent().parent().find('.num'+i).addClass('bg_blue');
					}
					$(_this).parent().parent().parent().find('.num'+i).addClass('rubberBand animated');
				}
			}
		});
	}	
	self.fnDel = function(_this){
		var listIdx = $(_this).parent().parent().parent().find('input[name=listIdx]').serialize();
		$.ajax({
			url : "/lotto/delete.cmd",
			data : listIdx,
			success : function(data){
				self.getList();
			}
		});
	}
	self.getList = function(){
		rom.loader.show();
		$.ajax({
			url : "/lotto/list.cmd",
			success : function(data){
				rom.loader.hide();
				$("#lottoList ul li").remove();
				
				if(data == '[]'){
					$("#lottoList").append('NO DATA');
					return;
				}
				var jsonT = data.replace(/=/gi,':');
				var result = eval('('+jsonT+')');
				
				if(result[0].result == 'false'){
					$("#lottoList").append('<span class="bullet_pot">로그인 후 이용해주세요.<span>');
					return;
				}
				var listData = "";
				
				
				if(result.length == 0){
					listData += '<li>NO DATA</li>';
				}else{
					for(var i=0; i<result.length; i++){
						if(result[i].fav == 'null'){
							listData += '<li>';
						}else{
							listData += '<li class="fav">';	
						}						
						listData += '	<div class="lotto_list">';
						listData += '		<div>';
						listData += '			<input type="hidden" name="listIdx" value="'+result[i].idx+'" />';
						listData += '			<span class="num0 num_bg_'+result[i].num0+'">'+result[i].num0+'</span>';
						listData += '			<span class="num1 num_bg_'+result[i].num1+'">'+result[i].num1+'</span>';
						listData += '			<span class="num2 num_bg_'+result[i].num2+'">'+result[i].num2+'</span>';
						listData += '			<span class="num3 num_bg_'+result[i].num3+'">'+result[i].num3+'</span>';
						listData += '			<span class="num4 num_bg_'+result[i].num4+'">'+result[i].num4+'</span>';
						listData += '			<span class="num5 num_bg_'+result[i].num5+'">'+result[i].num5+'</span>';
						listData += '		</div>';
						listData += '		<div class="list_r">';						
						listData += '			<span class="dateText">'+result[i].createDate+'</span>';						
						listData += '			<div class="list_btn_wrap">';
						listData += '				<button class="btn delBtn" onclick="javascript:window[\'LOTTO_02\'].fnDel(this);">삭제</button>';
						listData += '				<button class="btn compBtn" onclick="javascript:window[\'LOTTO_02\'].fnComp(this);">결과비교</button>';
						if(result[i].fav == 'null'){
							listData += '			<button class="btn favBtn" onclick="javascript:window[\'LOTTO_02\'].fnFav(this);">☆</button>';
						}else{
							listData += '			<button class="btn favBtn" onclick="javascript:window[\'LOTTO_02\'].fnFav(this);">★</button>';
						}
						listData += '			</div>';
						listData += '		</div>';
						listData += '	</div>';
						listData += '</li>';
					}	
				}
				
				$("#lottoList ul").append(listData);
			}
		});
	}
	window['LOTTO_02'] = self;
	self.getList();
})();
  </script>