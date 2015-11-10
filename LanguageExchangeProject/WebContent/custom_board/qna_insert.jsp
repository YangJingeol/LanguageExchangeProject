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
<script type="text/javascript">
$(function(){
	$('#q_title').focus();
	$('#btnSub').click(function(){
		var tit=$('#q_title').val();
	    if(tit==""){
	    	$('q_title').focus();
	    	return;
	    }
		var cont=$('#q_content').val();
	    if(cont==""){
	    	$('#q_content').focus();
	    	return;
	    }
	    
	    $('#qwriteForm').submit();
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
	<h2 style="margin-top:10px;">QNA</h2>
</div>
	<div id="body">
		<p>Ask an Organizer</p>
		</div>
		<br><br><br>
<center>
<!-- 등록/수정 뷰 -->
<div class="board_view">
    <form id="qwriteForm" name="qwriteform" action="qna_insert_ok.do" method="post">
	<table boarder=1 width=940>
		<colgroup>
			<col width="20%" />
			<col width="*" />															
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="Q_title" id="q_title" style="width:500px;" placeholder="제목을 입력하세요" />&nbsp;&nbsp;
				<em><input type="checkbox" name="Q_pwd" value="y"  checked />비밀글</em></td>
			</tr>
										
		<tr>
			<th scope="row">내용</th>
			<td class="padding"><textarea name="Q_content" id="q_content" rows="10" cols="90" style="width:650px; height:250px;">
			</textarea></td>
			</tr>
		</tbody>		
	</table>	
		
	<!-- button -->
	   <p class="btnSubmit">
    <input type=button id="btnSub" value=등록>
    <input type=button id="btnCancel" value=취소 onclick="javascript:history.back()">
    </p>
	</form>
</div>
</center>
</body>
</html>
</html>