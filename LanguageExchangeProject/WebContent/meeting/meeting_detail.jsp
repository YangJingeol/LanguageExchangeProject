<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 상세페이지</title>
<link rel="stylesheet" type="text/css" href="meeting/css/div.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>	
	<!-- <script src="js/bootstrap.min.css"></script> -->
	<!-- <script src="js/jquery.shop.menu.js"></script> -->
<!-- 메뉴바 style -->
	<style>
      body {
        margin: 0px;
        padding: 0px;
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
    </style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
      $( document ).ready( function() {
        var jbOffset = $( '.sanchor_fixed' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() >= jbOffset.top ) {
            $( '.sanchor_fixed' ).addClass( 'jbFixed' );
            
          }
          else {
            $( '.sanchor_fixed' ).removeClass( 'jbFixed' );
          }
        });
        $('#sanchor a').click(function() {
          	var onTab = $(this).find('li').attr('id');
          	$('.sanchor a li').removeClass('on');
          	$( '#' + onTab ).addClass("on");
          });
      });
</script>
<style>
.on {
	border: 2px solid blue !important;
	border-bottom: 1px solid white !important;
	background: white;
}
</style>
<!-- 메뉴바 style 끝 -->
<!-- 지도 script -->
<script src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=db00a706b710f6f0170643c811c16bd4">
</script>
<script>
	window.onload= function() {
		var map = new nhn.api.map.Map('map');	//여기까지 했을 때 지도가 띄워진다. 지도 생성
							//이 메소드만 사용 했을 때는 지도의 마우스 휠로 줌 인 아웃기능만 사용할 수 있다.
		var mapZoom = new nhn.api.map.ZoomControl();
		mapZoom.setPosition({ left: 20, top: 20 });	//포지션에 정해준 위치에 맵을 줌 인 아웃 할 수 있는 위젯을 만들어준다. 
		var mapType = new nhn.api.map.MapTypeBtn();
		mapType.setPosition({ left: 50, top: 20 });	//지도를 일반지도와 위성지도를 볼 수 있게 해준다.
		var mapTraffic = new nhn.api.map.TrafficMapBtn();
		mapTraffic.setPosition({ left: 125, top: 20 });	//실시간 교통 버튼을 만들어준다.
		//밑에는 변수를 사용해주는 소스이다.
		map.addControl(mapZoom);
		map.addControl(mapType);
		map.addControl(mapTraffic);
		map.addControl(mapTheme);
	};	
</script>
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d998db0ec989b933cdbbd87c230d86cf"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=APIKEY&libraries=services,clusterer"></script> -->

<!-- 지도 script 끝 -->

</head>
<body id="body">
<!-- 모임 타이틀 -->
	<div id="div_1">
		&nbsp;&nbsp;<b>${d.m_title }</b>
	</div>
	<div id="div_2">
		<div class="div_2-1">
			<p><img src="${img }" width=300px height="300px"></p>
			<ul>
				<li>${total }명</li>
				<li>마감일: 2일 전</li>
			</ul>	
		</div>
<!-- 모임 사진 및 기본 정보 -->
		<div class="div_2-2">
			<ul class="first">
				<li>모임기간: ${d.m_meetingDate1 }</li>
			</ul>
			<ul class="second">
				<li>참여신청: ${d.m_partDate1 }</li>
			</ul>
			<ul>
				<li>모임장소: ${d.m_location }</li>
				<li>교환언어: ${d.m_lang1},${d.m_lang2 }</li>
			</ul>
			<ul>
				<li>${d.m_lang1 } 모집인원: ${d.m_lang1num }명</li>
				<li>${d.m_lang2 } 모집인원: ${d.m_lang2num }명</li>
			</ul>
			<ul class="bar">
				<li>
	<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" 
	style="width:100%">
      70%
    </div>
    
				</li>
			</ul>
			<ul class="pro">
				<li class="one">총 모집인원: ${total }명</li>
				<li>언어1 참여자: 2명</li>
				<li>언어2 참여자: 2명</li>
			</ul>
			<ul class="short_des">
				<li>모임 요약설명: ${d.m_summary } </li>
			</ul>
			<ul class="btn_list">
				<li class="endApply">
				<form id="applyForm" name="apply_form" method="post" action="meeting_apply.do"> 
					<input type="hidden" name="email" value="${sessionScope.email }">
					<input type="hidden" name="no" value="${d.m_no }">
					<input type="submit" value="모임 참여하기">
		     		<!-- <a href="#apply" onclick="applyCheck();">모임 참여하기</a> -->
		     	</form>
		    	</li>
		    	<li class="wish">
		     		<a href="#btn" onclick="wishCnt();">위시리스트</a>
		    	</li>
			</ul>
		</div>
	</div>
<!-- 모임 개설자 정보 -->
	<div id="div_3">
		<ul>
			<li class="title"><b>모임 개설자</b></li>
			<li>
				<img src="images\meeting\opener.png" width=70 height=70>
				${d.m_email } ${d.m_tel }
			</li>
		</ul>
	</div>
<!-- 메뉴바 -->
	<div id="sanchor_wrap" class="sanchor_fixed">
		<ul id="sanchor" class="sanchor">
			<a href="#div_4"><li id="tab_inf">상세정보</li></a>
       	 	<a href="#div_5"><li id="tab_pla">모임 장소</li></a>
			<a href="#div_6"><li id="tab_not">모임 공지</li></a>
			<a href="#div_7"><li id="tab_com">모임 후기</li></a>
			<a href="#div_8"><li id="tab_qa">모임 Q&A</li></a>
			<a href="#div_9"><li id="tab_list">참가자 LIST</li></a>   
		</ul>
	</div>
<!-- 모임 내용 -->
	<div id="all_contents">
<!-- 상세 정보 -->	
	
		<div id="div_4">
			${d.m_content }
		</div>
<!-- 모임 장소 -->
	<div id="div_5">
		<div id="place">
			<div id="map" style="width:700px; height:450px"></div>
			<!-- <div id="daum_map" style="width:500px;height:400px;"></div> -->
			
		</div>
	</div>
<!-- 모임 공지 -->
	<div id="div_6">
	</div>
<!-- 모임 후기 -->	
	<div id="div_7">
	<div id="comment_read">
		<table width=1000>
			<tr>
				<td rowspan=2 width=15% align=center><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRZGRmCBUbUjzDJluRKbgUSbUsSIY7vl8L3rTGvL9xpgfFfZd3g" width=50 height=50></td>
				<td rowspan=3 width=75%><pre>
가나다라마바사아자카타파하
나들목 나들목 JSP프로젝트 파이팅!!
모임 후기가 이렇게 출력됩니다.				
</pre>			</td>
				<td rowspan=2 align=right valign="bottom" width=10%>2015.11.03.</td>
			</tr>
			<tr>
				<td width=15% align=center></td>
				
			</tr>
			<tr>
				<td width=15% align=center>AAHRAHAH</td>
				
			</tr>
		</table>
		<div class="comment_write">
  <input type="text" class="form-control" placeholder="모임 후기를 남겨주세요.">
  <input type="button" id="comment_writeBtn" value="입력" class="btn02 itemqa_form">
		</div>
	</div>
	</div>
	
	<div id="div_8">
	  


	</div>
	<div id="div_9">
	<div id="memberList">
       <table id="list_head" class="table-condensed">
      <tr height=50>
        <th align=center class="th20">참가자</th>
        <th align=center class="th5">|</th>
        <th align=center class="th35">이메일</th>
        <th align=center class="th5">|</th>
        <th align=center class="th15">언어</th>
        <th align=center class="th5">|</th>
        <th align=center class="th15">성별</th>
      </tr>
      </table>
    <table id="list_body" class="table-condensed">
      <tr>
        <td class="memImg"><img src="http://cfs5.tistory.com/upload_control/download.blog?fhandle=YmxvZzEzNTEyM0BmczUudGlzdG9yeS5jb206L2F0dGFjaC8wLzE1MDAwMDAwMDAxNC5qcGc%3D" width=50 height=50></td>
        <td class="memName">MINSYUUU</td>
        <td class="memEmail">naminsu25@naver.com</td>
        <td class="memLang">한국어</td>
        <td class="memGen">남자</td>
      </tr>
      <tr>
        <td class="memImg"><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRZGRmCBUbUjzDJluRKbgUSbUsSIY7vl8L3rTGvL9xpgfFfZd3g" width=50 height=50></td>
        <td class="memName">AAHRAHAH</td>
        <td class="memEmail">zzoara25@gmail.com</td>
        <td class="memLang">영어</td>
        <td class="memGen">여자</td>
      </tr>
      <tr>
        <td class="memImg"><img src="http://cfile22.uf.tistory.com/image/244737335147CCFE123A66" width=50 height=50></td>
        <td class="memName">JIHYEEE</td>
        <td class="memEmail">jhihye@hanmail.net</td>
        <td class="memLang">한국어</td>
        <td class="memGen">여자</td>
      </tr>
      <tr>
        <td class="memImg"><img src="http://img.mimint.co.kr/bbs/2011/4/12/963820110412211708.jpg" width=50 height=50></td>
        <td class="memName">ZOOSIX</td>
        <td class="memEmail">zoosix@gmail.com</td>
        <td class="memLang">영어</td>
        <td class="memGen">남자</td>
      </tr>
  </table>

</div>
</div>
</div>



</body>
</html>








