<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid") == null ? "관리자" : request.getParameter("mid");
	String msgFlag = request.getParameter("msgFlag");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t10_main.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	'use strict;'

  	if(!'<%=msgFlag %>' == 'no') {
  		alert("[<%=mid%>]님의 방문을 환영합니다!");
  	}
  	
  	function logoutCheck() {
			let ans = confirm("로그아웃 하시겠습니까?");
  		if(ans) {
  			alert('<%=mid %>님 로그아웃 되었습니다');
  			location.href = '<%=request.getContextPath() %>/study/j0425/t11_login.jsp';
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
		<div>
			<a href="javascript:logoutCheck()" class="btn btn-secondary">logout</a>
		</div>
	</div>
<p><br/></p>
</body>
</html>














