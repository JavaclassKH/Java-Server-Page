<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		function fCheck() {
			let fName = document.getElementById("file").value;
			let maxSize = (1024 * 1024) * 2;    // 기본 단위는 Byte. 10MB허용
			let ext = fName.substring(fName.lastIndexOf(".") + 1).toLowerCase();
			
			if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요");
				return;
			}

			demo.innerHTML = fName;

			let fileSize = document.getElementById("file").files[0].size;
			if (fileSize > maxSize) {
				alert("최대 10MB까지 전송이 가능합니다");
			} else if (ext != "jpg" && ext != "png" && ext != "gif"
					&& ext != "ppt" && ext != "txt" && ext != "zip"
					&& ext != "pptx" && ext != "doc" && ext != "pdf"
					&& ext != "xlsx") {
				alert("업로드 가능한 파일은 jpg/gif/png/zip/hwp/ppt/ppt/doc/pdf/xlsx/txt 입니다");
			} else {
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
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<div>
			<h1 class="text-center"><b>파일 업로드 연습(싱글파일)</b></h1>
			<p>COS라이브러리 이용한 파일 업로드</p>
			<div>( http://www.servlets.com/cos/ )</div>
			<br/>
			<hr/>
			<form name="myform" method="post" action="FileUpload1Ok.st?" enctype="multipart/form-data">
				파일명 <input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control-file border mb-2 p-2" />
				<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
				<!-- <input type="submit" value="파일전송" class="btn btn-success form-control" /> -->
				<input type="hidden" name="nickName" value="${sNickName}" />
			</form>
			<br/><hr/>
			<div id="demo"></div><br/><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<span class="text-center"><img id="demoImg" width="500px" class="mb-3" /></span> 
			<br/>
			<div><a href="FileDownload.st" class="btn btn-primary btn-lg form-control">다운로드폴더로 이동</a></div>
		</div>
	</div><span class="containerEnd"></span>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>