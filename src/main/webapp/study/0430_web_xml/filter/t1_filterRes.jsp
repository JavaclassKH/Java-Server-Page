<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t1_filterRessert</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>여기는 t1_filterRes입니다</h2>
		<div>
			<span class="mt-3 mb-3">메세지: ${msg}</span><br/><br/>
			<span class="mt-3 mb-3">메세지: ${msg}</span>
		</div>
		<div><a href="${ctp}/study/0430_web_xml/filter/t1_filter.jsp" class="btn btn-outline-danger">Back</a></div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>