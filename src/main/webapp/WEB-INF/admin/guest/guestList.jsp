<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("nl", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>guestList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'ues strict';
		
		function delCheck(idx) {
			let ans = confirm("삭제하시겠습니까?");		
			if(ans) {
				location.href="${ctp}/GuestDelete?idx="+idx;
				return false;
			}			
		}
		
		function w3school() {
		 	let ans = confirm("후회하지 않을 자신 있으신가요??"); 
		 	if(ans) {
		 		alert("공부하세요");
				window.open('about:blank').location.href="https://www.w3schools.com";
		 	}	
		 	else {
		 		alert("그래도 공부하세요");		 
		 		window.open('about:blank').location.href="https://www.w3schools.com";
		 	}
		}	
		
		function pageSizeChange() {
			let pageSizeChange = document.getElementById("pageSizeChange").value;
			location.href = "${ctp}/GuestList?pageSize="+pageSizeChange+"&pag="+${pag};
		}
	
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2 class="text-center">Guest book page</h2>
			<table class="table table-borderless m-0 p-0">
			<tr>
				<!-- <td><a href="" class="btn btn-info">관리자전용</a></td> -->
				<td class="text-right">
				</td>
				<td><input type="button" onclick="w3school()" value="글쓰기" class="btn btn-danger" /></td>
				<td><a href="${ctp}/guest/guestInput.jsp" class="btn btn-outline-success"><font color="red">경고: 누르지마시오</font></a></td>
				<td class="text-right"> 
				<span class="mr-15">현재 페이지 : ${pag} / 다음 페이지 :  ${totPage}</span>
				<c:if test="${pag > 1}"> 
					<a href="${ctp}/GuestList?pag=1" class="btn btn-info btn-sm"><span class="spinner-border spinner-border-sm"></span>첫 페이지</a>
					<a href="${ctp}/GuestList?pag=${pag - 1}" class="btn btn-outline-info ml-4 mr-1">앞</a>
				</c:if>
				<c:if test="${pag < totPage}">
					<a href="${ctp}/GuestList?pag=${pag + 1}"  class="btn btn-outline-info ml-1 mr-4">뒤</a>	
					<a href="${ctp}/GuestList?pag=${totPage}" class="btn btn-info btn-sm"><span class="spinner-border spinner-border-sm"></span>끝 페이지</a>	
				</c:if>
				</td>
				<tr>
					<td colspan="2" class="text-right">
						<select name="pageSize" id="pageSizeChange" onchange="pageSizeChange()">
							<option value="5"><c:if test="${pageSize != 5} ">selected</c:if>5</option>
							<option value="10"><c:if test="${pageSize != 10} ">selected</c:if>10</option>
							<option value="15"><c:if test="${pageSize != 15} ">selected</c:if>15</option>
						</select>
					</td>
				</tr>
				<td></td>
			</tr>
			</table>
			<c:set var="no" value="${fn:length(vos)}" />
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<table class="table table-bordered">
				<tr>
					<th class="col-2">No.${curScrStartNo}
					<c:if test="${sAdmin == 'OK' || sName == vo.name}">
						<a href="javascript:delCheck(${vo.idx})" class="btn btn-outline-danger ml-2">사악제에</a></th>									
					</c:if>			
						<td class="text-right row-2 pr-5"><b><font color="darkred">작성자ip : ${vo.hostIp}</font></b></td>	
				</tr> 
				<tr>
					<th class="table-primary">성명</th>
					<td>
			 		<c:if test="${vo.hostIp == '192.168.50.20'}">선생님 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.51'}">이수연 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.52'}">김성현 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.53'}">최민영 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.54'}">윤서경 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.55'}">성민지 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.57'}">조현서 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.58'}">안소은 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.59'}">탁민아 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.60'}">이규희 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.61'}">심지언 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.63'}">김도완 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.64'}">관리자</c:if>
					<c:if test="${vo.hostIp == '192.168.50.66'}">김한나 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.68'}">박영서 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.69'}">배민재 : ${vo.name}</c:if>
					<c:if test="${vo.hostIp == '192.168.50.70'}">김은하 : ${vo.name}</c:if>
					
					<c:if test="${vo.hostIp != '192.168.50.20' && vo.hostIp != '192.168.50.51' &&
					vo.hostIp != '192.168.50.52' && vo.hostIp != '192.168.50.53' && vo.hostIp != '192.168.50.54' &&
					vo.hostIp != '192.168.50.55' && vo.hostIp != '192.168.50.57' && vo.hostIp != '192.168.50.58' &&
					vo.hostIp != '192.168.50.59' && vo.hostIp != '192.168.50.60' && vo.hostIp != '192.168.50.61' &&
					vo.hostIp != '192.168.50.63' && vo.hostIp != '192.168.50.64' && vo.hostIp != '192.168.50.66' &&
					vo.hostIp != '192.168.50.68' && vo.hostIp != '192.168.50.69' && vo.hostIp != '192.168.50.70'}">${vo.name}</c:if>
					<%-- ${vo.name} --%>
					</td>
					</tr>
					<tr>
					<th class="table-success">방문일자</th>
					<td>${fn:substring(vo.visitDate, 0, 19)}</td>
				</tr>
				<tr>
					<th class="table-secondary">메일주소</th>
					<td colspan="3">
						<%-- <c:if test="${vo.email == '' || vo.email == null}">없음</c:if> 
						 <c:if test="${vo.email != '' && vo.email != null}">${vo.email}</c:if> --%>
						<c:if test="${empty vo.email || fn:length(vo.email) < 6 || fn:indexOf(vo.email, '@') == -1 || fn:indexOf(vo.email, '.') == -1}">없음</c:if>
						<c:if test="${!empty vo.email && fn:length(vo.email) >= 6 && fn:indexOf(vo.email, '@') != -1 && fn:indexOf(vo.email, '.') != -1}">${vo.email}</c:if>
					</td>
				</tr>
				<tr>
					<th class="table-warning">페이지링크</th>
					<td colspan="3">
						<c:if test="${empty vo.homePage || fn:length(vo.homePage) < 10 || fn:indexOf(vo.homePage, '.') == -1}">없음</c:if>
						<c:if test="${!empty vo.homePage && fn:length(vo.homePage) >= 10 && fn:indexOf(vo.homePage, '.') != -1}"><a href="${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
					</td>
				</tr>
				<tr>
					<th class="table-danger">방문소감</th>
					<td colspan="3">${fn:replace(vo.content, nl ,"<br/>")}</td>
				</tr>
			</table>		
			<br/>
			<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
		</c:forEach>
		<p><br/></p>
		<br/>
		<!-- 블럭페이지 시작!! -->
		<ul class="pagination">
			<li class="page-item">
		  <c:if test="${pag > 1}"><a class="page-link" href="${ctp}/GuestList?pag=1&pageSize=${pageSize}">First</a><li class="page-item"></li></c:if>
		 	<c:if test="${curBlock > 0}"><a class="page-link" href="${ctp}/GuestList?pag=${((curBlock-1) * blockSize)  + 1}&pageSize=${pageSize}">Before</a><li class="page-item">1</li></c:if>	
		  <li class="page-item active">
		  <c:forEach var="i" begin="${(curBlock*blockSize) + 1}" end="${(curBlock * blockSize) + blockSize}" varStatus="st">
				<c:if test="${i <= totPage && i == pag}"><strong><a class="page-link" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></strong></c:if>
				<c:if test="${i <= totPage && i != pag}"><a class="page-link" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></c:if>
			</c:forEach>
		  <c:if test="${curBlock < lastBlock}"><a class="page-link" href="${ctp}/GuestList?pag=${(curBlock + 1) * blockSize + 1}&pageSize=${pageSize}">After</a><li class="page-item"></li></c:if>
		  <c:if test="${pag < totPage}"><a class="page-link" href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" class="ml-2">Last</a><li class="page-item">Next</li></c:if>
			<li class="page-item active">
		</ul>
		
		
		
		
	<%-- 	<div class="text-center">
			<c:if test="${pag > 1}"><a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}" class="mr-2">First</a></c:if>
			<c:if test="${curBlock > 0}"><a href="${ctp}/GuestList?pag=${((curBlock-1) * blockSize)  + 1}&pageSize=${pageSize}">Before</a></c:if>		
				<c:forEach var="i" begin="${(curBlock*blockSize) + 1}" end="${(curBlock * blockSize) + blockSize}" varStatus="st">
					<c:if test="${i <= totPage && i == pag}"><strong><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></strong></c:if>
					<c:if test="${i <= totPage && i != pag}"><a href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">[${i}]</a></c:if>
				</c:forEach>
			<c:if test="${curBlock < lastBlock}"><a href="${ctp}/GuestList?pag=${(curBlock + 1) * blockSize + 1}&pageSize=${pageSize}">After</a></c:if>		
			<c:if test="${pag < totPage}"><a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" class="ml-2">Last</a></c:if>
		</div> --%>
		<!-- 블럭페이지 끝!! -->
	</div>
<p><br/></p>
</body>
</html>