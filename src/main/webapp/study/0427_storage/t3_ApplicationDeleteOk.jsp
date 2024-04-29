<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationDeleteOk.jsp -->
<% 
	String applicationSW = request.getParameter("applicationSW");
	application.removeAttribute(applicationSW);
	System.out.println(applicationSW);
%>

<script>
	'use strict';
	alert("<%=applicationSW %> Application 삭제 완료");
	location.href = "t3_Application.jsp";
</script>