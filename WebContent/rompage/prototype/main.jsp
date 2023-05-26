<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로토타입</title>
<style type="text/css">
.spot{width: 100%;height: 0;padding-bottom: 35%;background: url(/v1/img/admin/admin.jpg) no-repeat;background-size: cover;}
.spot h1{text-align: center;padding-top: 15%;font-size: 28px;font-weight: bold;color: #fff;}
</style>
</head>
<body>
<div class="content">	
	<h2>FONT</h2>
	<div class="section">
		<h2>H2 : fontsize[22px]</h2>
		<h3>H3 : fontsize[18px]</h3>
		<h4>H4 : fontsize[15px]</h4>
		<span>기본 : fontsize[13px]</span><br>
		<span class="clr_r">강조 : fontsize[13px] color[#db0000]</span><br>
		<span class="bullet_pot">참고text</span>
		
		<h4 class="clr_r">벗꽃엔딩</h4>
		<p>
			봄바람 휘날리며 흩날리는 벚꽃 잎이 울려 퍼질 이 거리를 둘이 걸어요.<br>
			바람 불면 울렁이는 기분 탓에 나도 모르게
			바람 불면 저편에서 그대여 니 모습이 자꾸 겹쳐<br>
			오 또 울렁이는 기분 탓에 나도 모르게 
			바람 불면 저편에서 그대여 니 모습이 자꾸 겹쳐 <br>			
		</p>
		<p>			
			사랑하는 연인들이 많군요 알 수 없는 친구들이 많아요.<br> 
			흩날리는 벚꽃 잎이 많군요 좋아요.
		</p>
		
	</div>	
	
	<h2>BUTTON</h2>
	<div class="section">
		<button type="button" class="btn">기본버튼</button>
		<button type="button" class="btn btn_pot">강조버튼</button>
		<button type="button" class="btn" disabled>비활성 버튼</button>		
		<br><br>
		<button type="button" class="btn btn_lg">LARGE 버튼</button>
		<button type="button" class="btn btn_lg" disabled>비활성 버튼</button>
		<button type="button" class="btn btn_lg btn_print">PRINT</button>
		<button type="button" class="btn btn_lg btn_down">DOWNLOAD</button>
		<br><br>
		<button type="button" class="btn btn_sm">small 버튼</button>
		<button type="button" class="btn btn_sm" disabled>비활성 버튼</button><br><br>
		<a href="#top" class="btn_quick">바로가기</a>
	</div>
	
	<h2>LIST</h2>
	<div class="section">
		<ul class="bullet">
			<li>첫번째
				<ul>
					<li>두번째1</li>
					<li>두번째2
						<ul>
							<li>세번째1</li>
							<li>세번째2</li>
							<li>세번째3</li>
						</ul>
					</li>					
				</ul>
			</li>
			<li>두번째</li>
			<li>세번째</li>
		</ul>
	</div>
	
	<h2>INPUT</h2>
	<div class="section">
		<label for="txt">텍스트박스</label><input type="text" id="txt" name="txt" value="텍스트 문구">
		<label for="txt2" class="blind">텍스트박스</label><input type="text" id="txt2" name="txt" value="텍스트 문구 비활성화" disabled>
		<br>
		<input type="radio" id="radio1" name="tp_radio"><label for="radio1">라디오버튼1</label>
		<input type="radio" id="radio2" name="tp_radio"><label for="radio2">라디오버튼2</label>
		<br>
		<input type="checkbox" id="checkbox1" name="tp_checkbox"><label for="checkbox1">체크박스1</label>
		<input type="checkbox" id="checkbox2" name="tp_checkbox"><label for="checkbox2">체크박스2</label>
	</div>
	
	<h2>TABLE</h2>
	<div class="section st_none">
		<table class="botn mg0">
			<caption>테이블</caption>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 30%">
				<col style="width: 70%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="tb_first">head1</th>
					<th scope="col">head2</th>
					<th scope="col" class="tb_last">head3</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tb_first">content1</td>
					<td>content2</td>
					<td class="tb_last">content3</td>
				</tr>
				<tr>
					<td class="tb_first">content1</td>
					<td>content2</td>
					<td class="tb_last">content3</td>
				</tr>
				<tr>
					<td class="tb_first">content1</td>
					<td>content2</td>
					<td class="tb_last">content3</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="section">
		<h3>기본 테이블</h3>
		<table>
			<caption>테이블</caption>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 30%">
				<col style="width: 70%">
			</colgroup>			
			<tbody>
				<tr>
					<th scope="row" class="tb_first">haed1</th>
					<td>content1</td>
					<td class="tb_last">content2</td>
				</tr>
				<tr>
					<th scope="row" class="tb_first">haed2</th>
					<td>content1</td>
					<td class="tb_last">content2</td>
				</tr>
				<tr>
					<th scope="row" class="tb_first">haed3</th>
					<td>content1</td>
					<td class="tb_last">content2</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<h2>TAB</h2>
	<div class="section st_none">
		<div id="tabs" class="mt30">
			<ul class="tab_select">
				<li><a href="#tabs1">tab1</a></li>
			    <li><a href="#tabs2">tab2</a></li>
			    <li><a href="#tabs3">tab3</a></li>
			</ul>
			<div id="tabs1" class="tab_panel">
				<h4 class="blind">tab1</h4>
				<p>
					그대여 아무 걱정 하지 말아요 
					우리 함께 노래 합시다 
					그대 아픈 기억들 모두 그대여 
					그대 가슴 깊이 묻어 버리고 <br>
					
					지나간 것은 지나간 대로 
					그런 의미가 있죠 
					떠난이에게 노래 하세요 
					후회없이 사랑했노라 말해요 
				</p>
			</div>
			<div id="tabs2">
				<h4 class="blind">tab2</h4>
				<p>
					그댄 너무 힘든 일이 많았죠 
					새로움을 잃어 버렸죠 
					그대 힘든 얘기들 모두 꺼내어 
					그대 탓으로 훌훌 털어 버리고<br>
					지나간 것은 지나간 대로 
					그런 의미가 있죠 
					우리 다함께 노래 합시다 
					후회없이 꿈을 꾸었다 말해요<br>
					지나간 것은 지나간 대로 
					그런 의미가 있죠 
					우리 다함께 노래 합시다 
					후회없이 꿈을 꾸었다 말해요
				</p>
			</div>
			<div id="tabs3">
				<h4 class="blind">tab3</h4>
				<p>
					지나간 것은 지나간대로 
					그런 의미가 있죠 
					우리가 함께 노래 합시다 
					후회없이 꿈을 꾸었다 말해요 
					우리 다함께 노래 합시다 
					새로운 꿈을 꾸겠다 말해요<br>
					지나간 것은 지나간대로 
					그런 의미가 있죠 
					우리 다함께 노래 합시다 
					후회없이 꿈을 꾸었다 말해요<br>
					지나간 것은 지나간대로 
					그런 의미가 있죠 
					우리 다 함께 노래 합시다 
					후회없이 꿈을 꾸었다 말해요
				</p>
			</div>
		</div>
	</div>
		
	<h2>DIALOG</h2>
	<div class="section">
		<div class="dialog_wrap" id="dialogFrm" title="한글가능">
			<p>
				지나간 것은 지나간대로 
				그런 의미가 있죠 
				우리가 함께 노래 합시다 
				후회없이 꿈을 꾸었다 말해요 
				우리 다함께 노래 합시다 
				새로운 꿈을 꾸겠다 말해요<br>
				지나간 것은 지나간대로 
				그런 의미가 있죠 
				우리 다함께 노래 합시다 
				후회없이 꿈을 꾸었다 말해요<br>
				지나간 것은 지나간대로 
				그런 의미가 있죠 
				우리 다 함께 노래 합시다 
				후회없이 꿈을 꾸었다 말해요
			</p>
		</div>
		<button class="btn" type="button" id="dialogBtn">DIALOG OPEN</button>
	</div>
	
	<h2>LOADER</h2>
	<div class="section">
		<button class="btn" type="button" id="loaderBtn">LOADER SHOW</button>
	</div>
	
	<h2>Column Chart</h2>
	<div id="chart8"></div>
	<script>
		var options = {
			'legend': {
	            names: ['A','B','C','D','E','F','G','H','I'],
	            hrefs: []
	        },
	        'dataset': {
	            title: 'Playing time per day',
	            values: [5,7,1,4,6,3,5,2,10],
	            colorset: ['#56b4e9'],
	            fields:['Error']
	        },
	        'chartDiv': 'chart8',
	        'chartType': 'column',
	        'chartSize': { width: 700, height: 300 },
	        'maxValue': 10,
	        'increment': 1
		};

		Nwagon.chart(options);

	</script>
</div>
<script type="text/javascript">
(function(){
	//title
	$('.spot h1').text('PROTOTYPE | 프로토타입');
	//tab
	$('#tabs').tabs();
	
	//dialog
	var option = {
		
	};
	$('#dialogBtn').button().on('click', function() {		
		rom.dialog.open($("#dialogFrm"), option);
	});
	
	//loader
	$('#loaderBtn').on('click', function() {		
		rom.loader.setTimeout(2000);
	});	
})();
</script>
</body>
</html>
