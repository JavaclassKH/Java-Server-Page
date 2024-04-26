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
	<title>t13_서버값전달이동.jsp</title>
	<link rel="shortcut icon" href="#">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	function javascriptLogin() {
  		myform.loginFlag.value = "javascript";
  		myform.submit();
  	}
  	
  	function ResponseLogin() {
  		myform.loginFlag.value = "Response";
  		myform.submit();
  	}
  	
  	function RequestLogin() {
  		myform.loginFlag.value = "Request";
  		myform.submit();
  	}
  	
  	
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>서버에서의 값 전송연습</h2>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/j0425/T13Ok">
			<div> 아이디 :
				<input type="text" name="mid" value="admin" class="form-control mb-4" autofocus required /> 		
			</div>
			<div> 비밀번호 : 
			 <input type="password" name="pwd" placeholder="1234" class="form-control mb-4" required /> 
			</div>
			<div>  
				<input type="button" value="Javascript로그인" onclick="javascriptLogin()" class="btn btn-light mt-2 mr-3" /> 
				<input type="button" value="Response로그인" onclick="ResponseLogin()" class="btn btn-primary mt-2 mr-3" /> 
				<input type="button" value="Request로그인" onclick="RequestLogin()" class="btn btn-info mt-2" /> 
			</div>
			<input type="hidden" name="loginFlag" />
		</form>
	</div>
<p><br/></p>
</body>
</html>