<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setAttribute("sCnt", 0);

%>
<script>
	'use strict';
	alert("session 초기화 완료");
	location.href = "t4_StorageTest.jsp";
</script>