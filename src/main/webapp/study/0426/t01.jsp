<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String hostIP = request.getRemoteAddr(); // 접속자의 호스트IP를 가져옴
/* 	request.setAttribute("hostIP", hostIP); */
	pageContext.setAttribute("hostIP", hostIP);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t01.jsp</title>
  <%@ include file= "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>서버의 환경변수값 확인 페이지</h2>
		<hr/>
		<div>호스트의 IP1 : ${hostIP}</div>
		<div>호스트의 IP2 : <%=hostIP %></div>
		<div>전송방식 : <%=request.getMethod() %></div>
		<div>접속프로토콜 : <%=request.getProtocol() %></div>
		<div>접속(서버)포트 : <%=request.getServerPort() %></div>
		<div>접속(서버)이름 : <%=request.getServerName() %></div>
		<div>접속 Context이름 : <%=request.getContextPath() %></div>
		<div>접속URL : <%=request.getRequestURL() %></div>
		<div>접속URI : <%=request.getRequestURI() %></div>  <!-- URI : 식별자! -->
		<div>접속세션 : <%=request.getSession() %></div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>