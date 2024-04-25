<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String user = request.getParameter("user");

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02Ok.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>전송된 값</h2>
		<div class="mt-2 mb-4">
			성명 : <%=name%>
		</div>
		<div class="mb-4">
			나이 : <%=age%>
		</div>
		<div class="mb-4">
			유저 : <%=user%>
		</div>
		<hr/>
		<% 
			if(user.equals("admin")) {
				out.println("Welcome 관리자!");
			}
			else {				
				out.println("Welcome 고객님!");
			}
		%>
		<hr/>
		<p><br/></p>
		<div class="mb-4">
			<a href="t02_1.jsp" class="btn btn-danger">return</a> 
		</div>
	</div>
<p><br/></p>
</body>
</html>












