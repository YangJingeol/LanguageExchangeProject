<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result=='NOPWD' }">
NO
</c:if>
<c:if test="${result=='OK' }">
<strong>문의내용</strong><br>
<pre>${qa_cont }</pre>
</c:if>
<c:if test="${result=='ANS_OK' }">
<strong>문의내용</strong><br>
<pre>${qa_cont }</pre>

<strong>답변내용</strong><br>
<pre>${ans_cont }</pre>
</c:if>

