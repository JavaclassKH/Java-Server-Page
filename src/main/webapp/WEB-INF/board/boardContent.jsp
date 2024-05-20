<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>WOW</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
	
		function boardDelete() {
			let ans = confirm("현재 글을 삭제하시겠습니까?");
			
			if(ans) {
				alert("삭제 진행중....");
				location.href = "BoardDelete.bo?idx=${vo.idx}";
			}
		}
		
		// 좋아요 증가 처리
		function goodCheck() {
			$.ajax({
				url : "BoardGoodCheck.bo",
				type : "post",
				data : { idx : ${vo.idx} },
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 증가 처리(중복불허)
		function goodCheck2() {
			$.ajax({
				url : "BoardGoodCheck2.bo",
				type : "post",
				data : { idx : ${vo.idx} },
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 증가 체크 처리(중복허용)
		function goodCheckP() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : { 
					idx : ${vo.idx},
					goodCnt : +1
				},
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 좋아요 감소 체크 처리(중복허용)
		function goodCheckM() {
			$.ajax({
				url : "BoardGoodCheckPlusMinus.bo",
				type : "post",
				data : { 
					idx : ${vo.idx},
					goodCnt : -1
				},
				success : function(res) {
					if(res != "0") location.reload();
				},
				error : function() {
					alert("");
				}
			});
		}
		
		// 신고사유에서 기타 항목 선택 시 띄우는 텍스트박스 보여주기
		function etcShow() {
			$("#complainTxt").show();
		}
		
		// 신고화면 선택 후 신고사항 전송하기
		function complainCheck() {
			if(!$("input[type=radio][name=complain]:checked").is(':checked')) {
				alert("신고 항목을 선택해주세요");
				return false;
			}
			if($("input[type=radio][id=complain7]:checked") && $("#complainTxt").val() == "") {
				alert("기타 신고 사유를 입력해주세요");
				return false;
			} 
			
			let cpContent = complainModalForm.complain.value;
			if(cpContent == '기타') cpContent += '/' + $("#complainTxt").val();

			alert("신고내용 : " + cpContent);
			
			let query = {
				part : "board",
				partIdx : ${vo.idx},
				cpMid : '${sMid}',
				cpContent : cpContent
			}
			
			$.ajax({
				url : "BoardComplainInput.ad",
				type : "post",
				data : query,
				success : function(res) {
					if(res != 0) {
						alert("신고가 완료되었습니다");
						location.reload();
					}
					else alert("신고에 실패했습니다. 다시 시도해주세요");
				},
				error : function() {
					alert("신고내용 전송에 오류가 발생했습니다.");
				}
			});
		}
		
		// 댓글달기
		function replyCheck() {
			let content = document.getElementById("content").value;
			if(content.trim() == "") {
				alert("댓글을 입력하세요");
				return;
			}
			let query = {
				boardIdx : ${vo.idx},
				mid : '${sMid}',
				nickName : '${sNickName}',
				hostIp : '${pageContext.request.remoteAddr}',
				content : content
			}
			$.ajax({
				url : "BoardReplyInput.bo",
				type: "post",
				data : query,
				success : function(res) {
					if(res != "0"){
						alert("댓글이 정상적으로 작성되었습니다");
						location.reload();
					}
					else {
						alert("[error187]댓글 작성에 실패하였습니다");
					}
				},
				error : function() {
					alert("전송 오류");
				}				
			});
		}
		
		// 댓글 삭제하기 
		function replyDelete(idx) {
			let ans = confirm("현재 댓글을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url : "BoardReplyDelete.bo",
				type : "post",
				data : {idx : idx},
				success : function(res) {
					if(res != "0"){
						alert("댓글 삭제가 완료되었습니다");
						location.reload();
					}
					else alert("댓글 삭제에 실패했습니다");
				},
				error : function() {
					alert("[error193] 댓글 삭제 실패");
				}
			});	
		}
		
			
	</script>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1 class="text-center mb-4"><b>게시판 글 조회</b></h1>
		<table class="table table-bordered">
			<tr>
				<th class="table-info">작성자</th>
				<td>${vo.nickName}</td>
				<th class="table-info">작성날짜</th>
				<td>${fn:substring(vo.wDate, 0, 16)}</td>
			</tr>
			<tr>
				<th class="table-info">글조회수</th>
				<td>${vo.readNum}</td>
				<th class="table-info">작성자 IP</th>
				<td>
					<c:if test="${vo.hostIp == '192.168.50.64'}">관리자IP</c:if>
					<c:if test="${vo.hostIp != '192.168.50.64'}">${vo.hostIp}</c:if>				
				</td>
			</tr>
			<tr>
				<th class="table-info">글 제목</th>
				<td colspan="3" class="text-center">${vo.title} &nbsp;&nbsp;
				(<a href="javascript:goodCheck()">❤</a>${vo.good}) &nbsp;
				(<a href="javascript:goodCheckP()">👍</a>) &nbsp;
				(<a href="javascript:goodCheckM()">👎</a>)
				(<a href="javascript:goodCheck2()"><font color="blue" size="4">♥</font></a>${vo.good}) &nbsp;
				</td>
			</tr>
			<tr>
				<th class="table-success">글 내용</th>
				<td colspan="3" style="height:250px;">
				${fn:replace(vo.content, newLine,'<br/>')}
				</td>
			</tr>
			<tr>
				<td colspan="4" class="table-info text-right">
				<div class="text-right">
					<c:if test="${empty flag}">
					<input type="button" value="목록" onclick="location.href='BoardList.bo?pag=${pag}&pageSize=${pageSize}'" class="btn btn-info mr-3 mt-1 text-center" />
					</c:if>
					<c:if test="${!empty flag}">
					<input type="button" value="목록" onclick="location.href='BoardSearchList.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}'" class="btn btn-info mr-3 mt-1 text-center" />
					</c:if>
					<c:if test="${sNickName == vo.nickName || sLevel == 0}">
						<input type="button" value="수정" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}'" class="btn btn-warning mr-3 mt-1" />	
						<input type="button" value="삭제" onclick="boardDelete()" class="btn btn-danger mt-1 mr-2" />					
					</c:if>
					<c:if test="${sNickName != vo.nickName}">
						<c:if test="${report == 'OK'}"><font color="red" size="4.5em"><b>신고된 글입니다</b></font></c:if>
						<c:if test="${report != 'OK'}">
							<input type="button" value="신고하기" class="btn btn-danger btn-lg mt-1" data-toggle="modal" data-target="#myComplainModal" />											
						</c:if>
					</c:if>
				</div>
				</td>
			</tr>
		</table>
		<br/>
		<!-- 이전,다음글 출력용! -->
		<table class="table table-borderless "> 
			<tr>
				<td>
					<c:if test="${!empty nextVo.title}">
						<a href="BoardContent.bo?idx=${nextVo.idx}"><b>다음 글</b> : ${nextVo.title}</a><br/>
					</c:if>						
					<c:if test="${!empty preVo.title}">
						<a href="BoardContent.bo?idx=${preVo.idx}"><b>이전 글</b> : ${preVo.title}</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
<p><br/></p>

	<!-- 댓글 시작! (리스트/입력) -->
	<div class="container">
		<!-- 댓글 리스트 출력 -->
		<table class="table table-hover text-center">
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>접속IP</th>
			</tr>
			<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
				<tr class="table table-info">
					<td>
						${replyVo.nickName}
						<c:if test="${sMid == replyVo.mid || sLevel == 0}">
							<a href="javascript:replyDelete(${replyVo.idx})" title="댓글삭제">X</a>
						</c:if>
					</td>
					<td class="text-left">${fn:replace(replyVo.content, newline, '<br/>')}</td>
					<td>${fn:substring(replyVo.wDate,0,10)}</td>
					<td><font color="gold">${replyVo.hostIp}</font></td>
				</tr>
			</c:forEach>
			<tr><td colspan="4" class="m-0 p-0"></td></tr>
		</table>			
		<!-- 댓글 입력창 -->
		<br/>
		<form name="replyForm">
			<table class="table table-warning table-center">
				<tr>
					<td style="width:85%" class="text-left">
						<span class="text-center"><b>댓글달기</b></span> 
						<textarea rows="4" name="content" id="content" class="form-control mt-3"></textarea>
					</td>
					<td style="width:15%">
						<br/>
						<p>작성자 : ${sNickName}</p>
						<p></p><br/>
						<p><input type="button" value="등록" onclick="replyCheck()" class="btn btn-danger btn-sm" /></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 댓글 끝! -->

	<!-- 신고전용 모달 -->
	<div class="modal fade" id="myComplainModal">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title text-center"><b>게시글 신고하기</b></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<strong><font color="red">신고사유선택</font></strong> 
					<hr/>
					<form name="complainModalForm">
						<div>&nbsp;<input type="radio" name="complain" id="complain1" value="광고,홍보,영리목적" />&nbsp; 광고,홍보,영리목적</div>	
						<div>&nbsp;<input type="radio" name="complain" id="complain2" value="욕설,비방,차별,혐오" />&nbsp; 욕설,비방,차별,혐오 </div>	
						<div>&nbsp;<input type="radio" name="complain" id="complain3" value="불법정보" />&nbsp; 불법정보</div>	
						<div>&nbsp;<input type="radio" name="complain" id="complain4" value="음란,청소년유해" />&nbsp; 음란물,청소년유해</div>	
						<div>&nbsp;<input type="radio" name="complain" id="complain5" value="개인정보노출,유포" />&nbsp; 개인정보노출,유포</div>	
						<div>&nbsp;<input type="radio" name="complain" id="complain6" value="도배,스팸" />&nbsp; 도배,스팸</div>												
						<div>&nbsp;<input type="radio" name="complain" id="complain7" value="기타" onclick="etcShow()" />&nbsp; 기타 </div>				
						<div id="etc"><textarea rows="3" id="complainTxt" class="form-control mt-2" style="display:none"></textarea></div>			
						<hr/>
						<input type="button" value="신고하기" onclick="complainCheck()" class="btn btn-danger btn-lg form-control" />					
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

<br/><br/>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>


<!-- <marquee scrollamount=1449>지&nbsp;&nbsp;&nbsp;나&nbsp;&nbsp;&nbsp;갑&nbsp;&nbsp;&nbsp;니&nbsp;&nbsp;&nbsp;다</marquee> -->