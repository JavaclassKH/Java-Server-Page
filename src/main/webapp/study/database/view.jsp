<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("name", name);
%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>view.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
	<script>
		'use strict';
		
		function deleteCheck() {
			let ans = confirm("정말로 회원탈퇴를 진행하시겠습니까?");
			
			if(ans) {
				location.href="${ctp}/database/LoginDelete?mid=${vo.mid}";	
			}
		}
	
	</script>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center">&nbsp;&nbsp; 회&nbsp;&nbsp; 원&nbsp;&nbsp; 정&nbsp;&nbsp; 보&nbsp;&nbsp; 열&nbsp;&nbsp; 람&nbsp;&nbsp; 페&nbsp;&nbsp; 이&nbsp;&nbsp;지 &nbsp;&nbsp;</h1>
		<form name="myform" method="post" action="${ctp}/database/UpdateOk">
    <table class="table table-bordered-dark text-center">
      <tr>
        <td colspan="2"><font size="5">&nbsp;&nbsp; 회&nbsp;&nbsp; 원&nbsp;&nbsp; 정&nbsp;&nbsp; 보&nbsp;&nbsp; 수&nbsp;&nbsp; 정&nbsp;&nbsp;</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <%-- <td><input type="text" name="mid" value="${vo.mid}" readonly class="form-control" /></td> --%>
        <td class="text-left">${vo.mid}</td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="${vo.pwd}" required class="form-control" /></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="${vo.name}" required class="form-control" /></td>
      </tr>
      <tr>
        <th>나이</th>
        <td><input type="text" name="age" value="${vo.age}" value="20" class="form-control" /></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>
        	<input type="radio" name="gender" value="남자" <c:if test="${vo.gender == '남자'}">checked</c:if> />남자 &nbsp;&nbsp;&nbsp;
        	<input type="radio" name="gender" value="여자" <c:if test="${vo.gender == '여자'}">checked</c:if> />여자
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address" value="${vo.address}" class="form-control" /></td>
      </tr>
      <tr>
        <td colspan="2">
        <div class="row">
					<div class="col text-left">
	          <input type="button" value="돌아가기" onclick="location.href='${ctp}/study/database/LoginList';" class="btn btn-primary mr-5"/>
					</div>        
					<div class="col text-right">
	          <input type="submit" value="정보수정" class="btn btn-outline-secondary mr-2" />
  	        <input type="button" value="회원탈퇴" onclick="deleteCheck()" class="btn btn-outline-warning" />
					</div>
        </div>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}" />
  </form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>















