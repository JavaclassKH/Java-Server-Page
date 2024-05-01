<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>JSTL(JSP Standard Tag Library) 연습</h1> 
		<div class="text-right mt-2 mb-2">
			<button type="button" onclick="location.href='jstl1.jsp'" class="btn btn-outline-success btn-sm">JSTL Core라이브러리</button>
			<button type="button" onclick="location.href='jstl3.jsp'" class="btn btn-outline-success btn-sm">JSTL 반복문응용</button>
			<button type="button" onclick="location.href='jstl4_function.jsp'" class="btn btn-outline-info btn-sm">JSTL 함수</button>
			<button type="button" onclick="location.href='jstl5_format.jsp'" class="btn btn-outline-secondary btn-sm">JSTL Formatting</button>
		</div>
		<hr/>
		<h3>JSTL 반복문(Core라이브러리 사용) : forEach사용</h3>
		<p>
			사용법1: <br/>
			< c : forEach var="변수명" begin="초기값" end="최종값" step="증감" varStatus="매개변수"></ c : forEach > <br/>
				- step이 1인 경우 생략이 가능하다<br/>
			사용법2: <br/>
			< c : forEach var="변수명" items = $ { 객체명/배열 } varStatus = "매개변수"> </ c : forEach ><br/>
			
			사용법3 : <br/>
			< c : forTokens var="변수" items=" $ {객체명/배열} " delims = "구분기호"></ c : forTokens ><br/><br/>
		</p>
		<p>사용법1 연습</p>
		<%-- <%for(int i=1; i<=10; i++) {} %> --%>
		<c:forEach var="i" begin="1" end="10" varStatus="st">
			${i} /
		</c:forEach>
		<br/><br/>
		<p>사용법2 연습</p>
<%
	String[] cards = {"신한","국민","농협","우리","삼성","현대"};	
	pageContext.setAttribute("cards", cards);
%>
		<c:forEach var="card" items="${cards}">
			${card} /
		</c:forEach>
		<br/><br/>
		<p>사용법 3 </p>
		<c:set var="hobbys" value="아이브/엔믹스/르세라핌/뉴진스/스테이씨/아이들" />
		취미 : ${hobbys}<br/>
		나의 행복은 : 
		<c:forTokens var="hobby" items="${hobbys}" delims="/">
			${hobby} , 
		</c:forTokens>
		<br/><br/>
		<p>사용법 4(상태변수 사용예제)</p>
		<p>
			상태변수 예약어 : count(1부터 1씩 증가) , index(인덱스번호! 0부터 시작) , current(현재 아이템) , first(첫번째 아이템인가?) <br/>
			last(마지막 아이템인가?) , 
		</p>
		<c:forEach var="card" items="${cards}" varStatus="st">
			${st.count}.(${st.index}) - ${card} : 조건! a.${st.current} / b.${st.first} / c.${st.last} <br/>
		</c:forEach>
		<br/><br/>
		<hr/>
		
		<h3> 사용예제 </h3>
		<div>구구단 5단을 출력하세요</div>
		<c:forEach var="i" begin="1" end="9">
			5 X ${i} = ${5 * i}<br/>
		</c:forEach>
		<br/><br/>
		<c:forEach var="ohdan" begin="5" end="45" step="5">
			구구단 5단 : ${ohdan}<br/>
		</c:forEach>
		<br/><br/><br/>
		
		<div>2. 구구단 3단에서 5단까지 출력</div>
			<c:forEach var="i" begin="3" end="5">
				<br/><br/> ★${i}단 <br/><br/>
				<c:forEach var="j" begin="1" end="9">
				 ${i} X ${j} = ${i * j} <br/>
				</c:forEach>
			</c:forEach>
			<br/><br/><br/>
			
			<h3>3. 저장된 그림 5장을 출력하시오</h3>
			<div>
				<c:forEach var="i" begin="111" end="115" varStatus="st">
					<img src="${ctp}/images/${i}.jpg" width="120px" height="100px" class="mr-4" />
				</c:forEach>		
			</div>
			<br/><br/><br/>
			
			<h3>4. 배열에 그림명을 저장 후 배열에 저장된 그림을 출력하시오, 단 한 줄에는 3개의 그림씩 출력하시오</h3>
			<div>
				<c:set var="imgs" value="115,114,113,112,111,113,112,115,111" />
					<c:forTokens var="img" items="${imgs}" delims="," varStatus="st">			
						<img src="${ctp}/images/${img}.jpg" width="120px" height="100px" class="mr-4 mb-4" />		
						<c:if test="${st.count % 3 == 0}"><br/></c:if>		
					</c:forTokens>		
			</div>
			<br/><br/><br/>
			
	<h4>5. 2차원 형식의 배열에 저장된 자료를 한 행에 3개의 항목씩 출력하시오.</h4>
<%
	String[][] members = {
		{"해원","22","서울"},	
		{"릴리","23","대구"},	
		{"설윤","21","대전"},	
		{"배이","21","서울"},	
		{"지우","20","청주"},	
		{"규진","19","서울"}	
	};
	pageContext.setAttribute("members", members);
%>
	<c:forEach var="member" items="${members}" varStatus="st">
		<c:forEach var="m" items="${member}">
			${m} ,
		</c:forEach>
		<br/><br/>
	</c:forEach>
	<br/><br/>
	
	<h4>6. 5번 배열에서 '서울' 단어에는 빨간색으로 출력하시오</h4>
	<c:forEach var="member" items="${members}" varStatus="st">
		<c:forEach var="m" items="${member}">
			<c:if test="${m == '서울'}"><font color="red"></font></c:if>
			<c:if test="${m != '서울'}"></c:if>
		</c:forEach>
		<br/><br/>
	</c:forEach>

	<h4>7. 나이가 25세 미만은 굵고 파랑색 표시 </h4>
	<c:forEach var="member" items="${members}" varStatus="st">
		<c:forEach var="m" items="${member}">
			<c:if test="${m < '25'}"><font color="blue"><b>${m}</b></font></c:if> /		
			<c:if test="${m >= '25'}">${m}</c:if>
		</c:forEach>
	</c:forEach>
	<br/><br/>
	
	<hr/><hr/>
	<p>8. 앞의 사용법 2번에 저장한 cards 의 내용중, 첫번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색</p>	
		<c:forEach var="card" items="${cards}" varStatus="st">
			<c:if test="${st.first}"><span style="background-color:yellow">${card}</span></c:if>
			<c:if test="${st.last}"><span style="background-color:skyblue">${card}</span></c:if>
			<c:if test="${!st.first && !st.last}">${card}</c:if>
		</c:forEach>
		<br/><br/><hr/>
			
	<p>9-1. 앞의 사용법 2번에 저장한 cards 의 내용중, '국민'카드는 파랑색, '삼성'카드는 빨강색, 첫번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색</p>
		<c:forEach var="card" items="${cards}" varStatus="st">
			<c:if test="${card == '국민'}"><font color="blue">${card}</font></c:if>
			<c:if test="${card == '삼성'}"><font color="red">${card}</font></c:if>
			<c:if test="${st.count == 1}"><span style="background-color:yellow">${card}</span></c:if>
			<c:if test="${st.count == 2}"><span style="background-color:skyblue">${card}</span></c:if>
			<c:if test="${card != '국민'}">${card}</c:if>
			<c:if test="${card != '삼성'}">${card}</c:if>
			<c:if test="${st.count != 1}">${card}</c:if>
			<c:if test="${st.count != 2}">${card}</c:if>
		</c:forEach>
		<br/><br/><hr/>
			
	<p>9-2. 앞의 사용법 2번에 저장한 cards 의 내용중, '국민'카드는 파랑색, '삼성'카드는 빨강색, 첫번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색</p>
		<c:forEach var="card" items="${cards}" varStatus="st">
			<c:if test="${st.first}"><span style="background-color='yellow'">${cards}</span></c:if>
			<c:if test="${st.last}"><span style="background-color='skyblue'">${cards}</span></c:if>
		</c:forEach>
		<br/><br/><hr/>

	<hr/><hr/>
	<br/><hr/><br/>
	6. URL이용 : location.href == redirect(Core라이브러리에 있음)<br/>
	<br/><hr/><br/>
	
	<hr/><hr/>	
	7. import : Core라이브러리에 있음<br/>
	<%-- <c:import url="/include/bs4.jsp" /> --%>
	<br/><hr/><br/>
	================================================================================
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>