<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t01.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값 전송연습 2</h2>
		<form name="myform" method="post" action="t01Ok.jsp">
			<div> 성 명
				<input type="text" name="name" value="설윤아" class="form-control mb-4" autofocus >
			</div>
			<div> 나 이 
				<input type="number" name="age" min="1" max="99" class="form-control mb-4" > 
			</div>
			<div>  
				<input type="submit" value="전송" class="btn btn-light" /> 
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>