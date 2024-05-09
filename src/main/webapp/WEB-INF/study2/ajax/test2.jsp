<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test2.jsp(ajax응용)</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function idCheck(mid) {
			if(mid == "") {
				alert("아이디 입력 plz");
				myform.mid.focus();
				return "0";
			}			
		}
		
		// 1개 값의 전달 처리
		function idCheck1() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck2_1",
				type : "get",
				data : {"mid" : mid},
				success : function(res) {
					$("#demo").html(res);
				},
				error : function() {
					alert("전송 Oryu");
				}
			});			
		}
		
		// vo 전달 처리(문자열 처리)
		function idCheck2() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck2_2",
				type : "get",
				data : {"mid" : mid},
				success : function(res) {
					$("#demo").html(res);
					let str = res.split("/");
					$("#imsiMid").html(str[0]);
					$("#imsiName").html(str[1]);
					$("#imsiAge").html(str[2]);
					$("#imsiGender").html(str[3]);
					$("#imsiAddress").html(str[4]);
				},
				error : function() {
					alert("전송 Oryu");
				}
			});
		}	
		
		// '키,값' 형식으로 전달처리
		function idCheck3() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck2_3",
				type : "get",
				data : {"mid" : mid},
				success : function(res) {
					// JSON 문자열 데이터
					console.log("res : " , res);
					/*$("#demo").html(res);*/ 
					let js = JSON.parse(res);
					
					// JSON형식의 문자열 데이터
					console.log("js : " , js);
					$("#imsiMid").html(js.mid);
					$("#imsiName").html(js.name);
					$("#imsiAge").html(js.age);
					$("#imsiGender").html(js.gender);
					$("#imsiAddress").html(js.address); 
				},
				error : function() {
					alert("전송 Oryu");
				}
			});
		}
		
	
		// '키,값' 형식으로 전달처리
		function idCheck4() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				url : "${ctp}/AjaxIdCheck2_4",
				type : "get",
				data : {"mid" : mid},
				success : function(res) {
 			    let js = JSON.parse(res);
					
					let tMid = "" , tName = "" ,tAge = "" ,tGender = "" ,tAddress = "";
					for(let j of js) {
						tMid += j.mid + "/";
						tName += j.name + "/";
						tAge += j.age + "/";
						tGender += j.gender + "/";
						tAddress += j.address + "/";
					}
					
						$("#imsiMid").html(tMid);
						$("#imsiName").html(tName);
						$("#imsiAge").html(tAge);
						$("#imsiGender").html(tGender);
						$("#imsiAddress").html(tAddress);  
					},
					error : function() {
						alert("전송 Oryu");
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
		<h1>AJAX 값 전달 연습</h1>
		<div>
			<form name="myform">
				아이디 : <input type="text" name="mid" id="mid" class="form-control"/>
				<div>
					<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-outline-success btn-lg mt-4" />
					<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-outline-primary btn-lg mt-4 ml-3" />
					<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-outline-secondary btn-lg mt-4 ml-3" />
					<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-outline-info btn-lg mt-4 ml-3" />
				</div>
			</form>
		</div>
			<br/>
			<div class="ml-5" id="demo">출력결과 </div><br/><br/>
			<div>아이디:&nbsp;&nbsp; <span id="imsiMid"></span></div>
			<div>성명:&nbsp;&nbsp; <span id="imsiName"></span></div>
			<div>나이:&nbsp;&nbsp; <span id="imsiAge"></span></div>
			<div>성별:&nbsp;&nbsp; <span id="imsiGender"></span></div>
			<div>주소:&nbsp;&nbsp; <span id="imsiAddress"></span></div>
		<a class="btn btn-outline-warning"><font color="red">돌아가기</font></a>	<p><br/></p>	
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>
















