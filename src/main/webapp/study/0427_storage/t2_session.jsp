<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sId = session.getId();
  pageContext.setAttribute("sId",sId);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t2_Session.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>세션 연습 Main</h1>
		<hr/>
		<form name="myform" method="post" action="t2_SessionSave.jsp">
		    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">로 그 인(세션아이디 : ${sId})</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickName" value="${sNickName}" required class="form-control" /></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="${sName}" required class="form-control" /></td>
      </tr>
      <tr>
        <td colspan="2">
        	<button type="submit" class="btn btn-outline-success btn-lg mr-4">세션저장</button>
					<a href="t2_SessionCheck.jsp" class="btn btn-outline-primary btn-lg mr-4"><b>세션확인</b></a>
					<a href="t2_SessionAllDelete.jsp" class="btn btn-outline-secondary btn-lg mr-4"><b>세션전체삭제</b></a>
					<a href="t2_SessionDelete.jsp" class="btn btn-outline-danger btn-lg"><b>세션부분삭제</b></a>
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