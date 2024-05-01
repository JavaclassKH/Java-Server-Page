<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl3.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>JSTL 반복문 응용연습(+VO)</h1>
		<div class="text-right mt-2 mb-2">
			<button type="button" onclick="location.href='jstl1.jsp'" class="btn btn-outline-success btn-sm">JSTL Core라이브러리</button>
			<button type="button" onclick="location.href='jstl2.jsp'" class="btn btn-outline-primary btn-sm">JSTL반복문</button>
		  <button type="button" onclick="location.href='jstl4_function.jsp'" class="btn btn-outline-info btn-sm">JSTL Function</button>
			<button type="button" onclick="location.href='jstl5_format.jsp'" class="btn btn-outline-secondary btn-sm">JSTL Formatting</button>		
		</div>
		<hr/>
		<h2>회원자료 출력하기</h2>
		<div> 요청된 리소스 
			<form name="myform" method="post" action="${ctp}/j0429/Jstl3Ok">
				<input type="submit" value="회원리스트" class="btn btn-success"/>	
			</form>
		</div>
		
		
		
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>