<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	'use strict';
  	
  	function fCheck(){
  		let name = myform.name;
  		let age = document.getElementById("age");
  		
  		if(name.value.trim() == ""){
  			alert("이름없음");
  			myform.name.focus();
  			return false;
  		}
  		else if(age.value.trim() == "" || age < 1 || age > 99){
  			alert("나이없음");
  			document.getElementById("age").focus();
  			return false;
  		}
  		else {
  			myform.submit(); // submit은 form태그에 action을 따라감
  		}
  	}
  	
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값 전송연습 2</h2>
		<form name="myform" method="post" action="t02Ok.jsp">
		<!-- <form name="myform" method="get" action="t02Ok.jsp"> -->
			<div> 성 명
				<input type="text" name="name" value="설윤아" class="form-control mb-4" autofocus required />
			</div>
			<div> 나 이 
				<input type="number" name="age" id="age" value="21" min="1" max="99" class="form-control mb-4" required /> 
			</div>
			<div>  
				<input type="submit" value="바로전송" class="btn btn-light mr-3" /> 
				<input type="button" value="체크후전송" onclick="fCheck()" class="btn btn-info" /> 
			</div>
			<input type="hidden" name="user" value="admin" />
		</form>
	</div>
<p><br/></p>
</body>
</html>