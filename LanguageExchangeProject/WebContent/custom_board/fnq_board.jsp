<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 템플릿 CSS -->
<link rel="stylesheet" href="css/main/reset.css" type="text/css" />
<link rel="stylesheet" href="css/main/styles.css" type="text/css" />
<link rel="stylesheet" href="css/main/meetingStyle.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".pan").hide();
		$(".flip").click(function() {
			var fno = $(this).attr('value');
			$("#panel" + fno).slideToggle("fast");
			$("#panel" + fno).focus();
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
	<div id="body">
		<h2>Notice</h2>
		<p>나들목에 관한 소식을 알려 드립니다.</p>
		<div class="input-group stylish-input-group" style="width: 20%;margin-left:80%;top:50px;">
			<input type="text" class="form-control" placeholder="Search">
			<span class="input-group-addon">
				<button type="submit">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</span>
		</div>
		<table class="table table-bordered" style="margin-top: 6%;">
			<thead>
				<tr>
					<th>No</th>
					<th>Title</th>
					<th>Date</th>
					<th>Hit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${list}">
					<tr>
						<td width="5%">${d.n_No}</td>
						<td><a href="#" style="text-decoration: none;" class="flip"
							value='${d.n_No}'>연습하고 있습니다.</a></td>
						<td width="20%">${d.n_Regdate }</td>
						<td width="5%">${d.n_Hit }</td>
					</tr>
					<tr id="panel${d.n_No}" height="100px" class="pan">
						<td colspan="4" align="center">올랄라</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
			<ul class="pagination" style="margin-left: 43%;">
				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
	</div>
</body>
</html>
