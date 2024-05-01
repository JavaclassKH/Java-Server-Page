<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t1_filter.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		let flag = "";
		function fCheck(flag) {
			if(flag == 'OK') myform.action ="${ctp}/j0430/T01Ok";
			else myform.action ="";
			myform.submit();
		}
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>한글처리 연습</h2>
		<form name="myform" method="post">
			<div><input type="text" name="content" value="간단소개" class="form-control" autofocus /></div>
			<div><textarea rows="5" name="introduce" value="간단" placeholder="사이트 소개" class="form-control"></textarea></div>
			<div><input type="button" value="전송1" onclick="fCheck('OK')" class="btn btn-outline-success form-control"/></div>
			<div><input type="button" value="전송2" onclick="fCheck('NO')" class="btn btn-outline-primary form-control"/></div>
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>