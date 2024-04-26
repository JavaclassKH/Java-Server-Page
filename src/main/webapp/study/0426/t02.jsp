<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String hostIP = request.getRemoteAddr(); // 접속자의 호스트IP를 가져옴
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02.jsp</title>
  <%@ include file= "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>성적계산기</h2> 
		<hr/>
		<div class="row">
			<div><a href="t02_3.jsp" class="btn btn-outline-success btn-lg ml-5 mr-4">NO.1(Servlet)</a></div>
			<div><a href="t02_2.jsp" class="btn btn-outline-primary btn-lg ml-2 mr-4">NO.2(JSP)</a></div>
			<div><a href="t02_1.jsp" class="btn btn-outline-secondary btn-lg ml-2">NO.3(JSP)</a></div>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>