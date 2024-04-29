<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_sessionDeleteOk.jsp -->
<% 
	String sessionSW = request.getParameter("sessionSW");
	session.removeAttribute(sessionSW);
%>

<script>
	'use strict';
	alert("<%=sessionSW %> 세션 삭제 완료");
	location.href = "t2_session.jsp";
</script>