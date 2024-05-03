<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>lifeCycle2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<h1>서블릿 라이프사이클2</h1>
	<div class="container">
		 <form name="myform" method="post" action="${pageContext.request.contextPath}/j0430/LifeCycle2Ok">
  <table class="table table-border-dark">
      <tr>
        <th>아이디</th>
        <td><input type="text" name="title" value="servlet 메소드 생명주기" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><textarea name="content" rows="6" class="form-control" />servlet 메소드 생명주기입니다</textarea></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="shoot" class="btn btn-outline-success mr-10"/>
        </td>
      </tr>
    </table>
  </form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>