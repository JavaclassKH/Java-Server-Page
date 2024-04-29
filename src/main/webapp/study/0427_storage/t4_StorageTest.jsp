<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int aCnt = application.getAttribute("aCnt") == null ? 0 : (int)application.getAttribute("aCnt");
	int sCnt = session.getAttribute("sCnt") == null ? 0 : (int)session.getAttribute("sCnt");
	
	aCnt++;
	sCnt++;
	
	application.setAttribute("aCnt",aCnt);
	session.setAttribute("sCnt",sCnt);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t4_StorageTest.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>방문자 카운트 비교</h1>
		<hr/>
		<hr/>
		<p><font color="red">어플리케이션 카운트 : ${aCnt}</font></p>
		<hr/>
		<p>세션 카운트 : ${sCnt} </p>
		<hr/>
		<p>
			<a href="t4_ApplicationClear.jsp" class="btn btn-outline-success btn-lg mt-4 mr-5">어플리케이션 카운트 초기화</a>
			<a href="t4_SessionClear.jsp" class="btn btn-outline-light btn-lg mt-4 mr-5">세션 카운트 초기화</a>
			<a href="javascript:location.reload()" class="btn btn-outline-info btn-lg mt-4">방문수 증가</a>
			<a href="javascript:location.reload()" class="btn btn-outline-info btn-lg mt-4">방문수 증가</a>
		</p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>