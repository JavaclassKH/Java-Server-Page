<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileDownload.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fileDelete(fileName) {
			$.ajax({
				url : "FileDelete.st",
				type : "post",
				data : {fileName : fileName},
				success : function(res) {
					if(res != "0") {
						alert("삭제완료");
						location.reload();						
					}
					else {
						alert("삭제실패");
					}
				},
				error : function() {
					alert("삭제전송오류");
				}
			});
		}
		
 		function filesDelete() {
			let fileNamesArr = $("input[name='[]']");
			fileNamesArr += document.getElementById("fileNames").value + "/";
		} 
	
	
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h2>저장된 파일 정보 <input type="button" value="선택파일삭제" onclick="filesDelete()" class="btn btn-danger ml-2" /></h2><br/>
	  <hr/>
	  <c:forEach var="file" items="${files}" varStatus="st">
	  	<input type="checkbox" name="fileNames" id="fileNames" value="${file}" /> &nbsp;&nbsp;
	    ${st.count}. <a href="${ctp}/images/pdsTest/${file}" download="${file}">${file}</a>
	    <input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger btn-sm ml-3" />
	    <br/>
	    <c:set var="fNameArr" value="${fn:split(file,'.')}"/>
	    <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
	    <font color="blue">
		    <c:if test="${extName == 'zip'}">압축파일</c:if>
		    <c:if test="${extName == 'ppt' || extName == 'pptx'}">파워포인트파일</c:if>
		    <c:if test="${extName == 'xls' || extName == 'xlsx'}">엑셀파일</c:if>
	    </font>
	    <c:if test="${extName == 'jpg' || extName == 'png' || extName == 'gif'}">
	      <img src="${ctp}/images/pdsTest/${file}" width="150px" class="mt-1" />
	    </c:if>
	    <br/><br/>
	  </c:forEach>
	  <hr/>
	  <p>
	    <input type="button" value="돌아가기" onclick="location.href='FileUpload4.st';" class="btn btn-success"/>
	  </p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>