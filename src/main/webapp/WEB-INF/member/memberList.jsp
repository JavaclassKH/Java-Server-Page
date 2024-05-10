<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		$(function() {
			$("#userDisplay").hide();
			
			$("#userInfor").on("click", function() {	
 				if($("#userInfor").is(":checked"))  $("#userDisplay").show();
 				else $("#userDisplay").hide();
			});
		});
	
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mb-2"><b><font size="10em">전&nbsp; 체&nbsp; 회&nbsp; 원&nbsp; 리&nbsp; 스&nbsp; 트&nbsp;</font></b></h1>
		<c:if test="${sLevel == 0}">
			<input type="checkbox" name="userInfor" id="userInfor" onclick="userCheck()" /> &nbsp;비공개회원보기
		</c:if>
		<div>
			<table class="table table-hover">
				<tr class="text-dark table-warning text-center">
					<th>번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>성명</th>
					<th>생일</th>
					<th>성별</th>
					<th>직업</th>
					<th>취미</th>			
					<th>최종방문일</th>			
					<th>오늘방문횟수</th>			
				</tr>			
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<c:if test="${vo.userInfor == '공개'}">
						<tr class="text-center">
							<td>${vo.idx}</td>
							<td><a href="MemberSearch.mem?mid=${vo.mid}" target="_blank">${vo.mid}</a></td>
							<td>${vo.nickName}</td>
							<td>${vo.name}</td>
							<td>${fn:substring(vo.birthday,0,10)}</td>
							<td>${vo.gender}</td>
							<td>${vo.job}</td>
							<td>${vo.hobby}</td>
							<td>${fn:substring(vo.lastDate,0,10)}</td>
							<td>${vo.todayCnt}</td>
						</tr>
					</c:if>
				</c:forEach>
				<tr><td colspan="10" class="m-0 p-0"></td></tr>
			</table>
			
			<br/><br/>
			
			<div id="userDisplay">
				<c:if test="${sLevel == 0}">
					<h2 class="text-center mb-4"><b><font size="8em"> 비 공 개 회 원 리 스 트 </font></b></h2>
						<table class="table table-hover">
							<tr class="text-dark table-danger text-center">
								<th>번호</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>성명</th>
								<th>생일</th>
								<th>성별</th>
								<th>직업</th>
								<th>취미</th>			
								<th>최종방문일</th>			
								<th>오늘방문횟수</th>			
							</tr>			
							<c:forEach var="vo" items="${vos}" varStatus="st">
								<c:if test="${vo.userInfor == '비공개'}">
									<tr class="text-center">
										<td>${vo.idx}</td>
										<td><a href="MemberSearch.mem?mid=${vo.mid}" target="_blank">${vo.mid}</a></td>
										<td>${vo.nickName}</td>
										<td>${vo.name}</td>
										<td>${fn:substring(vo.birthday,0,10)}</td>
										<td>${vo.gender}</td>
										<td>${vo.job}</td>
										<td>${vo.hobby}</td>
										<td>${fn:substring(vo.lastDate,0,10)}</td>
										<td>${vo.todayCnt}</td>
									</tr>
							</c:if>
						</c:forEach>
						<tr><td colspan="10" class="m-0 p-0"></td></tr>
					</table>
				</c:if>
			</div>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>