<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");	
	String sessionLastTime = sdf.format(session.getLastAccessedTime());
	System.out.println("세션 마지막 접속 시간 : " + sessionLastTime);
/* 	HttpServletRequest sc = session.setAttribute("sessionLastTime", sessionLastTime); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>세션 마지막 접속시간 확인하기</h1>
		<div>
			<p>세션 마지막 접속 시간 : <%= sessionLastTime%></p>
		</div>
		
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>