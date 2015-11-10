<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
@charset "utf-8";

aside {
	float: left;
	width: 150px;
	margin: 5px 0;
	padding: 5px;
	border-radius: 5px;
	height: 500px;
	margin-left: 10px;
	margin-top: 38px;
	border-style: dotted;
}

aside nav {
	border: none;
	background: none;
}

aside nav ul {
	list-style: none;
}

aside nav li {
	padding: 0 5px;
}

aside nav ul li a {
	width: 200px;
	padding: 5px 0;
}

aside nav ul li a:hover {
	background-color: transparent;
}

article {
    margin-top: -20px;
	margin: 5px 9px;
	padding: 5px;
	border-radius: 5px;
	font-size: 0.75em;
	padding: 15px;
	float: left;
	width: 1000px;
	padding-left: 0px;
    border-left-width: 1px;
    margin-left: 40px;
    margin-top: 0px;
    padding-top: 10px;
    border:1px solid #d8d8d8;
    margin-top: 10px;
}

article  hgroup {
	padding: 5px;
}

article  hgroup h1, article>hgroup h2 {
	margin: 0;
	padding: 2px 0;
}

article  hgroup h1 {
	font-size: 20px;
}

article  hgroup h2 {
	font-size: 16px;
}

section {
	width: 900px;
	padding: 10px;
	margin: 10px;
	border-radius: 5px;
	word-wrap: break-word;
}

section  h2 {
	font-size: 14px;
	padding: 0 0 10px 0;
	margin: 0;
	color: rgba(255, 0, 0, 1);
}

.groupCard--gradient {
	height: 100%;
	width: 100%;
	position: absolute;
	background-color: transparent;
	background-image: -webkit-linear-gradient(rgba(15, 20, 31, 0) 0,
		rgba(15, 20, 31, .1) 25%, rgba(15, 20, 31, .8) 100%);
	background-image: linear-gradient(rgba(8, 8, 8, 0.51) 0,
		rgba(15, 20, 31, .1) 25%, rgba(15, 20, 31, .8) 100%)
}

#tit {
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
}

#tit1 {
	margin-bottom: 10px;
	letter-spacing: -1px;
	font-size: 1.7em;
	font-family: 다음;
	font-size: medium;
	float: center;
	margin-left: 40px;
	color: hsla(64, 92%, 48%, 0.93);
}

.detail_list {
	font-family: 다음;
	color: white;
}

.sideMenu .menuArea a {
	display: inline-block;
	width: 175px;
	height: 50px;
	padding: 11px 0 0 0;
	background: #8CB2CA url(/images3/main/bulArrow.png) no-repeat 92% 17px;
	border: 1px solid #699BBA;
	border-bottom: 0;
	font-size: 12px;
	font-weight: bold;
	color: #fff;
	vertical-align: top;
}
div#intro {
	background: #8E8E8E;
    height: 50px;
}
div#intro h2 {
    text-shadow: 2px 2px 0 #;
    margin-left: 30px;
    font-family:다음;
    font-size: 30px;
    padding-top: 10px;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<div id="intro"style="margin-top: -10px">
	<h2 style="margin-top:10px;">My Meeting</h2>
	</div>
	<br><br>
	<div id="body">
		<!-- <h2>My Meeting</h2>
		<p>내가 신청한 모임보기.</p> -->
		<table class="table table-bordered" style="margin-top:6%;">
			<thead>
				<tr>
					<th width=10% >No</th>
					<th width=50% >Title</th>
					<th width=20% >party-Date</th>
					<th width=20% >party-status</th>
					<th width=10% >note</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${list}">
				
					<tr>
						<td id="no" width=10% >${d.mu_no }</td>
						<td width=50% align=left><a href="meeting_detail.do?no=${d.m_no }"> ${d.m_title }</a></td>
						<td width=20% >${d.m_partDate }</td>
						<td width=20% >${d.m_end }</td>
						<td width=10% align=center>.</td>
					</tr></c:forEach> 
			</tbody>
		</table>
	
		<!-- 	<footer>
		<div class="footer-content width">
			<div class="clear"></div>
		</div>
	</footer>  -->
	</div>




	<!-- -------------------------------------------------------------------------------------- -->
			
	</div> 
	</div>


</body>
</html>
