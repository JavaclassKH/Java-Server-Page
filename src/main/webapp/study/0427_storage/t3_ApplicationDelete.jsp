<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t3_applicationDeleteOk.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function applicationDelete() {
			let applicationSW = document.getElementById.value("applicationSW");
			
			if(applicationSW == ""){
				alert("삭제할 값을 선택하세요");
				return;
			}
				location.href = "t3_ApplicationDeleteOk.jsp?applicationSW="+applicationSW;
		}	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>application 삭제하기</h1>
		<form class="myform">
			<select name="applicationSW" id="applicationSW" onclick="applicationDelete()">
				<option value="">선택</option>
				<option value="aMid">아이디</option>
				<option value="aNickName">닉네임</option>
				<option value="aName">이름</option>
			</select>
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>