<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="meeting/js/ajax.js"></script>	
<script>
	$(function(){
		$('.cmtDel').click(function(){
			var cmtno=$(this).siblings('#cmtno').attr("value");
			alert(cmtno);
			var param="cm_no="+cmtno;
        	alert(param);
        	sendMessage("GET", "cmtdel_ok.do", param, cmtdel_ok);
		});
	});
	function cmtdel_ok()
    {
  	  if(httpRequest.readyState==4)
      	{
      		if(httpRequest.status==200)
      		{
      			alert("comment가 삭제되었습니다.");
      			$('.comment_read').html(httpRequest.responseText);
      		}
      	}
    }
</script>
<table class="commentlist" width=100%>
<c:forEach var="c" items="${clist }">
         <tr>
            <td rowspan=2 width=15% align=center><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRZGRmCBUbUjzDJluRKbgUSbUsSIY7vl8L3rTGvL9xpgfFfZd3g" width=50 height=50></td>
            <td rowspan=3 width=70%><pre>${c.cmt }</pre></td>
            <td rowspan=2 align=right valign="bottom" width=15%>${c.regdate }&nbsp;&nbsp;
            <c:choose>
            	<c:when test="${sessionScope.id==c.id || sessionScope.admin=='Y' }">
            		<a class="cmtDel" id="cmtDel"><b>X</b></a>
            		<input type="hidden" class="cmtno" id="cmtno" value="${c.no }">
            	</c:when>
            	<c:when test="${sessionScope.id!=c.id || sessionScope.admin=='N'}">
            		<b>X</b>
            	</c:when>
            </c:choose>
            </td>
         </tr>
         <tr>
            <td width=15% align=center></td>
         </tr>
         <tr>
            <td width=15% align=center>${c.id }</td>
         </tr>
</c:forEach>
</table>