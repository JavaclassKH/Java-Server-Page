<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>join.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>&nbsp;&nbsp; 회&nbsp;&nbsp; 원&nbsp;&nbsp; 가&nbsp;&nbsp; 입 &nbsp;&nbsp;</h1>
		<form name="myform" method="post" action="${ctp}/database/JoinOk">
    <table class="table table-bordered-dark text-center">
      <tr>
        <td colspan="2"><font size="5">&nbsp;&nbsp; 회&nbsp;&nbsp; 원&nbsp;&nbsp; 가&nbsp;&nbsp; 입 &nbsp;&nbsp;</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${mid}" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="1234" required class="form-control" /></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" required class="form-control" /></td>
      </tr>
      <tr>
        <th>나이</th>
        <td><input type="text" name="age" value="20" class="form-control" /></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>
        	<input type="radio" name="gender" value="남자" checked />남자 &nbsp;&nbsp;&nbsp;
        	<input type="radio" name="gender" value="여자" checked />여자
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address" value="서울" class="form-control" /></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="회원가입" class="btn btn-outline-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-outline-warning mr-2"/>
          <input type="button" value="돌아가기" onclick="location.href='login.jsp';" class="btn btn-primary mr-4"/>
	    		<input type="checkbox" name="idSave" checked /> 아이디 저장
        </td>
      </tr>
    </table>
  </form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>