<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
	String time = sdf.format(date);
	session.setAttribute("time", time);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>해야 & Accendio</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file = "../../include/bs4.jsp" %> 
  <style>
  .fakeimg {
    height: 200px;
    background: #f0f;
  }
  </style>
</head>
<body>
<%@ include file = "../../include/header.jsp" %> 

<!-- 메뉴바(Nav) , 상대경로지정 -->
<%@ include file = "../../include/nav.jsp" %> 
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2>About Me (<font color="yellow">${sNickName}</font>)</h2>
      <h4><span>현재 시간 : ${time}</span></h4>
      <div class="fakeimg"><img src="<%=request.getContextPath() %>/images/111.jpg" width="350px" height="200px"/></div>
      <p>뮤지컬 드라큘라 중 넘버 It's Over</p>
      <h3>Some Links</h3>
      <p>amigo</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>TITLE HEADING</h2>
 			<img src="images/115.jpg" width="729px" height="380px" />  
					<c:forEach var="vo" items="${vos2}" varStatus="st">
						<tr class="table-primary">
							<td>${vo.idx}</td>
							<td>${vo.mid}</td>
							<td>${vo.name}</td>
							<td>${vo.age}</td>
							<td>${vo.gender}</td>
							<td>${vo.address}</td>
						</tr>
					</c:forEach>
					<tr><td colspan="6" class="m-0 p-0"></td></tr>
				</table>	
      <br><br/>
      <div>
      	<table class="table table-hover">
      		<h1>신규가입 회원을 향해 환영의 박수!!</h1>
					<tr class="table-success">
						<th>번호</th>
						<th>아이디</th>
						<th>성명</th>
						<th>나이</th>
						<th>성별</th>
						<th>주소</th>
					</tr>
					<c:forEach var="vo" items="${recentVos}" varStatus="st">
						<tr class="table-primary">
							<td>${vo.idx}</td>
							<td>${vo.mid}</td>
							<td>${vo.name}</td>
							<td>${vo.age}</td>
							<td>${vo.gender}</td>
							<td>${vo.address}</td>
						</tr>
					</c:forEach>
					<tr><td colspan="6" class="m-0 p-0"></td></tr>
				</table>	
      </div>
    </div>
  </div>
</div>
<%@ include file = "../../include/footer.jsp" %> 

</body>
</html>
























