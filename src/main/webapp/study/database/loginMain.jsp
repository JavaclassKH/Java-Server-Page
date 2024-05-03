<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>loginMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script type="text/javascript">
		'use strict';
		
		function nameSearch() {
			let name = document.getElementById("name").value;
			if(name.trim() == "") {
				alert("검색하실 성명을 입력하세요");
				document.getElementById("name").focus();
			}	
			else {
				location.href = "${ctp}/database/LoginSearch?name="+name;
			}
		}
		
		function loginList() {
			location.href = "${ctp}/study/database/LoginList";
		}
		
		function sortCheck() {
			let sort = document.getElementById("selected").value;
			location.href="${ctp}/database/LoginSort?sort="+sort;
		}
		
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center"><strong>인증회원 전용 페이지입니다</strong></h1>
		<br/>
		<div class="col text-right mb-4;">
			<select class="form-select form-select " id="selected" onchange="sortCheck()" aria-label=".form-select-lg example">
			  <option selected>정렬방식 선택</option>
			  <option value="idx">번호</option>
			  <option value="name">이름</option>
			  <option value="age">나이</option>
			</select>
			<hr/>
			<div class="text-center">
				<c:if test="${pag > 1}"> 
					<a href="${ctp}/GuestList?pag=1" class="btn btn-primary btn-sm">첫 페이지</a>
					<a href="${ctp}/GuestList?pag=${pag - 1}" class="btn btn-outline-info ml-4 mr-1">앞</a>
				</c:if>
				<c:if test="${pag < totPage}">
					<a href="${ctp}/LoginList?pag=${pag + 1}"  class="btn btn-outline-info ml-1 mr-4">뒤</a>	
					<a href="${ctp}/LoginList?pag=${totPage}" class="btn btn-secondary btn-sm">끝 페이지</a>	
				</c:if>
			</div>
			<input type="button" onclick="loginList()" value="전체회원" class="btn btn-outline-primary ml-4 mb-3" />
			</div>
			<table class="table table-hover mt-4">
			<tr class="table-success">
				<th><span style="font-color='red';">번호</span></th>
				<th><span style="font-color='blue';">아이디</span></th>
				<th><span style="font-color='yellow';">성명</span></th>
				<th><span style="font-color='green';">나이</span></th>
				<th><span style="font-color='blue';">성별</span></th>
				<th><span style="font-color='navy';">주소</span></th>
			</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr class="table-primary">
						<td>${vo.idx}</td>
						<td>${vo.mid}</td>
						<td><a href="${ctp}/study/database/LoginView?idx=${vo.idx}">${vo.name}</a></td>
						<td>${vo.age}</td>
						<td>${vo.gender}</td>
						<td>${vo.address}</td>
					</tr>
				</c:forEach>
			<tr><td colspan="6" class="m-0 p-0"></td></tr>
		</table>		
		<br/><br/>		
		<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">성 명</span></div>
		<input type="text" name="name" id="name" class="form-control" />
			<button type="button" onclick="nameSearch()" class="input-group-append btn btn-outline-danger ml-1">개별조회</button>
		</div>
	
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>