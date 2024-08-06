<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>calander2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
	
	#td1,#td8, #td15, #td22, #td29, #td36 {
		color: red;
	}
	
	#td7,#td14, #td21, #td28, #td35, #td42 {
		color: blue;
	}
	
	.today {
		background-color: white;
		color: #fff;
		font-weight: bold;
	}
	</style>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<div class="text-center">
			<button type="button" title="이전연도" onclick="location.href='Calendar2.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm">&lt;	&lt;</button>	
			<button type="button" title="이전월" onclick="location.href='Calendar2.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm">&lt;</button>	
			<font size="5px">${yy}년 ${mm+1}월</font>
			<button type="button" title="다음월" onclick="location.href='Calendar2.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm">&gt;</button>	
			<button type="button" title="다음년도" onclick="location.href='Calendar2.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm">&gt;	&gt;</button>	
			<button type="button" title="오늘날짜" onclick="location.href='Calendar2.st';" class="btn btn-secondary btn-sm">★</button>	
		</div>
		<br/>
		<div class="text-center">
			<table class="table table-border" style="height:450px;">
				<tr class="table-dark text-dark">
					<th style="width:15%; color:red; vertical-align:middle;">SUN</th>
					<th style="width:14%; vertical-align:middle;">MON</th>
					<th style="width:14%; vertical-align:middle;">TUE</th>
					<th style="width:14%; vertical-align:middle;">WED</th>
					<th style="width:14%; vertical-align:middle;">THU</th>
					<th style="width:14%; vertical-align:middle;">FRI</th>
					<th style="width:15%; color:blue; vertical-align:middle;">SAT</th>
				</tr>
				<tr>  <!-- 시작일 이전을 공백으로 처리! 5월의 시작요일이 수요일(4)이니 일,월,화 칸을 공백으로 처리 -->
					<c:forEach var="prevDay" begin="${prevLastDay - (startWeek - 2)}" end="${prevLastDay}" >
						<td style="font-size:0.73em; color:#ccc; text-align:left;">${preYear} - ${preMonth+1} - ${prevDay} </td>
					</c:forEach>
					<!-- 해당 월의 1일부터 startWeek의 위치부터 출력하기 시작한다, 날짜는 1씩 증가 7칸이 될 때 <br/>처리 -->
					<c:set var="cell" value="${startWeek}" />
					<c:forEach begin="1" end="${lastDay}" varStatus="st">
						<c:set var="todaySw" value="${toYear == yy && toMonth == mm && toDay == st.count ? 1 : 0}" />
						<td id="td${cell}" ${todaySw == 1 ? 'class=today' : ''}>${st.count}</td>
						<c:if test="${cell % 7 == 0}"><tr></tr></c:if> 
						<c:set var="cell" value="${cell + 1}" />
					</c:forEach>
					
					<!-- 마지막일 이후를 다음 일자로 -->
					<c:if test="${(cell - 1) % 7 != 0}">
						<c:forEach begin="${nextStartWeek}" end="7" varStatus="st">
							<td style="font-size:0.73em; color:#ccc; text-align:left;">${nextYear} - ${nextMonth+1} - ${st.count} </td>
						</c:forEach>
					</c:if>
				</tr>
			</table>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>