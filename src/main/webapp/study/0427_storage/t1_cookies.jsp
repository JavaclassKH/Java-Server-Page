<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h1>쿠키연습 메인</h1>
		<hr/>
		<div class="row">
			<div><a href="t1_CookiesSave.jsp" class="btn btn-outline-success btn-sm mr-4">쿠키저장</a></div>
			<div><a href="t1_CookiesCheck.jsp" class="btn btn-outline-success btn-sm mr-4">쿠키확인</a></div>
			<div><a href="t1_CookiesAllDelete.jsp" class="btn btn-outline-success btn-sm">쿠키전체삭제</a></div>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>