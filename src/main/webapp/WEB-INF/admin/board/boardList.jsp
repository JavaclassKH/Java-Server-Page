<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function pageSizeCheck() {
			let pageSize = $("#pageSize").val();
			location.href="BoardList.bo?pageSize"+pageSize;
		}
	
	
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
			<table class="table table-borderless m-0 p-0">
			<tr class="table-hover text-dark">
				<td colspan="2"><h1 class="text-center"><strong>자 유 게 시 판</strong></h1></td>
			</tr>
			<tr>
				<td class="text-right">
	        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
	          <option ${pageSize==5  ? "selected" : ""}>5</option>
	          <option ${pageSize==10 ? "selected" : ""}>10</option>
	          <option ${pageSize==15 ? "selected" : ""}>15</option>
	          <option ${pageSize==20 ? "selected" : ""}>20</option>
	          <option ${pageSize==30 ? "selected" : ""}>30</option>
	        </select>
				</td>
			</tr>
			</table>		
			<table class="table table-bordered m-0 p-0">
			<tr class="table-warning text-dark text-center">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>작성자정보</th>
				<th>조회수(좋아요)</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<c:if test="${vo.openSw == 'OK' || sLevel == 0 || sNickName == vo.nickName}">
					<tr class="text-center">
						<td>${vo.idx}</td>
						<td class="text-left">
							<a class="btn btn-light btn-sm" href="BoardContent.ad?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
							<c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif" /></c:if>
							<c:if test="${vo.hour_diff >= 24}"></c:if>
						</td>
						<td>${vo.nickName}</td>
						<td>
							${vo.date_diff == 0 ? fn:substring(vo.wDate,10,19) : fn:substring(vo.wDate,0,10)}
						</td>
						<td>${vo.readNum}</td>
						<td>
							<c:if test="${vo.mid == 'admin'}">관리자</c:if>
							<c:if test="${vo.mid == 'sona123'}">운영자</c:if>
							<c:if test="${vo.mid != 'admin' && vo.mid != 'sona123'}">${vo.nickName} / ${vo.hostIp}</c:if>
						</td>
						<td>
							<font color="4em">${vo.readNum}&nbsp;( ${vo.good} )</font>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
			<br/>		
			<!-- 블록페이지 시작 -->
				<div class="text-center">
				  <ul class="pagination justify-content-center">
					  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.ad?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
					  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.ad?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
					  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
					    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BoardList.ad?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
					    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.ad?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
					  </c:forEach>
					  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.ad?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
					  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.ad?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
				  </ul>
				</div>
				<!-- 블록페이지 끝 -->
		</div>
<p><br/></p>
</body>
</html>