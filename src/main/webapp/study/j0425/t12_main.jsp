<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t12_main.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	alert("${vo.name}님! 회원가입이 완료되었습니다♥");
  	
  	function logout() {
  		alert("${vo.name}님 로그아웃 되었습니다");
  		location.href = "t12_form.jsp";
		} 	
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>Member Information</h2>
		<hr/>
		<p>이름 : ${vo.name}</p>
		<p>나이 : ${vo.age}</p>
		<p>성별 : ${vo.gender}</p>
		<p>취미 : ${vo.hobby}</p>
		<p>직업 : ${vo.job}</p>
		<p>감빵 : ${vo.bbang}</p>
		<p>소개 : ${vo.content}</p>
		<p>파일 : ${vo.filename}</p>
		<hr/>
		<hr/>
		<p>
			<input type="button" value="logout" onclick="logout()" class="btn btn-danger" >
		</p>
	</div>
<p><br/></p>
</body>
</html>