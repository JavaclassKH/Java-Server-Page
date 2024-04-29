<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- certification.jsp -->
<% 
	String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("mid");
	if(mid.equals("")) {
		out.println("<script>");
		out.println("alert('로그인 후 이용하셔야합니다');");
		out.println("location.href = '"+request.getContextPath()+"/study/0428_Login/login.jsp';");
		out.println("</script>");
	}
%>