<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String img = request.getParameter("tag") == null ? "111" : request.getParameter("tag");
	String[] imgs = request.getParameterValues("imgs");
	
	String imgName = "";
	for(int i=0; i<=imgs.length; i++) {
		imgName += imgs[i];
	}
	System.out.println(imgName);   
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t08Ok.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>선택한 그림 출력</h2>
		<img src="<%=request.getContextPath() %>/images/<%=img %>.jpg" width="700px" height="450px" />
		<p>선택한 그림 여러장 출력</p>
		<img src="<%=request.getContextPath() %>/images/<%=imgName %>.jpg" width="700px" height="450px" />
	</div>
<p><br/></p>
</body>
</html>










