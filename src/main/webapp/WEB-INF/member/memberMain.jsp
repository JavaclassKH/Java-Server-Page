<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1><b>인증회원 전용 메인 로비, 환영합니다!</b></h1>
		<br/><hr/>
		<!-- 실시간 비밀채팅 만들기 -->
		<br/><hr/>
		<div>
			<p>현재 <font color="navy"><b>${sNickName}</b></font>님이 로그인 중입니다.</p>
			<p>총 방문횟수 : ___ 회</p>
			<p>오늘 방문횟수 : ___ 회</p>
			<p>보유 포인트 : ___ p</p>
		</div>
		<hr/>
		<div>
			<h4><b>활동내역</b></h4>
			<p>방명록 등록 글 수 : __개</p>
			<p>게시판 등록 글 수 : __개</p>
			<p>자료실 등록 글 수 : __개</p>
			
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>

<!-- <div class="table">
			<table class="table table-hover table-dark">
			 
			</table>
		</div> -->

















