<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>p1.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  	.myform {
  		line-height = "3px";
  		margin-top = "5px";
  	}
  </style>
</head>
<body>
<p><br/></p>
	<div class="container">
		<form class="myform">
			<p> 성
				<input type="text" name="lastName" placeholder="성을 입력하세요" autofocus /> 
			</p>
			<p> 이름 
				<input type="text" name="firstName" placeholder="이름을 입력하세요" /> 
			</p>
			<p> 성별 
				<input type="text" name="gender" placeholder="성별을 입력하세요" /> 
			</p>		
			<p> 나이 
				<input type="number" name="age" min="1" max="99" /> 
			</p>		
			<div><input type="submit" onclick="location.href='/javaclass/study.j0424/P1'" class="btn btn-primary mt-2 center" /></div>
		</form>
	</div>
<p><br/></p>
</body>
</html>