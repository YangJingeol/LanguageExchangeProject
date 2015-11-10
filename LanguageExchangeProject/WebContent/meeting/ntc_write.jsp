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
<title>공지 작성</title>
<link rel="stylesheet" type="text/css" href="css/div.css"/>
<!-- <style type="text/css">
#input_pw{display: block;}
</style> -->
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		 //전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "iq_ntc",
	        sSkinURI: "se2/SmartEditor2Skin.html", 
	        fCreator: "createSEditor2"
	    });
	    //전송버튼 클릭이벤트
	    $(".btn_submit").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["iq_ntc"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    });
		
	});
</script>
</head>
<body >
<center>
<!-- 상품문의 쓰기 시작 { -->
	<div id="sit_qa_write" class="new_win">
	    <h1 id="win_title">공지사항 쓰기</h1>
	
	    <form name="fitemntc" id="fitemntc" method="post" action="../ntc_write_ok.do" >
			<input type="hidden" name="no" id="no" value=<%=no %>>
			<input type="hidden" name="ntc_id" id="ntc_id" value="${sessionScope.id }">
		    <div class="tbl_frm01 tbl_wrap">
		        <table>
		        <colgroup>
		            <col class="grid_2">
		            <col>
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row"><label for="iq_email">작성자</label></th>
		            <td>${sessionScope.id }</td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_subject">제목<strong class="sound_only"> 필수</strong></label></th>
		            <td><input type="text" name="iq_subject" id="iq_subject" required class="required frm_input" minlength="2" maxlength="250"></td>
		        </tr>
		        <tr>
		            <th scope="row"><label for="iq_ntc">내용</label></th>
		            <td><span class="sound_only">질문 시작</span>
						<textarea id="iq_ntc" name="iq_ntc" required class="required frm_input iq_ntc" maxlength="65536" style="width:100%"></textarea>
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