<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionCheck.jsp -->
<%
	request.setCharacterEncoding("UTF-8");	
	response.setContentType("text/html; charset=UTF-8");
	
	String sessionName = "";
	String sessionName_ = "";
	String sessionValue = "";
	
	Enumeration enumCk = session.getAttributeNames();
		
	String mid = (String)session.getAttribute("sMid");
	String nickName = (String)session.getAttribute("sNickName");
	String name = (String)session.getAttribute("sName");
	
	pageContext.setAttribute("sMid",mid);
	pageContext.setAttribute("sNickName",nickName);
	pageContext.setAttribute("sName",name);
	
	while(enumCk.hasMoreElements()) {
		sessionName_ = enumCk.nextElement().toString();
		sessionName += sessionName_ + " / ";
		sessionValue += session.getAttribute(sessionName_) + " / ";
	}
	System.out.println("");
	System.out.println(sessionName + "\n ㄴ>" + sessionValue);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>세션값 출력</h1>
		<p>아뒤 : ${sMid}</p>
		<p>닉넴 : ${sNickName}</p>
		<p>이름 : ${sName}</p>
		<p><a href="t2_session.jsp">return</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>

















