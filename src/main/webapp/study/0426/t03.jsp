<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t03.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>Member Login</h2>
		<p><span style="fontcolor='red';">부서명 : 살인청부과(K) , 사기설계과(S) , 특수폭행과(T) , 도박장건설과(D)</span></p>
		<form name="myform" method="post" action="t03Ok.jsp">
			<div> 아이디 :
				<input type="text" name="mid" value="admin" class="form-control mb-4" autofocus required /> 		
			</div>
			<div> 비밀번호 : 
			 <input type="password" name="pwd" value="1234" class="form-control mb-4" required /> 
			</div>
			<div>  
				<input type="submit" value="로그인" class="btn btn-outline-success btn-sm mr-4" /> 
				<input type="reset" value="다시입력" class="btn btn-outline-warning btn-sm" /> 
			</div>
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>