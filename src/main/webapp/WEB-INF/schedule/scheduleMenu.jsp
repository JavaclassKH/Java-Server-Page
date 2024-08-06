<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>scheduleMenu.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		$(function() {
			$("#scheduleInputClose").hide();
		});
		
		function scheduleInputview() {
			let str = '<div id="scheduleInputForm">';
			str += '<form name="scheduleForm">';
			str += '<table class="table table-bordered">';
			str += '<tr>';
			str += '<th>일정분류</th>';
			str += '<td>';
			str += '<select name="part" class="form-control">';
			str += '<option value="">모임</option>';
			str += '<option value="">학습</option>';
			str += '<option value="">업무</option>';
			str += '<option value="">여행</option>';
			str += '<option value="">기타</option>';
			str += '</select>';
			str += '</td>';
			str += '</tr>';
			str += '<tr>';
			str += '<th>내용</th>';
			str += '<td>';
			str += '<textarea name="content" rows="3" class="form-control"></textarea>';
			str += '</td>';
			str += '</tr>';
			str += '<tr><td colspan="2" class="text-center">';
			str += '<input type="button" value="일정등록" title="일정등록" onclick="scheduleInputOk()" class="btn btn-primary form-control" />';
			str += '</td></tr>';
			str += '</table>';
			str += '</form>';
			str += '</div>';
			
			$("#scheduleInputView").hide();
			$("#scheduleInputClose").show();
			
			$("#demo").html(str);
		}
		
		function scheduleInputClose() {
			$("#scheduleInputView").show();
			$("#scheduleInputClose").hide();
			$("#scheduleInputForm").hide();
		}
		
		// 일정 등록하기
		function scheduleInputOk() {
			let part = scheduleForm.part.value;
			let content = scheduleForm.content.value; 
			
			if(content.trim() == "") {
				alert("일정을 입력해주세요");
				return;
			}
			
			let query = {
					mid = '${sMid}',
					sDate = '${ymd}',
					part : part,
					content : content
			}
			
			$.ajax({
				url : "ScheduleInputOk.sc",
				type : "post",
				data : query,
				success : function(res) {
					if(res != 0) {
						alert("일정 등록이 완료되었습니다");
						location.reload();
					}
					else {
						alert("일정 등록에 실패했습니다");
					},
					error : function() {
						alert("일정등록 전송 오류");
					}
				}
			});
		}
	
		// 일정 삭제하기 
		function scheduleDeleteCheck(idx) {
			let ans = confirm("선택한 일정을 삭제하시겠습니까?");
			if(!ans) {
				return;
			}
			else {
				$.ajax({
					url : "ScheduleDeleteOk.sc",
					type : "post",
					data : {idx : idx},
					success:function(res){
						if(res != 0) {
							alert("일정 삭제가 완료되었습니다");
							location.reload();
						}
						else {
							alert("일정 삭제에 실패했습니다");
						}
					},
					error : function() {
						alert("일정 삭제 전송오류");
					}
				});
				
			}
		}
		
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center">${ymd} Schedule</h1>
		<p>오늘의 일정은 총 ${scheduleCnt}개가 있습니다</p>
		<hr/>
		<div id="demo"></div>
		<c:if test="${scheduleCnt != 0}">
			<table class="table table-hover text-center">
				<tr class="table-dark text-primary">
					<th>일정번호</th>
					<th>일정분류</th>
					<th>일정내용</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td><font color="gold">${st.count}</font></td>
						<td>${vo.part}</td>
						<td>${vo.content}</td>
						<td>
							<input type="button" value="수정" onclick="scheduleUpdate()" class="btn btn-outline-warning btn-sm mr-1" />
							<input type="button" value="삭제" onclick="scheduleDeleteCheck()" class="btn btn-outline-danger btn-sm" />
						</td>
					</tr>
				</c:forEach>					
				<tr><td colspan="4" class="m-0 p-0"></td></tr>
			</table>
		</c:if>
		<div class="text-right">
			<input type="button" value="일정등록" onclick="scheduleInputview()" id="scheduleInputview" class="btn btn-outline-success mb-3" />
			<input type="button" value="일정닫기" onclick="scheduleInputClose()" id="scheduleInputClose" class="btn btn-outline-warning mb-3" />
			<c:set var="ymds" value="${fn:split(ymd,'-')}" ></c:set>
			<input type="button" value="돌아가기" onclick="location.href='Schedule.sc?yy=${ymds[0]}&mm=${ymds[1]-1}&';" class="btn btn-outline-danger mb-3" />
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>

















