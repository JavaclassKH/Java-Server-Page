<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- useBean : Class를 의미하는 액션 태그(클래스를 생성하여 쓸 수 있다) --> 
<!-- id는 클래스 변수명 , class는 그대로 class로 생성! 클래스는 경로를 줘서 부른다 -->
<!-- 서블릿에서의 getter()와 setter()는 JSP에서 getProperty(),setProperty() 이다 -->
<jsp:useBean id="vo" class="study.j0426.T02OkVO" /> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02_3Ok</title>
	<jsp:include page="/include/bs4.jsp" />
	<jsp:setProperty property="name" name="vo" />
	<jsp:setProperty property="hakbun" name="vo" />
	<jsp:setProperty property="kor" name="vo" />
	<jsp:setProperty property="eng" name="vo" />
	<jsp:setProperty property="mat" name="vo" />
	<jsp:setProperty property="soc" name="vo" />
	<jsp:setProperty property="sci" name="vo" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1> 넘어온 값 </h1>
		<h3>(t02_2Ok)</h3>
		<p>성명 : <jsp:getProperty property="name" name="vo" /></p>
		<p>학번 : <jsp:getProperty property="hakbun" name="vo" /></p>
		<p>국어 : <jsp:getProperty property="kor" name="vo" /></p>
		<p>영어 : <jsp:getProperty property="eng" name="vo" /></p>
		<p>수학 : <jsp:getProperty property="mat" name="vo" /></p>
		<p>사회 : <jsp:getProperty property="soc" name="vo" /></p>
		<p>과학 : <jsp:getProperty property="sci" name="vo" /></p>
		<hr/>
		<p><a href="t02.jsp">돌아가</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>








































