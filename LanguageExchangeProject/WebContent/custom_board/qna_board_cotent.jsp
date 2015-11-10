<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
	<center>
		<hr />
		<div class="row">
			<div class="col-md-10">
				<table class="table table-condensed">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%">게시판 제목 입니다.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td>2014-12-15 04:45:23</td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>husk <span style='float: right'>조회 : 0</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>이름, 패스워드 내용을 적으시고 확인버튼을 누르세요.</p>

							</td>
						</tr>
					</tbody>
				</table>
				<table id="commentTable" class="table table-condensed"></table>
				<table class="table table-condensed">
					<tr>
						<td><span class="form-inline" role="form">
								<p><div class="form-group">
									<input type="text" id="commentParentName"
										name="commentParentName" class="form-control col-lg-2"
										data-rule-required="true" placeholder="이름" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password"
										id="commentParentPassword" name="commentParentPassword"
										class="form-control col-lg-2" data-rule-required="true"
										placeholder="패스워드" maxlength="10">
                                        </div>
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
                                    <span style='float:right'>
                                        <button type="button" id="list"
										class="btn btn-default">목록</button>
                                        <button type="button"
										id="modify" class="btn btn-default">수정</button>
                                        <button type="button"
										id="delete" class="btn btn-default">삭제</button>
                                        <button type="button" id="write"
										class="btn btn-default">글쓰기</button>
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