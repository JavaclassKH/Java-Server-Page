<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesSave.jsp -->
<%
	String cookieOk = "";

	if(cookieOk.equals('y')){
		String mid = "hkd1234";
		Cookie cookieMid = new Cookie("cMid", mid);
		// 쿠키의 만료시간(초)을 준다 1일 : 60*60*24 = ?
		cookieMid.setMaxAge(86400);
		response.addCookie(cookieMid);
		
		String pwd = "1234";
		Cookie cookiePwd = new Cookie("cPwd", pwd);
		// 쿠키의 만료시간(초)을 준다 1일 : 60*60*24 = ?
		cookiePwd.setMaxAge(86400);
		response.addCookie(cookiePwd);		
	}
%>

<script>
	'use strict';
	alert("쿠키 생성/저장");
	location.href = "t1_cookies.jsp";
</script>












