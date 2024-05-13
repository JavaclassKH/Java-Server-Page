<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
			<table class="table table-borderless m-0 p-0">
			<tr class="table-success text-dark">
				<td colspan="2"><h1 class="text-center"><strong>자 유 게 시 판</strong></h1></td>
			</tr>
			<tr>
				<td><c:if test="${sLevel != 1}"><a class="btn btn-outline-success" href="BoardInput.bo"><font color="silver">글쓰기</font></a></c:if></td>
				<td></td>
			</tr>
			</table>
			
			<table class="table table-bordered m-0 p-0">
			<tr class="table-warning text-dark">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.title}</td>
					<td>${vo.nickName}</td>
					<td>${vo.wDate}</td>
					<td>${vo.readNum}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
			</table>		
		</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>