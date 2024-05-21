<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload3.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
			function fCheck() {
				let fName1 = document.getElementById("file1").value;
				let ext1 = fName1.substring(fName1.lastIndexOf(".") + 1).toLowerCase();
				let maxSize = (1024 * 1024) * 2;    
				
				if(fName1.trim() == "") {
					alert("업로드할 파일을 선택하세요");
					return;
				}
				
				let fileSize1 = document.getElementById("file1").files[0].size;				
				if (fileSize1 > maxSize) {
					alert("한 파일당 최대 10MB까지 전송이 가능합니다");
				} 
				else if(ext1 != "jpg" && ext1 != "png" && ext1 != "gif" && ext1 != "ppt" && ext1 != "txt" && ext1 != "zip" && ext1 != "pptx" && ext1 != "doc" && ext1 != "pdf"  && ext1 != "xlsx") {
					alert("업로드 가능한 파일은 jpg/gif/png/zip/hwp/ppt/ppt/doc/pdf/xlsx/txt 입니다");
				}
				else {
					myform.submit();
				}			
			}

		// 선택한 그림 미리보기
		function imgCheck(e) {
			if (e.files && e.files[0]) {
				let reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("demoImg").src = e.target.result;
				}
				reader.readAsDataURL(e.files[0]);
			}
		}
		
		// 파일박스 추가 (동적폼)
		let cnt = 1;
		function fileBoxAppend() {
			cnt++;
			let fileBox = '';
			fileBox += '<div id="fileBox'+cnt+'">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control file border mb-2" style="float:left; width:85%;" />';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-2" style="width:10%;" />';
			fileBox += '</div>';
			$("#fileBox").append(fileBox); // html() text() append()
		}
		
		// 파일박스 삭제
		function deleteBox(cnt) {
			$("#fileBox"+cnt).remove();
		}
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<div>
			<h1 class="text-center"><b>파일 업로드 연습(멀티파일3)</b></h1>
			<p>COS라이브러리 이용한 파일 업로드</p>
			<div>( http://www.servlets.com/cos/ )</div>
			<br/>
			<hr/>
			<form name="myform" method="post" action="FileUpload3Ok.st" enctype="multipart/form-data">
				<span style="text-align:center">파일명</span> 
				<div>
					<input type="button" value="파박추가" onclick="fileBoxAppend()" class="btn btn-info mb-2" />					
					<input type="file" name="fName1" id="file1" onchange="imgCheck(this)" class="form-control-file border mb-2 p-2" />
				</div>
				<div id="fileBox"></div>
				<div>
					<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
					<input type="hidden" name="nickName" value="${sNickName}" />
				</div>
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