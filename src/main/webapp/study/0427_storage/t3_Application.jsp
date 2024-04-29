<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t3_Application.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>Application 연습 Main</h1>
		<hr/>
		<form name="myform" method="post" action="t3_ApplicationSave.jsp">
		    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">로 그 인</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${aMid}" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickName" value="${aNickName}" required class="form-control" /></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="${aName}" required class="form-control" /></td>
      </tr>
      <tr>
        <td colspan="2">
        	<button type="submit" class="btn btn-outline-success mr-4">어플저장</button>
					<a href="t3_ApplicationCheck.jsp" class="btn btn-outline-primary btn-lg mr-4"><b>어플확인</b></a>
					<a href="t3_ApplicationDelete.jsp" class="btn btn-outline-danger btn-lg"><b>어플부분삭제</b></a>
        </td>
      </tr>
    </table>
    </form>
    <div class="row">
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>