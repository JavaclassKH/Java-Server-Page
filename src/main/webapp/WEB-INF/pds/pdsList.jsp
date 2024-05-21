<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>pdsList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
/* 		function partCheck() {
			let part = $("#part").val();
			location.href="PdsList.pds?";
		} */
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center">자 료 실 리 스 트 (${part})</h1>
		<br/>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>
					<form name="partForm">
						<select name="part" id="part" onchange="partCheck()">
							<option ${part == "전체" ? "selected" : ""}>전체</option>
							<option ${part == "학습" ? "selected" : ""}>학습</option>
							<option ${part == "여행" ? "selected" : ""}>여행</option>
							<option ${part == "음식" ? "selected" : ""}>음식</option>
							<option ${part == "기타" ? "selected" : ""}>기타</option>
						</select>
					</form>
				</td>
				<td class="text-right">
					<a href="PdsInput.pds?part=${part}" class="badge bg-success"><font color="navy">자료올리기</font></a>
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>자료제목</th>
				<th>게시자</th>
				<th>게시일자</th>
				<th>자료분류</th>
				<th>파일명(크기)</th>
				<th>다운로드 수</th>
				<th>비고</th>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo}" />
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${curScrStartNo}</td>
					<td><a href="PdsContent.pds?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&part=${part}">${vo.title}</a></td>
					<td>${vo.nickName}</td>
					<td>${vo.fDate}</td>
					<td>${vo.part}</td>
					<td>
						개별파일다운로드
					</td>
					<td>${vo.downNum}</td>
					<td>
						<c:if test="${vo.mid == sMid || sLevel == 0}">
							<a href="#" class="badge bg-danger"><font color="black">삭제</font></a><br/>
						</c:if>
						<a href="PdsTotalDown.pds?idx=${vo.idx}" class="badge bg-primary"><font color="black">전체다운로드</font></a>
					</td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
			</c:forEach>
			<tr><td colspan="9" class="m-0 p-0"></td></tr>
		</table>
	</div>
<p><br/></p>
	<!-- 블록페이지 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
		  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		  </c:forEach>
		  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
		  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 -->
<%@ include file = "/include/footer.jsp" %>
</body>
</html>