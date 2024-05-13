<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
	<h2 class="text-center mb-4"><b>글 쓰 기</b></h2>
		<form name="myform" method="post" action="BoardInputOk.bo">
			<table class="table table-bordered">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="nickName" value="${sNickName}" readonly class="form-control" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" placeholder="제목을 입력하세요" autofocus class="form-control" required /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="6" class="form-control" required ></textarea></td>
				</tr>
				<tr>
					<th>공개여부</th>
					<td>
					공개 &nbsp;&nbsp;<input type="radio" title="openSw" id="openSw1" value="OK" checked /> &nbsp;&nbsp;
					비공개 &nbsp;&nbsp;<input type="radio" title="openSw" id="openSw2" value="NO" />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" value="등록" class="btn btn-primary btn-sm mr-2" />
						<input type="reset" value="다시입력" class="btn btn-warning btn-sm mr-2" />
						<input type="button" value="돌아가기" onclick="location.href='BoardList.bo';" class="btn btn-danger btn-sm" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="mid" value="${sMid}" />
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}">
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>