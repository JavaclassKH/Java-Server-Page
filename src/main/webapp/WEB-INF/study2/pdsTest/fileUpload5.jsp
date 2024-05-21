<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload5.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fCheck() {
		   
			let fName = document.getElementById("file").value;
			let ext = "";
			let fileSize = 0;
			let maxSize = 1024 * 1024 * 10; // 기본 단위 : Byte,   1024 * 1024 * 10 = 10MByte 허용

			if (fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return false;
			}

			let fileLength = document.getElementById("file").files.length; // 선택한 파일의 갯수

			for (let i = 0; i < fileLength; i++) {
				fName = document.getElementById("file").files[i].name; // 선택된 1개의 파일이름가져오기
				ext = fName.substring(fName.lastIndexOf(".") + 1).toLowerCase();
				fileSize = document.getElementById("file").files[i].size;
				if (ext != 'jpg' && ext != 'gif' && ext != 'png'
						&& ext != 'zip' && ext != 'hwp' && ext != 'ppt'
						&& ext != 'pptx' && ext != 'doc' && ext != 'pdf'
						&& ext != 'xlsx' && ext != 'txt') {
					alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
				}
			}

			if (fileSize > maxSize) {
				alert("업로드 파일의 최대용량은 10MByte입니다.");
			} else {
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
			<h1 class="text-center"><b>파일 업로드 연습(싱글)</b></h1>
		  <h4>자바 서블릿의 Part객체를 이용한 파일 업로드</h4>
		  <div>(javax.servlet.http.Part)</div>
			<br/>
			<hr/>
			<form name="myform" method="post" action="FileUpload5Ok.st" enctype="multipart/form-data">
				파일명
				<div>
					<input type="file" name="fName" id="file" class="form-control-file border mb-2 p-2" />
				</div>
				<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
				<input type="hidden" name="fNames" id="fNames" />
			</form>
			<br/><hr/>
			<br/>
			<div><a href="FileDownload.st" class="btn btn-primary btn-lg form-control">다운로드폴더로 이동</a></div>
			<hr/>
			<br/>
			<hr/>
			<h1 class="text-center"><b>파일 업로드 연습(멀티파일4)</b></h1>
			<p>자바 서블릿을 part객체를 이용한 파일 업로드</p>
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
				<input type="hidden" name="fNames" id="fNames" />
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