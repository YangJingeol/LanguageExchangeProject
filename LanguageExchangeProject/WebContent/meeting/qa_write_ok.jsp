<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
		alert("Q&A가 등록되었습니다.");
		self.close();
		var  scrollTop =  opener.parent.window.document.body.scrollTop; 
		opener.parent.location.reload(); 
		opener.parent.window.document.body.scrollTop = scrollTop;
</script>
