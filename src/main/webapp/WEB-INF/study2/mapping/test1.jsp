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
  <title>test1.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
  	'use strict';
  
  	function fCheck(flag) {			
			if(flag == 1) {
				myform.submit();
			}
			else if(flag == 2) {
				location.href = "${ctp}/mapping/Test1";
			}
			else if(flag == 3) {
				myform.action = "${ctp}/mapping/Test1Res1";
				myform.submit();
			}
			else if(flag == 4) {
				myform.action = "${ctp}/mapping/Test1Res2";
				myform.submit();
			}
			else if(flag == 999) {
				window.open("https://map.naver.com/p/search/%EC%98%A5%EC%82%B0%20%EC%95%84%ED%8A%B8%EB%B9%8C%EC%95%84%ED%8C%8C%ED%8A%B8/place/17813308?c=15.00,0,0,0,dh&isCorrectAnswer=true");
			}
		}
  
  </script>  
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test1.jsp(/WEB-INF/study2/mapping)</h2>
  <hr/>
  <div>전송 메세지 : 
  	<c:if test="${msg == ''}">Good Morning</c:if> 
  	<c:if test="${msg != ''}">Good Night</c:if>   
  </div>
  <hr/><br/>
  <div class="text-center">
  	<input type="button" value="합/차" onclick="fCheck(1)" class="btn btn-outline-success btn-lg mr-3" />
  	<input type="button" value="돌아가기" onclick="fCheck(2)" class="btn btn-outline-primary mr-3" />
  	<input type="button" value="전송" onclick="fCheck(3)" class="btn btn-outline-secondary btn-sm mr-3" />
  	<input type="button" value="전송결과" onclick="fCheck(4)" class="btn btn-outline-info btn-sm mr-3" />
  	<input type="button" value="집에가기" onclick="fCheck(999)" class="btn btn-outline-danger" />
  </div>
  <hr/>
  <div>
  	<form name="myform" method="post" action="${ctp}/mapping/Test1Ok">
  		<br/>
  		<div>
  			<input type="number" name="su1" value="${su1}" class="form-control mb-3" />
  		</div>
  		<div>
  			<input type="number" name="su2" value="${su2}" class="form-control mb-3" />
  		</div>
  	</form>
  </div>
  <div>
  	<div>두 수의 합 : ${hap}</div>&nbsp;&nbsp;&nbsp;
  	<div>두 수의 차 : ${cha}</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>