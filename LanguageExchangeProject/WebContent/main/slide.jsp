<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
<!-- 템플릿 CSS -->
<link rel="stylesheet" href="css/main/reset.css" type="text/css" />
<link rel="stylesheet" href="css/main/styles.css" type="text/css" />
<link rel="stylesheet" href="css/main/meetingStyle.css" type="text/css" />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- 슬라이더_스크립트 -->
<script src="js/jquery.bxslider.min.js"></script>
<script src="js/jquery.bxslider.js"></script>
<!-- 슬라이더_CSS-->
<link href="css/main/jquery.bxslider.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#btnSub').click(function(){
		var word=$('#word').val();
		if(word=="")
		{
			alert("검색어를 입력해 주세요");
			return;
		}
		$('#searchFrm').submit();
	});
});

$(document).ready(function() {
	var jbOffset = $('.navbar-with-search').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() >= jbOffset.top) {
			$('.navbar-with-search').addClass('jbFixed');

		} else {
			$('.navbar-with-search').removeClass('jbFixed');
		}
	});
	/*         $('#sanchor a').click(function() {
	 var onTab = $(this).find('li').attr('id');
	 $('.sanchor a li').removeClass('on');
	 $( '#' + onTab ).addClass("on");
	 }); */
});

</script>


<style>
body {
	margin: 0px;
	padding: 0px;
}

.sanchor_fixed {
	margin-left: 100px;
	width: 70px;
}

.jbTitle {
	text-align: center;
}

.jbContent {
	height: 2000px;
}

.jbFixed {
	position: fixed;
	top: 0px;
}

.find-navbar {
	width: 960px;
	margin: 0 auto;
	background-color: #505050;
	color: #ddd;
 	z-index: 10; 
}

.navbar-with-search {
	margin-left: 20px;
	width: 950px;
	border: 0;
	border-radius: 0px;
}

.navbar-inverse {
	background-color: #505050;
	border-color: #080808;
}
</style>
</head>
<body>
	<div id="body">
		<ul class="bxslider" style="margin: 0px; padding: 0px;">
			<li><img src="images/main/slide1.jpg" />
				<h3>안녕하세요</h3></li>	
			<li><img src="images/main/slide2.jpg" />
				<h3>새로운 친구를만나보세요.</h3></li>
			<li><img src="images/main/slide3.jpg" /></li>
			<li><img src="images/main/slide4.jpg" /></li>
			<li><img src="images/main/slide5.jpg" /></li>
			<li><img src="images/main/slide6.jpg" /></li>
			<li><img src="images/main/slide7.jpg" /></li>
			<li><img src="images/main/slide8.jpg" /></li>
		</ul>
		<br>

	<nav class="navbar navbar-inverse navbar-with-search" role="navigation" style="!important; margin-top: 0px; z-index: 10;"> 
		<a class="navbar-brand" href="#">모임 검색</a>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div>
		<div>
		<form method="get" id="searchFrm" action="search.do">
				<div class="input-group" style="width: 250px; margin-top: 7px; margin-left: 0px;">
					<input type="text" class="form-control" placeholder="Search"
						id=word name=word> <span class="input-group-btn">
						<button class="btn btn-default" type="button" id=btnSub>Search</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!-- /.navbar-collapse -->
	</nav>
</div>
		
</body>
</html>