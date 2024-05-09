<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>delete.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>Here is delete.jsp</h1>
		<br/>
		<div>
			<a href="Test4.do4" class="btn btn-outline-warning"><font color="dark red"><b>돌아가기</b></font></a>
		</div>		
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>