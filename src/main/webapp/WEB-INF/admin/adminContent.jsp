<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>adminContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2> 관리자 전용입니다 </h2>
		<br/><hr/>
		<!-- 
			- 방명록 글 수는 최근 1주일 이내 작성된 글의 개수
			- 신규회원가입건수 출력(1주일 이내)
			- 탈퇴신청회원 건수 출력
		 -->
		<p>방명록 최근 글 : </p>
		<p>게시판 최근 글 : </p>
		<p>신규등록회원 : <a href=""><font color="green">${mCount}</font></a>건</p>
		<p>탈퇴신청회원 : <a href=""><font color="red"><b>${m99Count}</b></font></a>건</p>
	
	</div>
<p><br/></p>
</body>
</html>