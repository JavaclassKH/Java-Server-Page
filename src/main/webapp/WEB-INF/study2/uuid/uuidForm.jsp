<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>uuidForm.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		let str = "";
		function uuidCheck() {
			$.ajax({
				url : "${ctp}/UuidProcess",
				type : "get",
				success : function(res) {
					str += res + "<br/>";
					demo.innerHTML = str;
				},
				error : function() {
					alert("Oryu!");
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
		<h1 class="text-center"><strong>UUID란?</strong></h1>
		<pre class="text-center"><b><font size="5em" color="green">
		UUID(Universally Unique IDentifier)는 네트워크상에서 고유성이 보장되는 id를 만들기 위한 규약이다.
		'거의 중복되는 확률이 0에 수렴하는, 매우 낮은 확률을 가지는 ID를 만드는 방법'을 표준화한 것이 UUID이다.
		UUID를 계속해서 생성해도 중복이 생길 가능성이 0에 가깝다.
		128Bit를 사용하며, 16진수로 32자로 표현된다. (8-4-4-4-12)
		example) 1234aDFa-6kfR-Ut6E-FKKK-KFJOotUIU04e
		</font></b></pre>
		<div>
			<form name="myform">
				<input type="button" value="UUID생성" onclick="uuidCheck(1)" class="btn btn-outline-success" />
				<input type="button" value="다시" onclick="location.reload()" class="btn btn-outline-danger" />
			</form>
		</div>
		<hr/>
		<div>
			출력결과<br/>
		<div id="demo"></div>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>