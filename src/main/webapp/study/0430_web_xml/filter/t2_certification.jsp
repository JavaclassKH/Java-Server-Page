<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t2_certification.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
	
	function certificationCheck() {
		let certification = myform.certification.value;
		if(certification == "" || certification.length != 4) {
			alert("인증코드 확인 요망(4자리)");
			return;
		}
		else { 
			location.href="${ctp}/j0430/TO2_Certification?admin=admin&u="+certification;
			myform.submit();
		}
	}
	
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%-- <%@ include file = "/include/nav.jsp" %> --%>
<p><br/></p>
	<div class="container">
		<h1>이곳은 인증코드발급장소임돠</h1>
		<form name="myform">
			<div><input type="text" name="certification" value="1234" class="form-control mt-2 mb-2" /></div>
			<div><input type="button" value="인증코드발급" onclick="certificationCheck()" class="btn btn-outline-success ml-10 mt-2" /></div>
		
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>