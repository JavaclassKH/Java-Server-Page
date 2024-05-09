<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>hoewonMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		th {
			background-color: #ede;
			text-align: center;
		}
	</style>
	<script>
		'use strict';
	
		 	// 회원 가입처리
	    function hInput() {
	    	let mid = $("#mid").val().trim();
	    	let pwd = $("#pwd").val().trim();
	    	let name = $("#name").val().trim();
	    	let age = $("#age").val().trim();
	    	let gender = myform.gender.value;
	    	let address = $("#address").val().trim();
	    	
	    	if(mid == "") {
	    		alert("아이디를 입력하세요");
	    		$("#mid").focus();
	    		return false;
	    	}
	    	else if(pwd == "") {
	    		alert("비밀번호를 입력하세요");
	    		$("#pwd").focus();
	    		return false;
	    	}
	    	else if(name == "") {
	    		alert("성명을 입력하세요");
	    		$("#name").focus();
	    		return false;
	    	}
	    	else if(age == "") {
	    		alert("나이를 입력하세요");
	    		$("#age").focus();
	    		return false;
	    	}
	    	else if(address == "") {
	    		alert("주소를 입력하세요");
	    		$("#address").focus();
	    		return false;
	    	}
	    	
	    	let query = {
	    			mid     : mid,
	    			pwd     : pwd,
	    			name    : name,
	    			age     : age,
	    			gender  : gender,
	    			address : address
	    	}
	    	
	    	$.ajax({
	    		url  : "${ctp}/hoewonInput.st",
	    		type : "post",
	    		data : query,
	    		success:function(res) {
	    			if(res == "1") {
	    				alert("회원가입이 완료되었습니다");
	    				location.reload();
	    			}
	    			else {
	    				alert(res);
	    				$("#mid").focus();
	    			}
	    		},
	    		error : function() {
	    			alert("전송X");
	    		}
	    	});
	    }
		
		// 회원개별조회
		function hoewonSearch(idx) {
			$.ajax({
				url : "hoewonSearch.st",
				type : "post",
				data : {idx : idx},
				success : function(res) {
					let str = res.split("/");
					
					$("#mid").val(str[1]);
					$("#pwd").val(str[2]);
					$("#name").val(str[3]);
					$("#age").val(str[4]);
					if(str[5] == "남자") $("input[id=male]").prop("checked",true);
					else $("input[id=female]").prop("checked",true);
					$("#address").val(str[6]);
					
					/* $("#mid").arrt("readonly",true);  */
					
				},
				error : function() {
					alert("조회에 실패하였습니다");
				}
			});
		}
		
		// 회원 정보 수정
		function hUpdate() {
			let mid = $("#mid").val();
			let pwd = $("#pwd").val().trim();
			let name = $("#name").val().trim();
			let age = $("#age").val().trim();
			let gender = myform.gender.value;
			let address = $("#address").val().trim();

			if(pwd = "") {
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
			}
			else if(name = ""){
				alert("성명을 입력하세요");
				$("#name").focus();
			}
			else if(age = ""){
				alert("나이를 입력하세요");
				$("#age").focus();
			}
			else if(address = ""){
				alert("주소를 입력하세요");
				$("#address").focus();
			}
			
			let query = {
					mid : mid,
					pwd : pwd,
					name : name,
					age : age,
					gender : gender,
					address : address
			}
			
			$.ajax({
					url : "hoewonUpdate.st",
					type : "post",
					data : query,
					success : function(res) {
					
						$("#mid").val(str[1]);
						$("#pwd").val(str[2]);
						$("#name").val(str[3]);
						$("#age").val(str[4]);
						$("#address").val(str[6]);
						if(str[5] == "남자") $("input[id=male]").prop("checked",true);
						else $("input[id=female]").prop("checked",true);
						
						$("#hoewonList").load(location.href = ' #hoewonList'); // 부분리로드 
					
					},
					error : function() {
						alert("조회에 실패하였습니다");
					}
			});
		}
		
		// 회원 정보 삭제
		function hoewonDelete(idx) {
			let ans = confirm("선택하신 회원을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url : "${ctp}/hoewonDelete.st",
				type : "post",
				data : {idx : idx},
				success : function(res) {
					if(res != 0) {
						alert("회원정보가 삭제되었습니다");
						location.reload();
					}
				},
				error : function() {
					alert("삭제 실패");
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
		<h1><b>인증회원 회원정보 조회</b></h1><br/>
		<h2>AJAX를 이용한 CRUD 구현하기</h2>
			<form name="myform">
				<table class="table table-bordered dark">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="mid" id="mid" placeholder="Enter your id" autofocus class="form-control"/></td>
					</tr>				
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" id="pwd" class="form-control" /></td>
					</tr>				
					<tr>
						<th>성명</th>
						<td><input type="text" name="name" id="name" class="form-control" /></td>
					</tr>				
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" class="form-control" /></td>
					</tr>				
					<tr>	
						<th>성별</th>				
						<td>
							남자&nbsp; <input type="radio" name="gender" id="male" value="남자" checked />&nbsp;&nbsp;&nbsp;
							여자&nbsp; <input type="radio" name="gender" id="female" value="여자" />
						</td>
					</tr>					
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="button" value="회원등록" onclick="hInput()" class="btn btn-outline-success mr-3 p-2" />
							<input type="button" value="회원수정" onclick="hUpdate()" class="btn btn-outline-secondary mr-3 p-2" />
							<input type="button" value="전체보기" onclick="location.href='hoewonList.st'" class="btn btn-outline-info mr-3 p-2" />
							<input type="reset" value="다시입력" class="btn btn-outline-danger mr-3 p-2" />
						</td>
					</tr>				
				</table>
			</form>
			<p><br/></p>
			<hr/>
			<h2>회&nbsp;&nbsp;원&nbsp;&nbsp;전&nbsp;&nbsp;체&nbsp;&nbsp;리&nbsp;&nbsp;스&nbsp;&nbsp;트</h2>
			<div id="hoewonList">
				<table class="table table-hover text-center">
					<tr class="table-dark text-dark">
						<th>번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>성명</th>
						<th>나이</th>
						<th>성별</th>
						<th>주소</th>
						<th>비고</th>
					</tr>
					<c:forEach var="vo" items="${vos}" varStatus="st">
						<tr>
							<td>${vo.idx}</td>
							<td>${vo.mid}</td>
							<td>${vo.pwd}</td>
							<td>${vo.name}</td>
							<td>${vo.age}</td>
							<td>${vo.gender}</td>
							<td>${vo.address}</td>
							<td>
								<a href="javascript:hoewonSearch(${vo.idx})" class="btn btn-outline-success btn-sm"><font color="green">개별조회</font></a>
								<a href="javascript:hoewonDelete(${vo.idx})" class="btn btn-outline-danger btn-sm"><font color="red">삭제</font></a>
							</td>
						</tr>
					</c:forEach>
					<tr><td colspan="8" class="m-0 p-0"></td></tr>
				</table>
			</div>
			<div></div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>