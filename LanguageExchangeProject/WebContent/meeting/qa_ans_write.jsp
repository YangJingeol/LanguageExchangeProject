<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    	//게시글 번호
    	String qa_no=request.getParameter("qa_no");
    	//System.out.println(no);
	    //세션으로 아이디를 받아와야 된당
	    //글을 쓸 때 아이디에 자동으로 저장해준당
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>답변 작성</title>
<link rel="stylesheet" type="text/css" href="meeting/css/div.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body >
<center>
<!-- 상품문의 쓰기 시작 { -->
	<div id="sit_qa_write" class="new_win">
	    <h1 id="win_title">답변 작성</h1>
	    <div class="tbl_frm01 tbl_wrap">
	    	<table class="answer_sheet">
		        <colgroup>
		            <col class="grid_2">
		            <col>
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row" width="15%">옵션</th>
		            <td id="input_pwtxt" height="">
		                ${qa_d.secret=="Y"?"비밀글":"공개글" }
		            </td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_email">작성자</label></th>
		            <td>${qa_d.q_id }</td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_subject">제목<strong class="sound_only"> 필수</strong></label></th>
		            <td>${qa_d.subject }</td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_question">질문</label></th>
		            <td><span class="sound_only">질문 시작</span>
						<pre>${qa_d.cont }</pre>
						<span class="sound_only">질문 끝</span>
					</td>
		        </tr>
		        </tbody>
		   </table>
	    </div>
	    <form name="fitemqa" id="fitemqa" method="post" action="qa_ans_ok.do" >
			<input type="hidden" name="qa_no" id="qa_no" value=<%=qa_no %>>
			<input type="hidden" name="qa_id" id="qa_id" value="${sessionScope.id }">
		    <div class="tbl_frm01 tbl_wrap">
		        <table>
		        <colgroup>
		            <col class="grid_2">
		            <col>
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row" width="15%"><label for="iq_ans">답변 작성자</label></th>
		            <td>${sessionScope.id }</td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_answer">답변</label></th>
		            <td><span class="sound_only">답변 시작</span>
						<textarea id="iq_answer" name="iq_answer" required class="required frm_input" maxlength="65536" style="width:100%"></textarea>
						<span class="sound_only">답변 끝</span>
					</td>
		        </tr>
		        </tbody>
		        </table>
		    </div>
		    <div class="win_btn">
		        <input type="submit" value="답변작성완료" class="btn_submit">
		        <button type="button" onclick="self.close();">닫기</button>
		    </div>
	    </form>
	</div>

</center>
</body>
</html>