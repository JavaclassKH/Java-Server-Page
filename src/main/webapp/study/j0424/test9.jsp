<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test9.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>서블릿 파일 호출하기</h2>
		<p>Get방식! <a href="/javaclass/Test9">Test9서블릿 호출</a></p>
	</div>
	<div>
		<form name="myform" method="post" action="/javaclass/Test9">			
			<input type="submit" value="전송" class="btn btn-success" />
			<input type="button" value="새로고침" onclick="location.reload()" class="btn btn-info" />	
		</form>
	</div>
<p><br/></p>
</body>
</html>