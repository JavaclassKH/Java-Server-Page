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
			location.href="BoardList.bo?pageSize="+pageSize;
		}
		
		function modalCheck(hostIp, mid, nickName, idx, sLevel) {
			$("#myModal #modalhostIp").text(hostIp);
			$("#myModal #modalMid").text(mid);
			$("#myModal #modalNickName").text(nickName);
			$("#myModal #modalIdx").text(idx);		
			let strLevel = "";
			if(sLevel == 0)  strLevel = "관리자";			
			else if(sLevel == 1)  strLevel = "준회원";			
			else if(sLevel == 2)  strLevel = "정회원";
			else if(sLevel == 3)  strLevel = "우수회원";			
			else if(sLevel == 99)  strLevel = "탈퇴신청회원";
			$("#myModal #modalsLevel").text(strLevel);
		}
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
			<table class="table table-borderless m-0 p-0">
			<tr class="table-hover text-dark">
				<td colspan="2"><h1 class="text-center"><strong>자 유 게 시 판</strong></h1></td>
			</tr>
			<tr>
				<td><c:if test="${sLevel != 1}"><a class="btn btn-outline-success" href="BoardInput.bo"><font color="silver">글쓰기</font></a></c:if></td>
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
			<c:set var="curScrStartNo" value="${curScrStartNo}"/>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<c:if test="${vo.openSw == 'OK' || sLevel == 0 || sNickName == vo.nickName}">
					<tr class="text-center">
						<td>${curScrStartNo}</td>
						<td class="text-left">
							<a class="btn btn-light btn-sm" href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
							<c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif" /></c:if>
							<c:if test="${vo.hour_diff >= 24}"></c:if>
							<c:if test="${vo.replyCount != 0}">(${vo.replyCount}개)</c:if>
						</td>
						<td>
							${vo.nickName}
							<c:if test="${sLevel == 0}">
								<a href="#" onclick="modalCheck('${vo.hostIp}','${vo.mid}','${vo.nickName}',${vo.idx},${sLevel})" data-toggle="modal" data-target="#myModal" class="badge badge-outline-info badge-sm m-0 p-0"><font size="1px">정보조회</font></a>
							</c:if>
						</td>
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
							<font color="blue">${vo.readNum}&nbsp;( <font color="navy">${vo.good}</font> )</font>
						</td>
					</tr>
				</c:if>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
			</c:forEach>
			<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
			<br/>		
			<!-- 블록페이지 시작 -->
				<div class="text-center">
				  <ul class="pagination justify-content-center">
					  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
					  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
					  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
					    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
					    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
					  </c:forEach>
					  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
					  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
				  </ul>
				</div>
				<!-- 블록페이지 끝 -->
				<br/>
				<!-- 검색기 시작 -->
				<div class="container text-center">
					<form name="searchForm" method="post" action="BoardSearchList.bo">
						<b> 검색 </b>
						<select name="search" id="search">
							<option value="title">제목</option>
							<option value="nickName">작성자</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchString" id="searchString" required />
						<input type="submit" value="검색" class="btn btn-info btn-sm" />
					</form>
				</div>				
				<!-- 검색기 끝 -->
				
		</div>
<p><br/></p>

	<!-- 모달에 회원정보,글내용 출력 -->
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시글 간단히 보기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form name="midModalForm">
						고유번호 : <span id="modalIdx"></span><br/>						
						<font color="gold">작성자IP</font> : <span id="modalhostIp"></span><br/>
						아이디 : <span id="modalMid"></span><br/>
						닉네임 : <span id="modalNickName"></span><br/>
						회원등급 : <span id="modalsLevel"></span>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

<%@ include file = "/include/footer.jsp" %>
</body>
</html>