<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
<script src="/v1/js/jquery.1.11.1.js"></script>
<script src="/v1/js/jquery.1.11.4.ui.min.js"></script>
<script src="/v1/js/iscroll.js"></script>
	<script src="/v1/js/iscroll-probe.js"></script>
<link href="/v1/css/common.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/v1/css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	/* * {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		padding: 0;
		margin: 0;
	}
	
	
	
	 */
	 #wrapper {
		position: absolute;
		top:0;
		z-index: 1;
		width: 100%;
		height: 100%;
		overflow: auto;
	}
	img {
		width: 100%;
	}
	/* .content-wrap {
		overflow: auto;
		-webkit-overflow-scrolling: touch;
	} */
	
	/* .contents {
		background: #ccc;
	} */
	
	</style>
<title>메인 : ROMPAGE</title>
</head>
<body>
<div id="img-wrap">
		<img src="/v1/img/resume/resume.jpg">
	</div>
	<div id="wrapper">
		<div id="scroller">
			<div class="content-wrap">
				<ul class="contents">
					<li>Pretty row 1</li>
					<li>Pretty row 2</li>
					<li>Pretty row 3</li>
					<li>Pretty row 4</li>
					<li>Pretty row 5</li>
					<li>Pretty row 6</li>
					<li>Pretty row 7</li>
					<li>Pretty row 8</li>
					<li>Pretty row 9</li>
					<li>Pretty row 10</li>
					<li>Pretty row 11</li>
					<li>Pretty row 12</li>
					<li>Pretty row 13</li>
					<li>Pretty row 14</li>
					<li>Pretty row 15</li>
					<li>Pretty row 16</li>
					<li>Pretty row 17</li>
					<li>Pretty row 18</li>
					<li>Pretty row 19</li>
					<li>Pretty row 20</li>
					<li>Pretty row 21</li>
					<li>Pretty row 22</li>
					<li>Pretty row 23</li>
					<li>Pretty row 24</li>
					<li>Pretty row 25</li>
					<li>Pretty row 26</li>
					<li>Pretty row 27</li>
					<li>Pretty row 28</li>
					<li>Pretty row 29</li>
					<li>Pretty row 30</li>
					<li>Pretty row 31</li>
					<li>Pretty row 32</li>
					<li>Pretty row 33</li>
					<li>Pretty row 34</li>
					<li>Pretty row 35</li>
					<li>Pretty row 36</li>
					<li>Pretty row 37</li>
					<li>Pretty row 38</li>
					<li>Pretty row 39</li>
					<li>Pretty row 40</li>
					<li>Pretty row 41</li>
					<li>Pretty row 42</li>
					<li>Pretty row 43</li>
					<li>Pretty row 44</li>
					<li>Pretty row 45</li>
					<li>Pretty row 46</li>
					<li>Pretty row 47</li>
					<li>Pretty row 48</li>
					<li>Pretty row 49</li>
					<li>Pretty row 50</li>
				</ul>
			</div>
		</div>
	</div>
<script type="text/javascript">
(function(){
	 var mScroll = new IScroll('#wrapper', { 
	        mouseWheel: true,
	        scrollbars: true,
	        probeType: 3
	    });
	     
	    mScroll.on('scroll', function() {
	        // 스크롤 이벤트 발생시 이미지 wrap 영역을 y/2 만큼 위로 올림.
	        $('#img-wrap').css('transform', "translate(0, "+this.y/2+"px)");
	    });
	     
	    // 화면 리사이징 되는 경우.
	    $(window).resize(function() {
	        resize();
	    });
	     
	    $(window).load(function() {
	        resize();
	    });
	     
	    function resize() {
	         
	        // 이미지 wrap 의 세로 크기를 구해와서 padding-top 셋팅.
	        var height = $('#img-wrap').height();
	        $('.content-wrap').css('padding-top', height + "px");
	         
	        // 스크롤 재계산.
	        mScroll.refresh();
	    }
})();
</script>
</body>
</html>