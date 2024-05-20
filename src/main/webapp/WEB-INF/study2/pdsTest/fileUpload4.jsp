<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload4.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		function fCheck() {
			let fName = document.getElementById("file").value;
			let ext = "";
			let maxSize = (1024 * 1024) * 2;    
			let fileSize = "";
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return;
			}
			
			let fileLength = document.getElementById("file").files.length;
			
			
			for(let i=0; i<fileLength; ; i++) {
				fName = document.getElementById("file").files[i].name;  // 선택된 i개의 파일 이름 가져오기
				ext = fName.substring(fName.lastIndexOf(".") + 1).toLowerCase();
				fileSize = document.getElementById("file").files[i].size;			
				else if(ext != "jpg" && ext != "png" && ext != "gif" && ext != "ppt" && ext != "txt" && ext != "zip" && ext != "pptx" && ext != "doc" && ext != "pdf"  && ext != "xlsx") {
					alert("업로드 가능한 파일은 jpg/gif/png/zip/hwp/ppt/ppt/doc/pdf/xlsx/txt 입니다");
				}				
			}
			
			
			if (fileSize > maxSize) {
				alert("한 파일당 최대 10MB까지 전송이 가능합니다");
			} 
			else {
				//alert("파일 전송");
				myform.submit();
			}			
		}
			
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<div>
			<h1 class="text-center"><b>파일 업로드 연습(멀티파일4)</b></h1>
			<p>COS라이브러리 이용한 파일 업로드</p>
			<div>( http://www.servlets.com/cos/ )</div>
			<br/>
			<hr/>
			<form name="myform" method="post" action="FileUpload4Ok.st" enctype="multipart/form-data">
				파일명
				<div>
					<input type="file" name="fName" id="file" multiple class="form-control-file border mb-2 p-2" />
				</div>
				<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
				<input type="hidden" name="nickName" value="${sNickName}" />
			</form>
			<br/><hr/>
			<br/>
			<div><a href="FileDownload.st" class="btn btn-primary btn-lg form-control">다운로드폴더로 이동</a></div>
		</div>
	</div><span class="containerEnd"></span>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>