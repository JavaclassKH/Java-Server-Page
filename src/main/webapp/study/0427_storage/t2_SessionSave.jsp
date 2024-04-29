<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("UTF-8");	
	response.setContentType("text/html; charset=UTF-8");
	
	String mid = request.getParameter("mid") == null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName") == null ? "손놈" : request.getParameter("nickName");
	String name = request.getParameter("name") == null ? "손놈이름" : request.getParameter("name");
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
	
	System.out.println("mid : " + mid);
	System.out.println("nickName : " + nickName);
	System.out.println("name : " + name);
	
%>
	<script>
	'use strict';
	alert("세션 생성/저장");
	location.href = "t2_session.jsp";
	</script>