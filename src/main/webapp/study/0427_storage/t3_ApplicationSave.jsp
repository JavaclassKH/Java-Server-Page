<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationSave.jsp -->
<%
	request.setCharacterEncoding("UTF-8");	
	response.setContentType("text/html; charset=UTF-8");
	
	String mid = request.getParameter("mid") == null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName") == null ? "손놈" : request.getParameter("nickName");
	String name = request.getParameter("name") == null ? "손놈이름" : request.getParameter("name");
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickName", nickName);
	application.setAttribute("aName", name);
	
	System.out.println("mid : " + mid);
	System.out.println("nickName : " + nickName);
	System.out.println("name : " + name);
%>
	<script>
	'use strict';
	alert("application 생성/저장");
	location.href = "t3_Application.jsp";
	</script>