<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	pageContext.setAttribute("mid" , mid);
	pageContext.setAttribute("pwd" , pwd);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t03Ok.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
	<div class="container">
		<h1><font color="navy">회원정보</font></h1>
		<p><br/></p>
		<p>아이디 : ${mid}</p>
		<p>비밀번호 : ${pwd}</p>
		<hr/>
		<p><a href="t03.jsp" class="btn btn-outline-secondary btn-lg">돌아가기</a></p>
		
		<% if(mid.substring(mid.length()-1).equals("K")) {%>
			<jsp:forward page="t03ResK.jsp">
				<jsp:param value="${mid}" name="mid"/> 
				<jsp:param value="${pwd}" name="pwd"/>
			</jsp:forward>
		<%}else if(mid.substring(mid.length()-1).equals("S")) {%>
			<jsp:forward page="t03ResS.jsp">
				<jsp:param value="${mid}" name="mid"/> 
				<jsp:param value="${pwd}" name="pwd"/>
			</jsp:forward>
		<%}else if(mid.substring(mid.length()-1).equals("T")) {%>
			<jsp:forward page="t03ResT.jsp">
				<jsp:param value="${mid}" name="mid"/> 
				<jsp:param value="${pwd}" name="pwd"/>
			</jsp:forward>
		<%}else if(mid.substring(mid.length()-1).equals("D")) {%>
			<jsp:forward page="t03ResD.jsp">
				<jsp:param value="${mid}" name="mid"/> 
				<jsp:param value="${pwd}" name="pwd"/>
			</jsp:forward>
		<% } %>
		
		
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>






















