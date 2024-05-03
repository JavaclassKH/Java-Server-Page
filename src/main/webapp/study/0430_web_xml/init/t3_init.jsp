<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t3_init.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>이곳은 init(Servlet)에서 보낸 값을 찍어봅니다</h1>
		<p>
			회사명 : ${sLogoName} <br/>
			홈페이지 주소 : <a href="${sHomeAddress}" class="btn btn-link">${sHomeAddress}</a>		
		</p>
			<hr/>
			<p><a href="${ctp}/j0430/T03_init" class="btn btn-outline-primary btn-lg mt-2 mb-1">컨트롤러산책</a></p>
			<p><a href="${ctp}/j0430/T03_sessionOut" class="btn btn-outline-warning btn-lg mt-1">세션끊기</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>