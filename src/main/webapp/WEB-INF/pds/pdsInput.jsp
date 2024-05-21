<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>pdsInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<script>
	'use strict';
    let cnt = 1;
    
    function fCheck() {
    	let fName1 = document.getElementById("fName").value;
    	let maxSize = 1024 * 1024 * 30;	
    	let title = $("#title").val();
    	
    	if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	else if(title.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	// 파일사이즈와 확장자 체크하기
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let imsiName = 'fName' + i;
    		if(isNaN(document.getElementById(imsiName))) {
    			let fName = document.getElementById(imsiName).value;
    			if(fName != "") {
    				fileSize += document.getElementById(imsiName).files[0].size;
			    	let ext1 = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    	    if(ext1 != 'jpg' && ext1 != 'gif' && ext1 != 'png' && ext1 != 'zip' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'doc' && ext1 != 'pdf' && ext1 != 'xlsx' && ext1 != 'txt') {
	    		    alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
	    		    return false;
	    	    }
    			}
    		}
    	}	
    		  		
	    if(fileSize > maxSize) {
	   		alert("업로e드 가능한 파일의 최대용량은 30MB입니다");
	   	}
    	
    	else {
    		myform.fSize.value = fileSize;
    		myform.submit(); 
    	}
    }
		
	// 파일박스 추가 (동적폼)
	function fileBoxAppend() {
		cnt++;
		let fileBox = '';
		fileBox += '<div id="fileBox'+cnt+'">';
		fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control file border mb-2" style="float:left; width:85%;" />';
		fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-2" style="width:10%;" />';
		fileBox += '</div>';
		$("#fileBox").append(fileBox); 
	}
	
	// 파일박스 삭제
	function deleteBox(cnt) {
		$("#fileBox"+cnt).remove();
		cnt--;
	}
	
	// 공개 선택시 비밀번호입력창 숨기기
	function pwdCheckClose() {
		$("#pwdDemo").hide();
		$("#pwd").var("");
	}
	
	// 비공개 선택시 비밀번호입력창 보이기
	function pwdCheckOpen() {
		$("#pwdDemo").show();
	}
	
</script>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mb-5">자 료 업 로 드 페 이 지</h1>
		<form name="myform" method="post" action="PdsInputOk.pds" enctype="multipart/form-data">
			<h2 class="text-center">자 료 올 리 기</h2>
			<br/>
			<div>
				<input type="button" value="파박추가" onclick="fileBoxAppend()" class="btn btn-info mb-2" />					
				<input type="file" name="fName1" id="fName" class="form-control-file border mb-2 p-2" />
			</div>
			<div id="fileBox"></div>
			<div class="mb-2 mt-1">
				게시자 ${sNickName}
			</div>
			<div class="mb-2 mt-1">
				제목  <input type="text" name="title" id="title" placeholder="자료의 제목을 입력하세요" class="form-control" required />
			</div>
			<div class="mb-2">
				내용 <textarea rows="5" name="content" id="content" placeholder="자료의 설명을 입력하세요" class="form-control"></textarea>
			</div>
			<div class="mb-2">
				분류 <select name="part" id="part" class="form-control">
					<option ${part == "전체" ? "selected" : ""}>전체</option>
					<option ${part == "학습" ? "selected" : ""}>학습</option>
					<option ${part == "여행" ? "selected" : ""}>여행</option>
					<option ${part == "음식" ? "selected" : ""}>음식</option>
					<option ${part == "기타" ? "selected" : ""}>기타</option>
				</select>
			</div>
			<div class="mb-2">
				공개여부
				공개&nbsp;&nbsp; <input type="radio" name="openSw" onclick="pwdCheckClose()" value="공개" class="mr-3" checked />
				비공개&nbsp;&nbsp; <input type="radio" name="openSw" onclick="pwdCheckOpen()" value="비공개" />
				<div id="pwdDemo" style="display:none; width:200px" class="mt-2">
					다운로드 전용 비밀번호
					<input type="password" name="pwd" id="pwd" />
				</div>
			</div>			
			<br/>
			<div> 
				<input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-success mr-1" />
				<input type="reset" value="다시작성" class="btn btn-warning mr-1" />
				<input type="button" value="돌아가기" onclick="location.href='PdsLists.pds?part=${part}';" class="btn btn-info" />
			</div>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
			<input type="hidden" name="mid" value="${sMid}" />
			<input type="hidden" name="nickName" value="${sNickName}" />
			<input type="hidden" name="fSize" value="" />
		</form>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>