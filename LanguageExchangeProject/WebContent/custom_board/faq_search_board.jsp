<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
@charset "utf-8";
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

.sideMenu .menuArea a {
    display: inline-block;
    width:175px;
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
<meta charset="utf-8">
<title>레이아웃3</title>
<link href="layout3.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/index.css?20151020" />
<!-- 템플릿 CSS -->
<link rel="stylesheet" href="../css/main/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/main/styles.css" type="text/css" />
<link rel="stylesheet" href="../css/main/meetingStyle.css" type="text/css" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
	$(document).ready(function() {
		$(".pan").hide();
		$(".flip").click(function() {
			var fno = $(this).attr('value');
			$("#panel" + fno).slideToggle("fast");
			$("#panel" + fno).focus();
		});
	});
	
	$(function(){
		$('#searchBtn').click(function(){
			var word=$('#word').val();
			if(word=="")
			{
				alert("검색어를 입력해 주세요");
				return;
			}
			$('#searchFrm').submit();
		});
	});


</script>
<style type="text/css">
.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}
</style>
</head>
<body> 
<div id="intro"style="margin-top: -10px">
	<h2 style="margin-top:10px;">FAQ</h2>
</div>
	<div id="body">
		<p>자주묻는 질문</p>
		<div class="col-lg-6" style="margin-left:71%;">
				<div class="input-group" style="width:55%;">
				<form method="get" id="searchFrm" action="f_search.do">
					<input type="text" class="form-control" placeholder="Search for..." id=word name=word>
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"  id=searchBtn><span class="glyphicon glyphicon-search" style="height:21px ;"></span></button>
					</span>
			    </form>
 		</div> 
		</div> 
		<table class="table table-bordered" style="margin-top: 6%;">
		
		
		<c:if test="${sessionScope.admin=='y' }">
	<ul class="pagination" height=35px;><li><a href="faq_insert.do">등록</a></li></ul>
         </c:if> 
		
		
		
			<thead>
				<tr>
					<th>No</th>
					<th>Title</th>
					<th>Date</th>
					<th>Writer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${list}">
					<tr>
						<td width="5%">${d.f_rownum}</td>
						<td><a href="#" style="text-decoration: none;" class="flip"
							value='${d.f_no}'>${d.f_title }</a></td>
						<td width="20%">${d.db_fday }</td>
						<td width="5%">admin</td>
					</tr>
					<tr id="panel${d.f_no}" height="100px" class="pan">
						<td colspan="4" align="center"><pre>${d.f_content }</pre>
						<c:if test="${sessionScope.admin=='y' }">         
						<hr border=1>
						<a href="#">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">삭제</a></td>
						</c:if> 
					</tr>

				</c:forEach>
			</tbody>
		</table>
					<center>
			 <nav1>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${totalpage }" step="1">
				<li><a href="faq.do?page=${i }">${i }</a></li>
				</c:forEach>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			</ul>
			</nav1> 
		</center>
	</div>
</body>
</html>
