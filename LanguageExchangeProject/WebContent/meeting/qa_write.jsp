<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//게시글 번호
    	String no=request.getParameter("no");
    	//System.out.println(no);
	    //세션으로 아이디를 받아와야 된당
	    //글을 쓸 때 아이디에 자동으로 저장해준당
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Q&A 작성</title>
<link rel="stylesheet" type="text/css" href="css/div.css"/>
<!-- <style type="text/css">
#input_pw{display: block;}
</style> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//비밀글 체크박스에 체크하면 텍스트 
		$('.iq_secret').click(function(){
			if($("input:checkbox[name='iq_secret']").is(":checked"))
			{
				//input 이나 css
				$('#iq_secret_txt').css("display","");
				return;
			}
			if(!$("input:checkbox[name='iq_secret']").is(":checked"))
			{
				$('#iq_secret_txt').css("display","none");
				$('#iq_secret_txt').val("");
				return;
			}
		});
		//답변 버튼을 누르면 insert되게
		/* $('.btn_submit').click(function(){
		var a=$('#no').val();
		alert(a);
		$('#fitemqa').submit();
	}); */
		
	});
</script>
</head>
<body >
<center>
<!-- 상품문의 쓰기 시작 { -->
	<div id="sit_qa_write" class="new_win">
	    <h1 id="win_title">수강문의 쓰기</h1>
	
	    <form name="fitemqa" id="fitemqa" method="post" action="../qa_write_ok.do" >
			<input type="hidden" name="no" id="no" value=<%=no %>>
			<input type="hidden" name="qa_id" id="qa_id" value="${sessionScope.id }">
		    <div class="tbl_frm01 tbl_wrap">
		        <table>
		        <colgroup>
		            <col class="grid_2">
		            <col>
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row" width="15%">옵션</th>
		            <td id="input_pwtxt" height="">
		                <input type="checkbox" class="iq_secret" id="iq_secret" name="iq_secret" value="Y">
		                <label for="iq_secret">비밀글</label>
		                <input type="text" size="20" name="iq_secret_txt" id="iq_secret_txt" class="frm_input" style="display: none">
		            </td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_email">작성자</label></th>
		            <td>${sessionScope.id }</td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_subject">제목<strong class="sound_only"> 필수</strong></label></th>
		            <td><input type="text" name="iq_subject" id="iq_subject" required class="required frm_input" minlength="2" maxlength="250"></td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_question">질문</label></th>
		            <td><span class="sound_only">질문 시작</span>
						<textarea id="iq_question" name="iq_question" required class="required frm_input" maxlength="65536" style="width:100%"></textarea>
						<span class="sound_only">질문 끝</span>
					</td>
		        </tr>
		        </tbody>
		        </table>
		    </div>
		
		    <div class="win_btn">
		        <input type="submit" value="작성완료" class="btn_submit">
		        <button type="button" onclick="self.close();">닫기</button>
		    </div>
	    </form>
	</div>

</center>
</body>
</html>