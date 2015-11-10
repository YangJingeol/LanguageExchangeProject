<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 템플릿 CSS -->
<link rel="stylesheet" href="../css/main/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/main/styles.css" type="text/css" />
<link rel="stylesheet" href="../css/main/meetingStyle.css" type="text/css" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
</head>
<body>
	<div id="intro" style="margin-top:-10px;">
			<div class="intro-content intro-content-short">
				<h2>언어별 모임</h2>
			</div>
	</div>
	<br><br>	
			<div class="col-lg-6" style="margin-left:71%;">
				<div class="input-group" style="width:55%;">
					<input type="text" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="height:21px ;"></span></button>
					</span>
				</div>
			</div> 
	<div>
		<ul>
			<a href="language.do?m_Lang2=한국어">한국어</a>
			<a href="language.do?m_Lang2=일본어">일본어</a>
			<a href="language.do?m_Lang2=중국어">중국어</a>
			<a href="language.do?m_Lang2=독일어">독일어</a>
			<a href="language.do?m_Lang2=영어">영어</a>
		</ul>
	</div>

	<div id="body">
	
		<div id="border_main" style="margin-left: 100px; margin-top: 50px; z-index: 900">
			<c:if test="${count==0 }">
				<center><h2>해당 모임이 존재하지 않습니다</h2></center>
			</c:if>
			<c:if test="${count!=0 }">
			<c:forEach var="d" items="${list }">	
			<div class="view view-first">
				<img src="images/1.jpg" />
				<div class="mask">
					<h2 align=center>${d.m_Title }</h2>
					<p>${d.m_Summary }</p>
					<ul align=left style="font-size: 12px; list-style: none;">
						<li>접수마감 : <span>${d.m_MeetingDate }</span></li>
						<li>모집인원 : <span>${d.m_TotalNum }</span>명
						<li>교환언어 : <span>${d.m_Lang1 }</span> ↔ <span>${d.m_Lang2 }</span></li>
						</li>
						<a href="#" class="info">모임참여</a>
						<a href="#" class="info">찜하기!</a>
					</ul>
				</div>
			</div>
		</c:forEach>
		</c:if>
	</div>
</div>


<br><br>
<%-- <center>
	<div>		
		<nav1>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <spanaria-hidden="true">&laquo;</span></a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
			</nav1>
		</div>
	</center> --%>	
</body>
</html>