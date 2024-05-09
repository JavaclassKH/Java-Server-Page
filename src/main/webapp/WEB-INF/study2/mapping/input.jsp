<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>input.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>Here is input.jsp</h1>
		<br/>
		<div>
			<a href="inputOk.do4" class="btn btn-outline-primary"><font color="yellow">회원가입</font></a>			
			<a href="Test4.do4" class="btn btn-outline-warning"><font color="blue">돌아가기</font></a>
		</div>		
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>

<!-- 	<div>
			<form name="myform" method="post">
				<div> 아이디 : 
					<input type="text" name="mid" placeholder="Enter your ID" autofocus required class="form-control mt-2 mb-2" />				
				</div>
				<div> 비밀번호 : 
					<input type="password" name="pwd" placeholder="Enter your Password" required class="form-control mb-2" />				
				</div>
				<div> 비밀번호 확인 : 
					<input type="password" name="pwdCheck" placeholder="Enter your Password again" required class="form-control mb-2" />				
				</div>
			</form>
		</div> -->