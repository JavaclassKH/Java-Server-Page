<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	MemberVO vo = new MemberVO();
	vo.setMid("sona123");
	pageContext.setAttribute("vo", vo);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>error.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
	<h1>ERROR 페이지 연습</h1>
	<hr/>
	<div>
		<a href="ErrorJSP.st" class="btn btn-success">JSP error</a>
		<a href="Error400.st?vo=${vo}" class="btn btn-info">400 Server Error(처리불가)</a>
		<a href="Error404.st" class="btn btn-primary">404 Not Found</a>
		<a href="Error500.st" class="btn btn-light">500 Internal Server Error</a>
	</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>