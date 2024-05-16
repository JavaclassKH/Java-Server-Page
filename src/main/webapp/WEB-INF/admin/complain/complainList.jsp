<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ComplainList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function complainCheck(part, partIdx, complain) {
			$.ajax({
				url : "ComplainCheck.ad",
				type : "post",
				data : {
					part : part,
					partIdx : partIdx,
					complain : complain
				},        
				success : function() {
					location.reload();
				},
				error : function() {
					alert("전송오류-신고처리실패");
				}			
			});	
		}
		
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mb-4"><strong><font color="darkred" size="10em">
		신&nbsp;&nbsp; 고&nbsp;&nbsp; 글&nbsp;&nbsp; 통&nbsp;&nbsp; 합&nbsp;&nbsp; 관&nbsp;&nbsp; 리&nbsp;&nbsp; 시&nbsp;&nbsp; 스&nbsp;&nbsp; 템
		</font></strong></h1>
		<table class="table table-hover text-center">
			<tr class="table table-info text-light">
				<th>게시글 번호</th>
				<th>신고분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>신고자</th>
				<th>신고내역</th>			
				<th>신고날짜</th>			
				<th>표시여부</th>			
			</tr>
			<tr class="table table-danger">
				<c:set var="complainCnt" value="${complainCnt}" />
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td>${complainCnt}</td>
						<td>
						<c:if test="${vo.part == 'board'}">게시판</c:if>
						<c:if test="${vo.part == 'pds'}">자료실</c:if>
						<c:if test="${vo.part == 'guest'}">방명록</c:if>
						<c:if test="${vo.part != 'board' && vo.part != 'pds' && vo.part != 'guest'}">${vo.part}</c:if>
						</td>
						<td>${vo.title}</td>
						<td>${vo.nickName}</td>
						<td>${vo.cpMid}</td>
						<td>${vo.cpContent}</td>
						<td>${vo.cpDate}</td>
						<td>
							<a href="javascript:complainCheck('${vo.part}',${vo.partIdx},'${vo.complain}')">${vo.complain == 'NO' ? '표시중' : '차단중' }</a>
						</td>
					</tr>
				<c:set var="complainCnt" value="${complainCnt - 1}" />					
				</c:forEach>
			</tr>
			<tr><td colspan="7" class="m-0 p-0"></td></tr>
		</table>
	</div>
<p><br/></p>
</body>
</html>