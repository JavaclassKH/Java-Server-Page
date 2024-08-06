<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>wmInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fCheck() {
			let receiveId = myform.receiveId.value;
			let title = myform.title.value;
			let content = myform.content.value;

			if(receiveId.trim() == "") {
				alert("수신자 아이디 입력 요망");
				
			}
			else if(title.trim() == "") {
				alert("수신자 아이디 입력 요망");
				
			}
			else if(content.trim() == "") {
				alert("수신자 아이디 입력 요망");			
			}
			else {
				myform.submit();
			}
		}
		
	</script>
	
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="WmInputOk.wm">
		<table class="table table-border">
			<tr>
				<th>발신자</th>
				<td><input type="text" name="sendId" value="${sMid}" class="form-control" readonly /></td>
			</tr>
			<tr>
				<th>수신자<br/>
				[답장시 수신자 변경 불가]
				</th>
				<td> <!-- 주소록 만들어보기 -->
					<c:if test="${empty param.receiveId}">
						<input type="text" name="receiveId" placeholder="수신자 아이디 입력" class="form-control" />
					</c:if>
					<c:if test="${!empty param.receiveId}">
						<input type="text" name="receiveId" value="${param.receiveId}" class="form-control" readonly />
					</c:if>
				</td>
			</tr>
			<tr>
				<th>메세지 제목</th>
				<td> <!-- 주소록 만들어보기 -->
					<input type="text" name="title" placeholder="제목을 입력하세요" class="form-control" />
				</td>
			</tr>
			<tr>
				<th>메세지 내용 작성</th>
				<td> <!-- 주소록 만들어보기 -->
					<textarea rows="5" name="content" placeholder="내용을 입력하세요" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="전송" onclick="fCheck()" class="btn btn-info" />
					<input type="reset" value="초기화" class="btn btn-success" />
					<input type="button" value="돌아가기" onclick="history.back()" class="btn btn-danger" />
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>