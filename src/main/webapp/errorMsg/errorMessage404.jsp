<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page isErrorPage="true" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>errorMessage.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h1 class="text-center">Error 404 - Page Not Found</h1>
		<p>해당 페이지는 점검중입니다</p>
		<div><img src="${ctp}/images/getKing.jpg" width="400px" /></div>
		<br/><br/>
		<div><a href="${ctp}/" class="btn btn-light">Back</a></div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>