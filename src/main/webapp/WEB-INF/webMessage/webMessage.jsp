<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>webMessage.jsp</title>
	<jsp:include page="/include/bs4.jsp" />	
	<script>
		'use strict';	
		
		function wmDeleteAll() {
			let ans = confirm("휴지통 비우기를 진행하시겠습니까?");
			if(!ans) {
				alert("휴지통 비우기를 취소하셨습니다");
				return;
			}
			$.ajax({
				url : "WmDeleteAll.wm",
				type : "post",
				success : function(res) {
					if(res != "0") {
						alert("휴지통 비우기가 완료되었습니다");
						location.reload();
					}
					else {
						alert("휴지통 비우기 실패하였습니다");
					}
				},
				error : function() {
					alert("휴지통 비우기 전송오류");
				}
			});
		}
	
	</script>	
	<style>
	
		#leftWindow {
			float: left;
			width: 27%;
			height: 520px;
			text-align: center;
			background-color: #dcd;
		}
		
		#rightWindow {
			float: left;
			width: 73%;
			height: 520px;
			text-align: center;
			background-color: #efe;
			overflow: auto;
		}
		
		#footerTopMargin {
			clear: both;
			margin: 10px;
		}
		
		h2 {
		 text-align: center;
		}
		
		h3 {
		 text-align: center;
		}
		
	</style>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class="container">
	<h2>메세지관리</h2>
	<div>(현재접속계정 : <font color="gold"><b>${sMid}</b></font>)</div>
	<div id="leftWindow">
		<p></p>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=0">메세지 작성</a></p><br/>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=1&mFlag=11">받은 메세지</a></p><br/>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=2">신규 메세지</a></p><br/>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=3&mFlag=13">보낸 메세지</a></p><br/>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=4">수신확인</a></p><br/>
		<p><a class="btn-btn link" href="WebMessage.wm?mSw=5&mFlag=15">휴지통 목록</a></p><br/>
		<p><a class="btn-btn link" href="javascript:wmDeleteAll()">휴지통비우기</a></p>
	</div>
	<div id="rightWindow">
		<p>
			<c:if test="${mSw == 0}">
				<h3><b>메세지 작성</b></h3>
				<jsp:include page="wmInput.jsp" />
			</c:if>
			<c:if test="${mSw == 1}">
				<h3>받은 메세지</h3>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${mSw == 2}">
				<h3>신규 메세지</h3>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${mSw == 3}">
				<h3>보낸 메세지</h3>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${mSw == 4}">
				<h3>수신 확인</h3>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${mSw == 5}">
				<h3>휴지통 목록</h3>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${mSw == 6}">
				<h3>메세지 내용보기</h3>
				<jsp:include page="wmContent.jsp" />
			</c:if>
		</p>
	</div>
</div>
<div id="footerTopMargin">&nbsp;</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>