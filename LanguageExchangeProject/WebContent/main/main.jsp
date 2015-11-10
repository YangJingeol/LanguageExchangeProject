<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>나들목</title>
<!-- 부트스트랩 -->
<!--  <link rel="stylesheet" href="css/main/bootstrap.min.css" type="text/css" />  -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-56404cf45816e20a" async="async"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- 템플릿 CSS -->
<link rel="stylesheet" href="css/main/reset.css" type="text/css" />
<link rel="stylesheet" href="css/main/styles.css" type="text/css" />
<link rel="stylesheet" href="css/main/meetingStyle.css" type="text/css" />

<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> -->
<!-- 슬라이더_스크립트 -->
<script src="js/jquery.bxslider.min.js"></script>
<script src="js/jquery.bxslider.js"></script>

<!-- 슬라이더_CSS-->
<link href="css/main/jquery.bxslider.css" rel="stylesheet" />
<script src="js/scrollBanner2.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			randomStart : true,
			controls : false
		});
	});
	function login() {
		var f = document.loginFrm;
		if (f.email.value == "") {
			alert("이메일을 입력해주세요.");
			f.id.focus();
			return;
		}
		if (f.pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			f.pwd.focus();
			return;
		}
		f.submit();
	}
	function search() {
		var f = document.searchFrm;
		if (f.word.value == "") {
			alert("이메일을 입력해주세요.");
			f.word.focus();
			return;
		}
	}

</script>
<style type="text/css">
/* 퀵메뉴 */

#aside {
display:block; 
position:absolute; 
left:1020px; top:80; z-index:30; width:200px; padding-top:40px; height:480px; }


.inline-block, .inlineBlock {
	display: inline-block;
	zoom: 1;
}

.padding-none, .paddingNone {
	padding: 0 !important;

a.dropdown-toggle:HOVER 
{
	background-color: transparent !important; 

}

.sf-menu
{
	font-family: 다음;
	font-size: 20px;
}
.nav {
    padding-left: 0;
    font-family: 다음;
    margin-bottom: 0;
    list-style: none;
}
</style>
</head>
<body>

	<div id="container">
		<header>
	
		<div class="width" data-toggle="collapse" data-target="#nabar-collapse-1">
			<h1>
				<a href="main.do" style="text-decoration: none;">Naduelmok</a>
			</h1>
			<nav>
			<ul class="sf-menu">
				<li><a href="meeting_insert.do">개설하기 </a></li>
				<li><a href="meeting_type.do?lang=영어" style="height: 57px;">언어별</a></li>
				<li><a href="meeting_place.do?place=서울" style="height: 56px;">지역별</a></li>
				<li><a href="#" style="height: 56px;">고객센터</a>
					<ul>
						<li><a href="notice.do">공지사항</a></li>
						<li><a href="qna.do">QnA</a></li>
						<li><a href="faq.do">FAQ</a></li>
					</ul></li>
			</ul>
			</nav>

			<span id="Log_group"
				style="float: right; margin: 23px; margin-right: 100px; !important">
				<c:if test="${sessionScope.email==null }">
					<a href="join.do"><button type="button" class="btn btn-default">SignUP</button></a>
					<!-- Button trigger modal -->
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info " data-toggle="modal"
						data-target="#myModal">&nbsp;&nbsp;Login&nbsp;&nbsp;</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<form name="loginFrm" method="post" action="login_check.do">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Login</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="usr">Name:</label> <input type="text"
												class="form-control" name="email" id="email">
										</div>
										<div class="form-group">
											<label for="pwd">Password:</label> <input type="password"
												class="form-control" name="pwd" id="pwd">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="login()">Login</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</c:if> <c:if test="${sessionScope.email!=null }">
					<ul class="nav navbar-nav" id="navbar-collapse-1" style="z-index:1000;">
				</c:if> <c:if test="${sessionScope.email!=null }">
					<ul class="nav navbar-nav">
						  <style type="text/css"> a.dropdown-toggle:HOVER{background-color:transparent !important;} </style> 
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white; padding-top: 0px;">${sessionScope.name}님

								환영합니다 <span class="glyphicon glyphicon-user pull-right"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="modify.do"><span
										class="glyphicon glyphicon-cog pull-right"></span>회원정보 수정</a></li>
								<br>
								<li><a href="meeting.do"><span class="badge pull-right">
											${sessionScope.m_count } </span>내모임보기</a></li>
								<br>
								<li><a href="wish.do"><span
										class="glyphicon glyphicon-heart pull-right"></span>위시리스트 </a></li>
								<br>
								<li><a href="logout.do"><span
										class="glyphicon glyphicon-log-out pull-right"></span>로그아웃 </a></li>
							</ul></li>
					</ul>

				</c:if>
			</span>
		</div>
		<div class="clear"></div>
	</header>
	<!-- <div id="aside">
		<div class="well" style="margin-left: 0px auto; padding-left: 0px auto; margin-bottom: 0px;">
		<ul style="list-style:none;padding-left:0px; margin-left: 0px; margin-bottom: 0px;" align=center>
			<li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-earphone"></span>&nbsp;Contact</a></li><br><br>
			<li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-headphones"></span>&nbsp;Language</a></li><br><br>
			<li><a href="#" style="text-decoration: none;"><span class=" glyphicon glyphicon-globe"></span>&nbsp;Region</a></li><br><br>
			<li><a href="#" style="text-decoration: none;"><span class=" glyphicon glyphicon-question-sign"></span>&nbsp;QnA</a></li><br><br>
			<li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-menu-up"></span>&nbsp;TOP</a></li><br>
			<br>
			<div class="addthis_sharing_toolbox"></div>
		</ul>
		</div>
		</div>
	</div>

	 <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-info-sign"></span> Any questions? Feel free to contact us.</h4>
                    </div>
                    <form action="#" method="post" accept-charset="utf-8">
                    <div class="modal-body" style="padding: 5px;">
                          <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                    <input class="form-control" name="firstname" placeholder="Firstname" type="text" required autofocus />
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                    <input class="form-control" name="lastname" placeholder="Lastname" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="email" placeholder="E-mail" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="subject" placeholder="Subject" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <textarea style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="comment" required></textarea>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-footer" style="margin-bottom:-14px;">
                            <input type="submit" class="btn btn-success" value="Send"/>
                                <span class="glyphicon glyphicon-ok"></span>
                            <input type="reset" class="btn btn-danger" value="Clear" />
                                <span class="glyphicon glyphicon-remove"></span>
                            <button style="float: right;" type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->

	<div id="switch_main" style="margin: 0; padding: 0; background-color: white; margin-top: 10px; z-index:2;">
		<jsp:include page="${slide }"></jsp:include>
		<jsp:include page="${quick }"></jsp:include>
		<jsp:include page="${jsp }"></jsp:include>
	</div>
	<pre id="output"></pre>
	</header>

</body>
</html>