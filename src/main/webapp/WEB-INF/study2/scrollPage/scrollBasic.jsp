<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>scrollBasic.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		let lastScroll = 0;
		let curPage = 1;
		
		$(document).scroll(function(){
			let currentScroll = $(this).scrollTop(); // 스크롤바 위쪽 시작위치
			let documentHeight = $(document).height(); // 화면에 표시되는 전체 문서의 높이
			let nowHeight = $(this).scrollTop() + $(window).height();
		
			// 스크롤이 아래로 내려갔을 때 이벤트 처리
			if(currentScroll > lastScroll) {
				if(documentHeight < (nowHeight + (documentHeight * 0.17))) {
					console.log("다음페이지 가져오기이");
					curPage++;
					getList(curPage);
				}
			}
			lastScroll = currentScroll;
		});
		
		// 리스트 불러오기 함수(ajax처리)
		function getList(curPage) {
			$.ajax({
				url : "ScrollPage.st",
				type : "post",
				data : {pag : curPage},
				success : function(res) {
					$("#list-wrap").append(res);
				}				
			});
		}		
		
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center text-dark">무한 스크롤 가즈아아아아아아아~</h1>
		<hr/>
		<section id="list-wrap">
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="card">
					<div class="card-body">
						${curScrStartNo}. &nbsp;<img src="${ctp}/images/7.jpg" width="140px" />					
					</div>
					<div class="card-footer">
						<h3>${vo.title}</h3>
						<div><p>${fn:substring(vo.wDate,0,11)}</p></div>
					</div>
			</div>
			<br/>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"></c:set>
			</c:forEach>			
		</section>
	</div>
<p><br/></p>
</body>
</html>