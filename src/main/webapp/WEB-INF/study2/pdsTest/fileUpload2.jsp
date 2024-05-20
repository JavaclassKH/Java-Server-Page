<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		function fCheck() {
			let fName1 = document.getElementById("file1").value;
			let fName2 = document.getElementById("file2").value;
			let fName3 = document.getElementById("file3").value;

			let ext1 = fName1.substring(fName1.lastIndexOf(".") + 1).toLowerCase();
			let ext2 = fName2.substring(fName2.lastIndexOf(".") + 1).toLowerCase();
			let ext3 = fName3.substring(fName3.lastIndexOf(".") + 1).toLowerCase();
			
			let maxSize = (1024 * 1024) * 2;    // 기본 단위는 Byte. 10MB허용
			
			if(fName1.trim() == "" || fName2.trim() == "" || fName3.trim() == ""){
				alert("업로드할 파일을 선택하세요");
				return;
			}
			
			let fileSize1 = document.getElementById("file1").files[0].size;
			let fileSize2 = document.getElementById("file2").files[0].size;
			let fileSize3 = document.getElementById("file3").files[0].size;
			
			if (fileSize1 > maxSize || fileSize2 > maxSize || fileSize3 > maxSize) {
				alert("한 파일당 최대 10MB까지 전송이 가능합니다");
			} 
			else if(ext1 != "jpg" && ext1 != "png" && ext1 != "gif" && ext1 != "ppt" && ext1 != "txt" && ext1 != "zip" && ext1 != "pptx" && ext1 != "doc" && ext1 != "pdf"  && ext1 != "xlsx") {
				alert("업로드 가능한 파일은 jpg/gif/png/zip/hwp/ppt/ppt/doc/pdf/xlsx/txt 입니다");
			}
			else if(ext2 != "jpg" && ext2 != "png" && ext2 != "gif" && ext2 != "ppt" && ext2 != "txt" && ext2 != "zip" && ext2 != "pptx" && ext2 != "doc" && ext2 != "pdf" && ext2 != "xlsx") {
				alert("업로드 가능한 파일은 jpg/gif/png/zip/hwp/ppt/ppt/doc/pdf/xlsx/txt 입니다");
			}
			else if(ext3 != "jpg" && ext3 != "png" && ext3 != "gif" && ext3 != "ppt" && ext3 != "txt" && ext3 != "zip" && ext3 != "pptx" && ext3 != "doc" && ext3 != "pdf" && ext3 != "xlsx") {
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
		
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<div>
			<h1 class="text-center"><b>파일 업로드 연습(멀티파일2)</b></h1>
			<p>COS라이브러리 이용한 파일 업로드</p>
			<div>( http://www.servlets.com/cos/ )</div>
			<br/>
			<hr/>
			<form name="myform" method="post" action="FileUpload2Ok.st" enctype="multipart/form-data">
				파일명 <input type="file" name="fName1" id="file1" onchange="imgCheck(this)" class="form-control-file border mb-2 p-2" />
				파일명 <input type="file" name="fName2" id="file2" onchange="imgCheck(this)" class="form-control-file border mb-2 p-2" />
				파일명 <input type="file" name="fName3" id="file3" onchange="imgCheck(this)" class="form-control-file border mb-2 p-2" />
				<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
				<!-- <input type="submit" value="파일전송" class="btn btn-success form-control" /> -->
				<input type="hidden" name="nickName" value="${sNickName}" />
			</form>
			<br/><hr/>
			<div id="demo"></div><br/><br/>
			<div></div><div></div><div></div>
 			<span class="text-center"><img id="demoImg" width="500px" class="mb-3" /></span>
			<br/>
			<div><a href="FileDownload.st" class="btn btn-primary btn-lg form-control">다운로드폴더로 이동</a></div>
		</div>
	</div><span class="containerEnd"></span>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>