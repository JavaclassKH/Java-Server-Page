<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ScrollStudy.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		span {
			font-weight: bold;
		}
	
		.sample .box {
			margin: 20px auto;
			width: 400px;
			height: 200px;
			background-color: beige;
			border: 2px double #483; 
			padding: 20px;
			overflow: auto;
		}
		.sample .small-box {
			width: 500px;
			height: 300px;
			background-color: aqua;
			border: 1px dashed #483; 
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
	</style>
	<script>
		'use strict';
		$(function() {
			const box = document.querySelector(".sample .box");
			
			// box 스크롤시킬때 내용 정보 수집
			box.addEventListener("scroll", () => {
				let x = box.scrollLeft;     // 스크롤바의 x축 시작좌표
				let y = box.scrollTop;     // 스크롤바의 y축 시작좌표
				
				document.querySelector("#disp .h").innerHTML = x;
				document.querySelector("#disp .v").innerHTML = y;
				
			});
			
			// 초기화 버튼
			document.querySelector(".sampleBtn .btn0").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft = 0;
				document.querySelector(".sample .box").scrollTop = 0;
			});			
			
			// 버튼
			document.querySelector(".sampleBtn .btn1").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft = 150;
			});
			
			// 버튼
			document.querySelector(".sampleBtn .btn2").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop = 150;
			});
			
			// 버튼
			document.querySelector(".sampleBtn .btn3").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft += 10;
			});
			
			// 버튼
			document.querySelector(".sampleBtn .btn4").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollLeft -= 10;
			});
			
			// 버튼
			document.querySelector(".sampleBtn .btn5").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop += 10;
			});
			
			// 버튼
			document.querySelector(".sampleBtn .btn6").addEventListener("click", (e) => {
				e.preventDefault();
				document.querySelector(".sample .box").scrollTop -= 10;
			});
			
			
			
			
		});
	

		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mt-2 mb-5">스크롤 학습하기</h1>
		<div class="sample text-center">
			<div class="box">
				<div class="small-box">
					<span class="text-primary">박스 안에서 스크롤바를 '상하좌우' 로 이동해보세요</span>
				</div>
			</div>
		</div>
		<div class="text-danger text-center mt-2" id="disp">
			<span class="h">0</span> &nbsp;/&nbsp;
			<span class="v">0</span>
		</div>
		<hr/>
		<div class="sampleBtn">
			<div>
				<input type="button" value="초기화" class="btn btn-success btn-lg btn0 mb-1" />
			</div>
			<div>
				<input type="button" value="x+150" class="btn btn-primary btn-lg btn1 mb-1 mr-2" />				
				<input type="button" value="y+150" class="btn btn-outline-primary btn2 btn-lg mb-1" />				
			</div>
			<div>
				<input type="button" value="x+10" class="btn btn-primary btn-lg btn3 mb-1 mr-2" />				
				<input type="button" value="x-10" class="btn btn-outline-primary btn4 btn-lg mb-1" />				
			</div>
			<div>
				<input type="button" value="y+10" class="btn btn-primary btn-lg btn5 mb-1 mr-2" />				
				<input type="button" value="y-10" class="btn btn-outline-primary btn6 btn-lg mb-1" />				
			</div>
		</div>
	</div>
<p><br/></p>
</body>
</html>