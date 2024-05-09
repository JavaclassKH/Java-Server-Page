<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationCheck.jsp -->
<%
	response.setContentType("text/html; charset=UTF-8");
	
	String applicationName = "";
	String applicationName_ = "";
	String applicationValue = "";
		
	String mid = (String)application.getAttribute("aMid");
	String nickName = (String)application.getAttribute("aNickName");
	String name = (String)application.getAttribute("aName");
	
	pageContext.setAttribute("Mid",mid);
	pageContext.setAttribute("NickName",nickName);
	pageContext.setAttribute("Name",name);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t3_ApplicationCheck</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>Application값 출력</h1>
		<p>아뒤 : ${aMid}</p>
		<p>닉넴 : ${aNickName}</p>
		<p>이름 : ${aName}</p>
		<p><a href="t3_Application.jsp">return</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>