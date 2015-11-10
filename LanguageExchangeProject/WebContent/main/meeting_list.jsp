<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<script type="text/javascript" src="js/ajax/ajax2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#init').addClass('active');

		$('.nav.nav-tabs li').click(function() {
			$('.nav.nav-tabs li.active').removeClass('active');
			$(this).addClass('active');
		});
		$('#tab1').click(function() {
			$('#border_main2').hide();
			$('#border_main').show();
		});

		$('#tab2').click(function() {
			$('#border_main').hide();
			$('#border_main2').show();
		});
		$('#cal').click(function() {
			$(this).addClass('active');
			$('#border_main3').show();
		});

	});
</script>

<style type="text/css">
.inline-block, .inlineBlock {
	display: inline-block;
	zoom: 1;
}

.padding-none, .paddingNone {
	padding: 0 !important;
}
.groupCard--gradient {
    height: 100%;
    width: 100%;
    position: absolute;
    background-color: transparent;
    background-image: -webkit-linear-gradient(rgba(15,20,31,0) 0,rgba(15,20,31,.1) 25%,rgba(15,20,31,.8) 100%);
    background-image: linear-gradient(rgba(8, 8, 8, 0.51) 0,rgba(15,20,31,.1) 25%,rgba(15,20,31,.8) 100%)
    
}
#tit{
    margin-bottom: 10px;
    letter-spacing: -1px;
    font-weight: 300;
    font-size: 1.7em;
    margin-top: 100px;
    font-family: 다음;
    font-size: x-large;
    float: left;
    margin-left: 25px;
    color: white;
    width: 250px;
}

#tit1{
    margin-bottom: 10px;
    letter-spacing: -1px;
    font-size: 1.7em;
    font-family: 다음;
    font-size: medium;
    margin-left: 40px;
    color: hsla(64, 92%, 48%, 0.93);
}
.detail_list
{
  font-family: 다음;
  color: white;

}
</style>
</head>
<body>

	<div class="container">
		<ul class="nav nav-tabs"
			style="margin-right: 100px; margin-left: 5px; max-width: 80%;">
			<li id=init><a href="#" id="tab1">최신순</a></li>
			<li><a href="#" id="tab2">인기순</a></li>
			<!-- <button class="btn btn-default" type="button"  style="margin-left:620px;" >Calender</button> -->
			<li style="margin-left: 635px;"><a href="#" id="cal"
				data-toggle="modal" data-target="#myModal2">달력</a></li>
	</div>
	</ul>

	<div id="border_main"
		style="margin-left: 10px; z-index: 900">
		<c:forEach var="dto" items="${list }">
			<div class="view view-first" id="${dto.m_no }" style="background-image: url('images/main/meeting.jpg'); background-repeat: no-repeat;">
			<div class="groupCard--gradient">
				<span id="tit">${dto.m_title }</span>
				<span id="tit1"><br> 모임일 : ${dto.m_partDate1 } ~ ${dto.m_partDate2 } 
				<br>장소: ${dto.m_location}( ${dto.m_place} )</span>
			</div>
				<div class="mask">
					<h2>${dto.m_title }</h2>
					<p sstyle="font-family:다음;">${dto.m_summary }</p>
					<ul align=left style="font-size: 12px; list-style: none;" class="detail_list">
						<li>교환 언어: <span>${dto.m_lang1 } ↔ ${dto.m_lang2 }</span></li>
						<li>접수마감일 : <span>2015-10-30</span></li>
						<li>개설자 아이디 : ${dto.m_email }</li>
						<a href="meeting_detail.do?no=${dto.m_no} " class="info" style="margin-left:30px; margin-top:10px;">모임참여</a>
						<a href="meeting_zzim.do?mno=${dto.m_no }" class="info">찜하기</a>
<%-- 						<a href="meeting_zzim.do?mno=${dto.m_no }" class="info" style="background:transparent; !important">
						<img src="images/nowish.png" width="22px" height="26px" /> --%>
						</a>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>

		<div id="border_main2"
		style="margin-left: 10px; margin-top: 50px; z-index: 900;display: none">

			<c:forEach var="dto" items="${list2 }">
			<div class="view view-first" id="${dto.m_no }" style="background-image: url('images/main/meeting.jpg'); background-repeat: no-repeat;">
			<div class="groupCard--gradient">
				<span id="tit">${dto.m_title }</span>
				<span id="tit1"><br> 모임일 : 2015-11-25 ~ 2015-12-20
				<br>장소: ${dto.m_location}( ${dto.m_place} )</span>
			</div>
				<div class="mask">
					<h2>${dto.m_title }</h2>

					<p sstyle="font-family:다음;">${dto.m_summary }</p>
					<ul align=left style="font-size: 12px; list-style: none;" class="detail_list">
						<li>교환 언어: <span>${dto.m_lang1 } ↔ ${dto.m_lang2 }</span></li>
						<li>접수마감일 : <span>2015-10-30</span></li>
						<li>개설자 아이디 : ${dto.m_email } ${dto.m_wish }</li>
						<a href="meeting_detail.do" class="info" style="margin-left:30px; margin-top:10px;">모임참여</a>
						<a href="meeting_zzim.do?mno=${dto.m_no }" class="info">찜하기</a>
<%-- 						<a href="meeting_zzim.do?mno=${dto.m_no }" class="info" style="background:transparent; !important">
						<img src="images/nowish.png" width="22px" height="26px" /> --%>
					</ul>
					
				</div>
			</div>

		</c:forEach>
	</div>

	<div id="border_main3" style="margin-left: 10px; margin-top: 50px; z-index: 900; display: none">

		<!--  달력 -->
		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content" style="width: 842px;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="color: black;">날짜별 모임</h4>
					</div>
					<div class="modal-body">
						<%-- <!-- 캘린다 -->
						        <!-- <form name="dayFrm" method="post" action="main.do">  "day.value=(this).value-->
						           <input type=date name="day_meeting" class="day_meeting" id="day_meeting" onchange="pushday()" value="${partDate }">
						            <input type=text name="day" id="day"  value="${partDate }"> 
						           <br><br> --%>
						<iframe
							src="https://calendar.google.com/calendar/embed?title=%EB%AA%A8%EC%9E%84%EC%9D%BC%EC%A0%95&amp;height=600&amp;wkst=1&amp;hl=ko&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul"
							style="border: solid 1px #777" width="800" height="600"
							frameborder="0" scrolling="no"></iframe>

					</div>
					<div class="modal-footer">
						<%-- 			        <span class="daylist">gg </span>       
				       ------
							        <c:forEach var="d" items="${dlist }">
							                                        모임타이틀: ${d.m_title }
				                    </c:forEach>   --%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>