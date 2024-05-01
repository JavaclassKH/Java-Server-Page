<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl5_format.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>JSTL Format 연습</h1>
		<div class="text-right mt-2 mb-2">
			<button type="button" onclick="location.href='jstl1.jsp'" class="btn btn-outline-success btn-sm">JSTL Core라이브러리</button>
			<button type="button" onclick="location.href='jstl2.jsp'" class="btn btn-outline-primary btn-sm">JSTL반복문</button>
		  <button type="button" onclick="location.href='jstl3.jsp'" class="btn btn-outline-info btn-sm">JSTL 반복문응용</button>
			<button type="button" onclick="location.href='jstl4_function.jsp'" class="btn btn-outline-secondary btn-sm">JSTL Function</button>		
		</div>
		<hr/>
		<p>
		 사용용도 : 형식문자열을 표현(지정)할때 사용한다. (예: 쉼표, 통화량(화폐)단위, 백분율, 날짜) <br/><br/>
		 사용법 : < fmt : 명령어... value=" $ {값/변수}" pattern="표현패턴" [type="화폐단위문자"] > <br/>
		</p>
		<br/>
		<c:set var="won1" value="7654321" />
		<c:set var="won2" value="7654.321" />
		<div>
			won1 : ${won1}<br/>
			won2 : ${won2}
		</div>
		<br/><hr/><br/>
		1. 천단위 쉼표 표시 <br/>
		<fmt:formatNumber value="${won1}" /><br/>
		<fmt:formatNumber value="${won2}" /><br/>
		<fmt:formatNumber value="75840003498624346" /><br/><br/>
		1-1. 소수 이하 <br/>
		<fmt:formatNumber value="${won1}" pattern="0,000"/><br/>
		<fmt:formatNumber value="${won2}" pattern="0,000.0" /><br/>
		<fmt:formatNumber value="${won2}" pattern="0000.0" /><br/>
		<fmt:formatNumber value="75840003498624346" pattern="0,000" /><br/>
		<fmt:formatNumber value="${won1}" pattern="#,##0.0"/><br/><br/> <!-- 서식기호 '#'은 무효의 0을 표시하지 않는다 -->
		
		<br/><hr/><br/>
		2. 화폐 단위<br/>
		원화 : <fmt:formatNumber value="${won1}" type="currency" /><br/>
		미국 달러 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD"/><br/>
		일본 엔 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="JPY"/><br/>
		중국 위엔 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="CNY"/><br/>
		러시아 루블 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="RUB"/><br/>
		태국 밧 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="THB"/><br/>
		<br/><hr/><br/>
		
		3. 백분율 <br/>
		<c:set var="per" value="0.98765" />
		원본 : ${per} <br/> 
		백분율1 : <fmt:formatNumber value="${per}" type="percent" /> <br/>
		백분율2 : <fmt:formatNumber value="${per}" type="percent" pattern="0.000%" /> <br/>
		<br/><hr/><br/>
		
		4. <strong>날짜</strong><br/>
		오늘날짜1 : <%=new Date() %> <br/>
		<c:set var="today" value="<%=new Date() %>" />
		오늘날짜2 : ${today}<br/>
		오늘날짜3 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
		오늘날짜4 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd(E) HH:mm:ss"/><br/>
		현재시간1 : <fmt:formatDate value="${today}" pattern="HH시 mm분 ss초"/><br/>
		현재시간2 : <fmt:formatDate value="${today}" pattern="HH : mm :  ss"/><br/>
		현재시간3 : <fmt:formatDate value="${today}" pattern="HH - mm - ss초"/><br/>
		현재날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 E요일 HH시 mm분 ss초"/><br/>
		<br/><hr/><br/>

		5. 국가별설정(로케일)<br/><br/><br/>
		톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br/>
		톰캣 서버의 기본 로케일을 미국식으로 변경 : <fmt:setLocale value="en_US" />
		<fmt:formatNumber value="${won1}" type="currency" />
		<br/><hr/><br/>
		
		6. URL이용 : location.href == redirect(Core라이브러리에 있음)<br/>
		<br/><hr/><br/>
		
		7. import : Core라이브러리에 있음<br/>
		<%-- <c:import url="/include/bs4.jsp" /> --%>
		<br/><hr/><br/>		
		
	</div>
	<br/><hr/>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>