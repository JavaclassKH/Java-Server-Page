<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String mid = request.getParameter("mid");
	String loginFlag = request.getParameter("loginFlag");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t14Main.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	
  	if('${loginFlag}' != 'OK') {
  		alert("로그인 후 입장해주세요ㅗ");
  		location.href='<%= request.getContentType()%>/study/j0425/t14forward.jsp';
  	}
  		
  
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h1>회원전용 페이지</h1>
		<br/>
		<hr/>
		<p>${mid} 님 현재 로그인중입니다</p>
		<hr/>
		<p><a href="kavascript:logout()" class="btn btn-warning"></a></p>
	</div>
<p><br/></p>
</body>
</html>