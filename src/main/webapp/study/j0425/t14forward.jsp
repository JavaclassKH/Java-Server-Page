<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t14forword.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	if('${loginFlag}' == 'NO') alert("로그인 정보를 확인해주세요");
  	else alert("로그인 되었습니다"); 
  	
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>Forward를 통한 값의 전달방법</h2>
		<hr/>
		<pre>
			<font color="red">HTTP프로토콜</font>
		</pre>
		<hr/>
		<form name="myform" method="post"
			action="<%=request.getContextPath()%>/j0425/T14Ok1">
			<div>
				아이디 : 
				<input type="text" name="mid" value="admin" class="form-control mb-4" autofocus required />
			</div>
			<div>
				비밀번호 : 
				<input type="password" name="pwd" value="1234"class="form-control mb-4" required />
			</div>
			<div>
				보안키 : 
				<input type="password" name="secureKey" class="form-control mb-4" required />
			</div>
			<div>
				<input type="submit" value="로그인" class="btn btn-light mt-2 mr-3" /> 
				<input type="reset" value="다시입력" class="btn btn-primary mt-2 mr-3" /> 
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>