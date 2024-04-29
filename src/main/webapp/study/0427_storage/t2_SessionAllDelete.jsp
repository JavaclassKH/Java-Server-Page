<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<script>
	'use strict';
	alert("All session delete complite");
	location.href = "t2_session.jsp";
</script>