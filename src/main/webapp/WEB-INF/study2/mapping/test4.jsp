<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String msg = request.getParameter("msg")==null? "공백" : request.getParameter("msg");
  pageContext.setAttribute("msg", msg);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test4.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<script>
	'use strict';
	
	function clac(flag) {
		if(flag == 'hap') myform.action = "hap.do4";
		else if(flag == 'cha') myform.action = "cha.do4";
		else if(flag == 'gop') myform.action = "gop.do4";
		else if(flag == 'mok') myform.action = "mok.do4";	
	
		myform.submit();
	}

</script>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test4.jsp(/WEB-INF/study2/mapping)</h2>
  <hr/>
  <div>전송 메세지 : 그런거 없음 </div> 
  <hr/><br/>
  <div class="text-center"> 	
  	<a href="list.do4" class="btn btn-outline-success btn-lg mt-9 mr-3" >연습 List</a>
  	<a href="input.do4" class="btn btn-outline-primary mt-6 mr-3" >연습 Input</a>
  	<a href="update.do4" class="btn btn-outline-secondary btn-sm mr-3" >연습 Update</a>
  	<a href="delete.do4" class="btn btn-outline-info mt-6 mr-3" >연습 Delete</a>
  	<a href="search.do4" class="btn btn-outline-danger btn-lg mt-9" >연습 Search</a>	
  </div>
<!--   
  <div class="text-center mt-4"> 	
  	<a href="javascript:clac('hap')" class="btn btn-outline-success mt-9 mr-3" >더하기</a>
  	<a href="javascript:clac('cha')" class="btn btn-outline-primary mt-6 mr-3" >빼기</a>
  	<a href="javascript:clac('gop')" class="btn btn-outline-secondary mr-3" >곱하기</a>
  	<a href="javascript:clac('mok')" class="btn btn-outline-info mt-6 mr-3" >나누기</a>
  </div>
-->
  <hr/>
  <div>
  	<form name="myform" method="post" action="${ctp}/mapping/Test4.do4">
  		<br/>
  		<div>
  			<input type="number" name="su1" value="${su1}" class="form-control mb-3" />
  		</div>
  		<div>
  			<input type="number" name="su2" value="${su2}" class="form-control mb-3" />
  		</div>
		  <div><input type="submit" value="전송하기" class="btn btn-success btn-lg text-center mt-5 mb-5" /></div>
  	</form>
  </div>
  <div>
  	<div class="mb-4 mr-3">두 수의 합 : ${hap} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 두 수의 차 : ${cha}</div>
  	<div class="mb-4 mr-3">두 수의 곱 : ${gop} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 두 수의 몫 : ${mok}</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>