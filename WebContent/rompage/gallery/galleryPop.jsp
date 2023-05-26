<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	div#touchSlider10 { width: auto;}
	.touchSlider10_wrap { background:#ccc; overflow:hidden; }
	#touchSlider10 { height:500px; margin:0 100px; position:relative; overflow:visible; }
	#touchSlider10 ul { width:99999px; position:absolute; top:0; left:0; overflow:hidden; }
	#touchSlider10 ul li { display:block; float:left; width:100%; height:500px; background:transparent; font-size:14px; color:#fff; text-align: center; }
	#touchSlider10 ul::AFTER{content: ''; display: block; clear: both;}
	#touchSlider10 ul li img{width:auto; max-width:100%;  height:100%; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}
	
	.btn_area { position: absolute; top:200px; }
	.btn_area button { display:block; width:100px; height:36px; background:transparent; border:0; font-size:50px; color:#fff; font-weight:bold; }
	.btn_area button.btn_prev { float:left; }
	.btn_area button.btn_next { float:right; }
</style>
<div class="touchSlider10_wrap">
	<div id="touchSlider10">
		<ul>
			<li>
				<img src="/v1/img/resume/resume.jpg">
			</li>
			<li>
				<img src="/v1/img/portfolio/port-sub_05.jpg">
			</li>
			<li>
				content 3
			</li>			
		</ul>
	</div>
</div>
<div class="btn_area">
	<button type="button" class="btn_prev"><img src="/v1/img/gallery/img_prev.png" alt="이전"></button>
	<button type="button" class="btn_next"><img src="/v1/img/gallery/img_next.png" alt="다음"></button>
</div>
<script type="text/javascript">
(function(){	
	$('div').attr('width','');		
	$("#touchSlider10").touchSlider({
		sidePage : true,
		btn_prev : $(".touchSlider10_wrap").next().find(".btn_prev"),
		btn_next : $(".touchSlider10_wrap").next().find(".btn_next")
	});
})();
</script>