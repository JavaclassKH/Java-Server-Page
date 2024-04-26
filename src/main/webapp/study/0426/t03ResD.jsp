<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	pageContext.setAttribute("mid" , mid);
	pageContext.setAttribute("pwd" , pwd);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t03.Res.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="mt-10">도박장설계과 페이지</h1>
		<p>아이디 : ${mid}</p>
		<p>비밀번호 : ${pwd}</p>
		<hr/>
		<p><a href="t03.jsp" class="btn btn-outline-secondary btn-lg">돌아가기</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>