<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result=='ok' }">
        <script>
			alert("찜성공");
	         history.back();
		</script>
</c:if>

<c:if test="${result=='no' }">

       <script>
  			alert("찜취소");
  			history.back();
  		</script>		

</c:if>


<c:if test="${result=='noid' }">
        <script>
			alert("로그인이 필요합니다");
			history.back();
		</script>
</c:if>