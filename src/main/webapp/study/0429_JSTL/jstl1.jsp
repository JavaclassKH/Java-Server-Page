<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
	  th {
	 	  background-color: silver;
	 	  test-align = center;
	  }
	
	</style>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>JSTL(JSP Standard Tag Library) 연습</h1> 
		<div class="text-right mt-2 mb-2">
			<button type="button" onclick="location.href='jstl2.jsp'" class="btn btn-outline-success btn-sm">JSTL반복문</button>
			<button type="button" onclick="location.href='jstl3.jsp'" class="btn btn-outline-success btn-sm">JSTL 반복문응용</button>
			<button type="button" onclick="location.href='jstl4_function.jsp'" class="btn btn-outline-info btn-sm">JSTL 함수</button>
			<button type="button" onclick="location.href='jstl5_format.jsp'" class="btn btn-outline-secondary btn-sm">JSTL Formatting</button>
		</div>
		<table class="table table-bordered">
			<tr>
				<th>라이브러리</th>
				<th>주소(URI)</th>
				<th>접두어</th>
				<th>기본문법</th>
				<th>이거 완전 맛꿀마구마잉</th>
			</tr>
			<tr>
				<td>Core</td>
				<td>http://java.sun.com/jsp/jstl/core</td>
				<td>c</td>
				<td>< c : 태그명...  ></td>
				<td>제육볶음</td>
			</tr>
			<tr>
				<td>Formatting</td>
				<td>http://java.sun.com/jsp/jstl/fmt</td>
				<td>fmt</td>
				<td>< fmt : 태그명...  ></td>
				<td>돈가스</td>
			</tr>
			<tr>
				<td>Function</td>
				<td>http://java.sun.com/jsp/jstl/function</td>
				<td>fn</td>
				<td> $ { fn  : 태그명... } ※function라이브러리는 반드시 EL표시법과 같이 간다 </td>
				<td>국밥</td>
			</tr>
			<tr>
				<td>SQL</td>
				<td>http://java.sun.com/jsp/jstl/sql</td>
				<td>sql</td>
				<td>< sql : 태그명... ></td>
				<td>보쌈</td>
			</tr>
		</table>
		<hr/>
		<p>
			앞의 라이브러리를 사용할 경우에는 반드시 상단에 jsp지시자 중 'taglib'를 이용하여 먼저 선언 후 사용해야 한다
		</p>
		<hr/>
		<h2>Core라이브러리 사용 예시</h2>
		<pre>
			<h3>주 사용 용도 : 변수제어(선언,값 할당,출력,제거), 제어문 처리(조건문,반복문)</h3>
			변수선언법 : < c : set var="변수명" value="값" >< / c : set>
			변수출력 : < c : out value="값/변수/수식" /> ※변수값을 출력할 때 변수명은 반드시 EL로 표기함
			ㄴ> 이 때 <c:out value="${su1}" /> 을 다 없애고 그냥 ${su1}로 출력이 가능
			변수제거 : < c : remove var="변수명" />
		</pre>
		<hr/><hr/><br/>
		su1변수를 선언 후 초기값으로 100을 할당 <c:set var="su1" value="100" /><br/>
		값을 출력1 <c:out value="200" /><br/>
		su1변수값을 출력1 <c:out value="${su1}" /><br/>
		su1변수값을 출력2 ${su1}<br/>
		수식을 출력0 <c:out value="100*200" /><br/>
		수식을 출력1 <c:out value="${100 + 200}" /><br/>
		수식을 출력2 <c:out value="${'100' + 200}" /><br/>
		수식을 출력3 <c:out value="${'100' + '200'}" /><br/>
		수식을 출력3 <c:out value="${'100' + '200'}" /><br/>
		<% String name = "홍길동"; %>
		값을 출력2 <%=name %><br/>
		값을 출력3 <c:out value="<%=name %>" /><br/>
		값을 출력4 <c:out value="${name}" /> : 저장소에 저장하지 않은 변수는 값이 출력되지 않음<br/>
		<% pageContext.setAttribute("name", name); %>
		값을 출력5 <c:out value="${name}" /> == ${name} <br/>
		su1변수값을 출력 ${su1}<br/>
		su1변수를 제거 <c:remove var="su1" /><br/>
		su1변수값을 출력 ${su1}<br/>
		★★★su1변수에 name변수값을 저장 <c:set var="su1" value="${name}" /><br/>
		su1변수값을 출력3 ${su1}<br/>
		<hr/>
		<p><br/></p><br/>
		<h2>JSTL 제어문 쓰기</h2><br/>
		<p>조건문: if / 반복문: forEach / 주의점 : 조건식의 내용은 EL표기법으로 처리</p>
		<p>사용법 < c : if test =  " $ {조건식}" > 조건식에 따른 처리할 내용 < / c : if > </p>
		<p>단점1: < c : if 의 EL조건문에는 else가 존재하지 않는다 </p>
		<p>단점2: jstl의 숫자 비교는 문자형식으로 비교한다. </p>
		<br/>
		<div>사용 예시1 : (su3=300, su4=400)</div>
		<c:set var="su3" value="300" />  <c:set var="su4" value="400" />
		<div>su3 = ${su3} , su4 = ${su4} </div>
		<div>1. su3 su4가 같은가? : <c:if test="${su3 == su4}">su3와 su4는 같습니다</c:if>  </div>
		<div>2. su3 su4가 같지 않은가? : <c:if test="${su3 != su4}">su3와 su4는 다릅니다</c:if>  </div>
		<div>3. su3이 su4보다 큰가? : <c:if test="${su3 > su4}">su3가 su4보다 큽니다</c:if>  </div>	
		<div>4. su3이 su4보다 작은가? : <c:if test="${su3 < su4}">su3가 su4보다 작습니다</c:if>  </div>	
		<div>5. su3이 su4보다 크거나 같은가? : <c:if test="${su3 >= su4}">su3가 su4보다 크거나 같습니다</c:if>  </div>	
		<div>6. su3이 su4보다 작거나 같은가? : <c:if test="${su3 <= su4}">su3가 su4보다 작거나 같습니다</c:if>  </div>	
		<br/><br/>
		<div>사용 예시2 : (su3=100, su4=40)</div> <!-- 숫자는 문자비교를 한다 -->
		<c:set var="su3" value="100" />  <c:set var="su4" value="40" />
		<div>su3 = ${su3} , su4 = ${su4} </div>
		<div>11. su3 su4가 같은가? : <c:if test="${su3 == su4}">su3와 su4는 같습니다</c:if>  </div>
		<div>12. su3 su4가 같지 않은가? : <c:if test="${su3 != su4}">su3와 su4는 다릅니다</c:if>  </div>
		<div>13. su3이 su4보다 큰가? : <c:if test="${su3 > su4}">su3가 su4보다 큽니다</c:if>  </div>	
		<div>14. su3이 su4보다 작은가? : <c:if test="${su3 < su4}">su3가 su4보다 작습니다</c:if>  </div>	
		<br/><br/>
		<p><b>숫자를 숫자로 비교하기!! 뒤에 +0을 붙여준다!!</b></p>
		<div>113. su3이 su4보다 큰가? : <c:if test="${su3+0 > su4+0}">su3가 su4보다 큽니다</c:if>  </div>	
		<br/>
		<p> '>' , '<' 기호 대신 gt lt ge le로 사용 가능</p>
		<div>1113. su3 gt su4 : <c:if test="${su3+0 gt su4+0}">su3가 su4보다 큽니다</c:if>  </div>	
		<div>1114. su3 lt su4 : <c:if test="${su3+0 lt su4+0}">su3가 su4보다 작습니다</c:if>  </div>	
		<div>1115. su3 gt su4 : <c:if test="${su3+0 ge su4+0}">su3가 su4보다 크거나 같습니다</c:if>  </div>	
		<div>1116. su3 lt su4 : <c:if test="${su3+0 le su4+0}">su3가 su4보다 작거나 같습니다</c:if>  </div>	
		<br/><br/>
		
		<div>예제1 : URL에 jumsu를 쿼리스트링방식으로 입력 후 학점을 구하시오</div>
		<div>
		<c:set var="jum" value="${param.jumsu}" />
		<c:if test="${jum+0 le 50}"><c:set var="hakjum" value="F" /></c:if>
		<c:if test="${jum+0 ge 60}"><c:set var="hakjum" value="D" /></c:if>
		<c:if test="${jum+0 ge 70}"><c:set var="hakjum" value="C" /></c:if>
		<c:if test="${jum+0 ge 80}"><c:set var="hakjum" value="B" /></c:if>
		<c:if test="${jum+0 ge 90}"><c:set var="hakjum" value="A" /></c:if>
			 입력받은 점수 : ${jum}의 학점은 ${hakjum}입니다
		</div>
		<hr/><br/>
		<h3>다중조건비교 : choose ~ when </h3>
		<p>
			-  사용법  - <br/> 
			< c : choose > <br/>
				< c : when test="조건식1"> 수행할 내용1 < / c : when > <br/>
				< c : when test="조건식2"> 수행할 내용2 < / c : when > <br/>
				< c : when test="조건식3"> 수행할 내용3 < / c : when > <br/>
				 ~  ~  ~  ~  ~  <br/>
				< c : otherwise > 기타 수행할 내용 < / c : otherwise >  <br/>
			< / c : choose >
		</p>
		<br/>
		<div>학점 : 
			<c:choose>
				<c:when test="${jum ge 90}">A</c:when>
				<c:when test="${jum ge 80}">B</c:when>
				<c:when test="${jum ge 70}">C</c:when>
				<c:when test="${jum ge 60}">D</c:when>
				<c:otherwise>F</c:otherwise>
			</c:choose>
		</div>
		<hr/>
		<div>예제2 : URL에 직급코드(code)를 QueryString방식으로 입력 후 부서명을 구하시오</div>
		<div>[B: 부장 / K: 과장 / D: 대리/ S: 사원] /  직급코드(kCode), 직급명(kName) </div>
		<div> 
			<c:set var="kCode" value="${param.code}" />
			<c:choose>
				<c:when test="${kCode == 'S'}"><c:set var="kName" value="사원" /></c:when>
				<c:when test="${kCode == 'D'}"><c:set var="kName" value="대리" /></c:when>
				<c:when test="${kCode == 'K'}"><c:set var="kName" value="과장" /></c:when>
				<c:when test="${kCode == 'B'}"><c:set var="kName" value="부장" /></c:when>
				<c:otherwise><c:set var="kName" value="외부인" /></c:otherwise>		
			</c:choose>
			입력하신 직급코드는 ${kCode}이고 직급명은 ${kName}입니다 
		</div>
		
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>