<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t02Res.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>%%%% 성적표 %%%%</h2>
		<hr/>
		<p>성명 : ${vo.name} / ${param.name}</p>
		<p>학번 : ${vo.hakbun}</p>
		<p>국어 : ${vo.kor}</p>
		<p>영어 : ${vo.eng}</p>
		<p>수학 : ${vo.mat}</p>
		<p>사회 : ${vo.soc}</p>
		<p>과학 : ${vo.sci}</p>
		<div></div>
		<p>총점 : ${vo.tot} &nbsp;&nbsp;&nbsp;&nbsp; 평균 : ${vo.avg} &nbsp;&nbsp;&nbsp;&nbsp; 학점 : ${vo.grade}</p>
		<hr/>
		<p><a href="<%=request.getContextPath()%>/study/0426/t02.jsp">return</a></p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>