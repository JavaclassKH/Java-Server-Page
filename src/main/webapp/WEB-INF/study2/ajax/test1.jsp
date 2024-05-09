<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test1.jsp(ajax)</title>
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
		
		// 동기식
		function idCheck0() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag != "0") location.href = "${ctp}/ajaxIdCheck0.st?mid="+mid;
		}
	
		// 비동기식(브라우저에서 제공하는 객체(XMLHTTPRequest)사용)
		function idCheck1() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;		
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "${ctp}/ajaxIdCheck1.st?mid="+mid);
			xhr.send();
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					demo.innerHTML = xhr.responseText;
				}				
			}
		}
				
		// 비동기식(fetch() 사용)
		function idCheck2() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;		
			
			fetch("${ctp}/ajaxIdCheck2.st?mid="+mid)
				/* .then((res) => res.json()) */
				.then((res) => console.log("res : " , res))
				.catch((error) => console.log("error : " , error));
		}
		
		// 비동기식(브라우저에서 제공하는 객체(XMLHTTPRequest)사용)
		function idCheck3() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;		
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "${ctp}/ajaxIdCheck1.st?mid="+mid);
			xhr.send();
			
			xhr.addEventListener("load", (e) => {
				console.log("e ->" , e);
				
				if(e.target.status == 200){
					demo.innerHTML = "검색 결과<br/>";
					demo.innerHTML += "검색한 아이디는 "+mid+" 입니다.<br/>";
					demo.innerHTML += "검색한 성명은 "+ e.target.responseText+" 입니다.";
				}
				else {
					demo.innerHTML = "<font-color='red'>검색서버 오류입니다</font>";
				}
			});
		}
		
		// 비동기식(AJAX 사용)
		function idCheck4() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;		
			
			// AJAX는 항상 (키,값)으로 넘긴다!
			$.ajax({
				url : "${ctp}/AjaxIdCheck1",
				type : "get", 
				data : {"mid" : mid}, 
				/* dataType : "json", */
				contextType : "application/json",
				charset : "UTF-8",
				timeout : 10000,
				beforeSend : function() {
					console.log("mid(전) : " , mid);
				},
				success : function(res) {
					let str = "<font color='blue'>검색 아이디 : "+mid+"<br/> 검색된 성명 : "+res+"</font>";
					$("#demo").html(str);
				},
				error : function() {
					alert("Fail");
				},
				complete : function() {
					console.log("mid(후) : " , mid);
				}
			});
		}
		
	
		// 비동기식(AJAX 사용2)
		function idCheck5() {
			let mid = myform.mid.value.trim();
			let flag = idCheck(mid);
			if(flag == "0") return false;		
			
			// AJAX는 항상 (키,값)으로 넘긴다!
			$.ajax({
				url : "${ctp}/AjaxIdCheck1",
				// type : "get", 
				data : {"mid" : mid}, 
				success : function(res) {
					let str = "<font color='red'>검색 아이디 : "+mid+"<br/> 검색된 성명 : "+res+"</font>";
					$("#demo").html(str);
				},
				error : function() {
					alert("Fail");
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
		<div>
			<form name="myform">
				아이디 : <input type="text" name="mid" id="mid" class="form-control" autofocus />
				<div>
					<input type="button" value="아이디검색(동기식)" onclick="idCheck0()" class="btn btn-success mt-4" />
					<input type="button" value="아이디검색(비동기식1)" onclick="idCheck1()" class="btn btn-primary mt-4 ml-3" />
					<input type="button" value="아이디검색(비동기식2)" onclick="idCheck2()" class="btn btn-secondary mt-4 ml-3" />
					<input type="button" value="아이디검색(비동기식3)" onclick="idCheck3()" class="btn btn-info mt-4 ml-3" />
					<input type="button" value="아이디검색(AJAX1)" onclick="idCheck4()" class="btn btn-warning mt-4 ml-3" />
					<input type="button" value="아이디검색(AJAX2)" onclick="idCheck5()" class="btn btn-danger mt-4 ml-3" />
				</div>
			</form>
			<br/>
			<div id=demo>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출력결과 <br/>
			입력아이디 : ${param.mid} / 성명 : ${param.name}</div><br/>
		</div> 
		<a class="btn btn-outline-warning"><font color="red">돌아가기</font></a></div>
		<p><br/></p>
		<hr/>
		<h1 class="text-center">HTTP통신</h1>
		<div>
		<pre class="text-left">
			- 동기식(Synchronous): 먼저 시작된 하나의 작업이 끝날때까지 다른 작업은 기다림, 작업이 끝나면 다른 작업이 시작
			- 비동기식(Asynchronous): 먼저 시작된 작업의 완료여부와 관계없이 새로운 작업을 시작하는 방식
			- 바닐라자바스크립트의 비동기식 : 브라우저의 XMLHttpRequest
			- ECMA6 자바스크립트의 비동기식 : 콜백함수, Promise, Promise를 활용한 async/await, 그리고 fetch()방식
			
			<font size="1em">AJAX</font>
			정식 명칭 : Asynchronous JavaScript and XML
			- 자바스크립트 라이브러리중 하나이며, 브라우저 객체인 XMLHttpRequest를 이용해 전체페이지를 고치지 않아도 
			  부분적인 페이지 일부만을 위한 데이터를 로드하는 기법이다.
			  즉, 자바스크립트를 이용하여 서버에 데이터를 요청할 때 비동기식으로 통신하는 방식
				과거에는 XML방식 선호, 지금은 JSON방식을 많이 사용
				
			<font size="1em">AJAX에서의 전송방식</font>	
			- GET : 데이터를 읽거나 주로 검색할 때 사용 
			- POST : 새로운 리소스를 생성할 때 사용
			- PUT : 리소스를 생성,업데이트할때 사용
			- DELETE : 지정된 리소스를 삭제할 때
		</pre>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>
















