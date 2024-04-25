<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t05Main.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	'use strict;'
  	
  	function logoutCheck() {
			let ans = confirm("로그아웃 하시겠습니까?");
  		if(ans) {
  			alert('<%=mid %>님 로그아웃 되었습니다');
  			location.href = 't05.jsp';
  		}
  		else {
  			alert("로그아웃을 취소하였습니다");
  			for(let i=0; i<=4; i++) {
  				show.innerHTML = "즐거운 시간 되세요!<br/>";
  			}
  		}
		}
  	
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
	<h2>회원전용 페이지</h2>
	<hr/>
	<div id="show"></div>
	<p>
		'<%=mid %>' 회원님 현재 로그인중입니다.
	</p>
	<hr/>
	<p>   <!--  -->
		<a href="javascript:logoutCheck()" class="btn btn-secondary">logout</a>
	</p>
	</div>
<p><br/></p>
</body>
</html>














