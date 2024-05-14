<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>WOW</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
	
		function boardDelete() {
			let ans = confirm("현재 글을 삭제하시겠습니까?");
			
			if(ans) {
				alert("삭제 진행중....");
				location.href = "BoardDelete.bo?idx=${vo.idx}";
			}
		}
		
		// 좋아요 증가 처리
		function goodCheck() {
			$.ajax({
				url : "BoardGoodCheck.bo",
				type : "post",
				data : { idx : ${vo.idx} },
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 증가 처리(중복불허)
		function goodCheck2() {
			$.ajax({
				url : "BoardGoodCheck2.bo",
				type : "post",
				data : { idx : ${vo.idx} },
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 증가 체크 처리(중복허용)
		function goodCheckP() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : { 
					idx : ${vo.idx},
					goodCnt : +1
				},
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 감소 체크 처리(중복허용)
		function goodCheckM() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : { 
					idx : ${vo.idx},
					goodCnt : -1
				},
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
	
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mb-4"><b>게시판 글 조회</b></h1>
		<table class="table table-bordered">
			<tr>
				<th class="table-info">작성자</th>
				<td>${vo.nickName}</td>
				<th class="table-info">작성날짜</th>
				<td>${fn:substring(vo.wDate, 0, 16)}</td>
			</tr>
			<tr>
				<th class="table-info">글조회수</th>
				<td>${vo.readNum}</td>
				<th class="table-info">작성자 IP</th>
				<td>
					<c:if test="${vo.hostIp == '192.168.50.64'}">관리자IP</c:if>
					<c:if test="${vo.hostIp != '192.168.50.64'}">${vo.hostIp}</c:if>				
				</td>
			</tr>
			<tr>
				<th class="table-info">글 제목</th>
				<td colspan="3" class="text-center">${vo.title} &nbsp;&nbsp;
				(<a href="javascript:goodCheck()">❤</a>${vo.good}) &nbsp;
				(<a href="javascript:goodCheckP()">👍</a>) &nbsp;
				(<a href="javascript:goodCheckM()">👎</a>)
				(<a href="javascript:goodCheck2()"><font color="blue" size="4">♥</font></a>${vo.good}) &nbsp;
				</td>
			</tr>
			<tr>
				<th class="table-success">글 내용</th>
				<td colspan="3" style="height:250px;">
				${fn:replace(vo.content, newLine,'<br/>')}
				</td>
			</tr>
			<tr>
				<td colspan="4" class="table-info text-right">
				<div class="text-right">
					<input type="button" value="목록" onclick="location.href='BoardList.ad?pag=${pag}&pageSize=${pageSize}'" class="btn btn-info mr-3 mt-1 text-center" />
					<c:if test="${sNickName == vo.nickName || sLevel == 0}">
					</c:if>
				</div>
				</td>
			</tr>
		</table>
		<br/>
		<table class="table table-borderless"> <!-- 이전,다음글 출력용! -->
			<tr>
				<td>
					<c:if test="${!empty nextVo.title}">
						<a href="BoardContent.bo?idx=${nextVo.idx}"><b>다음 글</b> : ${nextVo.title}</a><br/>
					</c:if>						
					<c:if test="${!empty preVo.title}">
						<a href="BoardContent.bo?idx=${preVo.idx}"><b>이전 글</b> : ${preVo.title}</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
<p><br/></p>
</body>
</html>


<!-- <marquee scrollamount=1449>지&nbsp;&nbsp;&nbsp;나&nbsp;&nbsp;&nbsp;갑&nbsp;&nbsp;&nbsp;니&nbsp;&nbsp;&nbsp;다</marquee> -->