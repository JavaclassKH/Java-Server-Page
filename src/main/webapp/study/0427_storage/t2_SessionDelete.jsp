<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function sessionDelete() {
			let sessionSW = document.getElementById.value("sessionSW");
			
			if(sessionSW == ""){
				alert("삭제할 값을 선택하세요");
				return;
			}
			location.href = "t2_sessionDeleteOk.jsp?sessionSW="+sessionSW;
		}
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>세션 삭제하기</h1>
		<form class="myform">
			<select name="sessionSW" id="sessionSW" onclick="sessionDelete()">
				<option value="">선택</option>
				<option value="sMid">아이디</option>
				<option value="sNickName">닉네임</option>
				<option value="sName">이름</option>
			</select>
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>