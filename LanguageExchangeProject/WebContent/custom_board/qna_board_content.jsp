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
	<h2 style="margin-top:10px;">QNA</h2>
</div>
		<center>
		<hr />
		<div class="row">
			<div class="col-md-10">
				<table class="table table-condensed">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%">${list.q_title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td>${list.db_qday}</td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${list.q_mail}
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>${list.q_content}</p>

							</td>
						</tr>
					</tbody>
				</table>
				<table id="commentTable" class="table table-condensed"></table>
				<table class="table table-condensed">
					<tr>
						<td><span class="form-inline" role="form">
								<p>
                                        <div class="form-group">
                                            <button type="button"
										id="commentParentSubmit" name="commentParentSubmit"
										class="btn btn-default">확인</button>
                                        </div>
                                    </p>
								
                                        <textarea id="commentParentText"
									class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                   <style type="text/css"> a.btnh:HOVER{  text-decoration: none; !important;}
                    a.btnh:focus{  text-decoration: none; !important;} </style> 
                                    <span style='float:right'>
                                        <button type="button" id="list"
										class="btn btn-default" onclick="javascript:history.back()">목록</button>
                                        <button type="button"
										id="modify" class="btn btn-default"><a href="#" class="btnh"style="color:black;">수정</a></button>
                                        <button type="button"
										id="delete" class="btn btn-default"><a href="#" class="btnh" style="color:black;">삭제</a></button>
                                        <button type="button" id="write"
										class="btn btn-default"><a href="qna_insert.do" class="btnh" style="color:black;">글쓰기</a></button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <hr />
         </center>


    </body>
</html>