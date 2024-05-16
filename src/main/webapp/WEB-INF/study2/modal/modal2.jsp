<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>modal2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
	
		function fCheck1(name) {
			$("#myModal2 #modalName1").text(name);
		}
		
		function fCheck2(name) {
			$("#myModal2 #modalName1").text(name);
		}
	
		function fCheck3() {
			let mid = myform.mid3.value;
			location.href="Modal2.st?mid="+mid;
			$("#myModal3 #modalMid3").text('${mVo.name}');
		}
		
		function fCheck4(name, mid, nickName, content) {
			$("#myModal4 #modalName").text('${mVo.name}');
			$("#myModal4 #modalMid").text('${mVo.mid}');
			$("#myModal4 #modalNickName").text('${mVo.nickName}');
			$("#myModal4 #modalContent").text('${mVo.content}');
		
		}
		
		function nameCheck() {
			let mid = document.getElementById("mid").value;
			
		}
		
		
		
		
	</script>	
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>Modal Practice2</h1>
		<hr/><br/>
		<form name="myform" class="form-control">
			 아이디 : 
			<div>
				<input type="text" name="mid3" value="sona123" class="form-control mb-3"/>
			</div>
			<input type="button" value="출력" class="btn btn-success btn-sm mr-1" data-toggle="modal" data-target="#myModal1" />
			<a href="#" onClick="fCheck2('유소나')" class="btn btn-secondary btn-sm mr-1" data-toggle="modal" data-target="#myModal2">폼내용출력2</a>
			<a href="#" onClick="fCheck3()" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#myModal3">폼내용출력3</a>
			<a href="#" onClick="fCheck4('${mVo.name}','${mVo.mid}','${mVo.nickName}','${mVo.content}')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal4">폼내용출력4</a>
		</form>

	
	<!-- The Modal -->
	<div class="modal fade" id="myModal1">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					성명1 : <span id="modalName1"></span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">어마나</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					아이디3 : <span id="modalMid3"></span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal4">
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
						아이디 : <span id="modalMid"></span><br/>
						성명 : <span id="modalName"></span><br/>
						닉네임 : <span id="modalNickName"></span><br/>
						글 내용 : <span id="modalContent"></span>
						
						
						<!-- 아이디 : 
						<input type="text" name="mid" id="mid" placeholder="Enter your id" required class="form-control mb-6 mr-3" />
						<input type="button" value="성명확인" onclick="nameCheck()" class="btn btn-info btn-sm form-control" />
						<a href="https://www.w3schools.com/" target="_blank"><font color="gold">공부하러가기</font></a> -->
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</div>
	
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>