<%@page import="study.j0429.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl4_function.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>JSTL Function 연습</h1>
		<div class="text-right mt-2 mb-2">
			<button type="button" onclick="location.href='jstl1.jsp'" class="btn btn-outline-success btn-sm">JSTL Core라이브러리</button>
			<button type="button" onclick="location.href='jstl2.jsp'" class="btn btn-outline-primary btn-sm">JSTL반복문</button>
		  <button type="button" onclick="location.href='jstl3.jsp'" class="btn btn-outline-info btn-sm">JSTL 반복문응용</button>
			<button type="button" onclick="location.href='jstl5_format.jsp'" class="btn btn-outline-secondary btn-sm">JSTL Formatting</button>		
		</div>
		<hr/>
		
		<h2>JSTL function 라이브러리</h2>
		<p>
			사용법 : $ { fn : 함수명(변수/값)  }
			관계연산자 : == (eq) , != (ne) , > (gt) , < (lt) , >= (ge) , <= ()le) 
		</p>
<%
	String str = "Welcome to my Homepage";
	pageContext.setAttribute("str", str);

	String[] hobbys = {"BMW","벤츠","아우디","테슬라","포드","벤틀리","마세라티","렉서스","볼보"};
	pageContext.setAttribute("hobbys", hobbys);
	
	ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	
	MemberVO vo = null;
	
	vo = new MemberVO();
	vo.setName("설윤아");
	vo.setAge(21);
	vo.setGender("여자");
	vo.setJob("NMIXX");
	vo.setAddress("서울");
	vos.add(vo);
	
	vo = new MemberVO();	
	vo.setName("장원영");
	vo.setAge(21);
	vo.setGender("여자");
	vo.setJob("IVE");
	vo.setAddress("부산");
	vos.add(vo);
	
	vo = new MemberVO();	
	vo.setName("신유나");
	vo.setAge(23);
	vo.setGender("여자");
	vo.setJob("ITZY");
	vo.setAddress("청주");
	vos.add(vo);
	
	vo = new MemberVO();	
	vo.setName("카리나");
	vo.setAge(23);
	vo.setGender("여자");
	vo.setJob("aespa");
	vo.setAddress("부산");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
	
%>
	<hr/><br/>
	<div>
		str변수의 값 : ${str}<br/>
		1-1. str변수의 길이(length) : <%=str.length() %> / ${fn:length(str)}<br/> <!-- 변수 길이 length엔 괄호() -->
		1-2. hobbys배열의 길이(length) : <%=hobbys.length %> / ${fn:length(hobbys)}<br/> <!-- 배열 길이 length엔 괄호X -->
		1-3. vos변수의 길이(length) : <%=vos.size() %> / ${fn:length(vos)}<br/>
		<p><br/></p><hr/>
		2-1. 대문자로 변환(toUpperCase()) : <%=str.toUpperCase() %> / ${fn:toUpperCase(str)}<br/>
		2-2. 소문자로 변환(toLowerCase()) : <%=str.toLowerCase() %> / ${fn:toLowerCase(str)}<br/>
		<p><br/></p><hr/>
		3-1. 문자열추출(substring()) : <%=str.substring(0, 5) %> / ${fn:substring(str, 0, 5)}<br/>
		3-2. 문자열추출(substring()) : <%=str.substring(5) %> / ${fn:substring(str, 5 , -1)}<br/>  <%-- 	${fn:substring(str, 5)}<br/> 사용불가!! --%>		
		${fn:substring(str, 5 , -1)} / ${fn:substring(str, 5 , fn:length(str))}
		<p><br/></p><hr/>		
		4-1. 특정문자의 위치값(indexOf()) : <%=str.indexOf("o") %> / ${fn:indexOf(str, "o")}
		4-2. 특정문자의 위치값(lastIndexOf()) : <%=str.lastIndexOf("o") %> / <%-- 이 명령어는 없음!! ${fn:lastIndexOf(str, "o")} --%>
		4-3. str변수의 값 중에서 "o"문자가 들어있는 모든 위치값 <br/><br/>
		<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
			<c:if test="${fn:substring(str, i, i+1) == 'o'}">
				<c:set var="cnt" value="${cnt + 1}" />
				${cnt}번째 'o'의 위치값 : ${i}<br/> 
			</c:if>
		</c:forEach>
		str변수의 'o'문자의 개수는 ${cnt}개 있습니다.
		
		4-4. str변수의 'o'문자의 두번째 위치값만 출력하시오!
				<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
			<c:if test="${fn:substring(str, i, i+1) == 'o'}">
				<c:set var="cnt" value="${cnt + 1}" />
				2번째 'o'의 위치값 : ${i}<br/> 
			</c:if>
		</c:forEach>
		<br/>
		4-5. str변수의 'o'문자의 마지막 위치값만 출력하시오<br/>
		
		<hr/>
		★ 문자열추출(substringBefore() / substringAfter())<br/>
		5-1. 문자 'o'앞의 문자열을 출력 : ${fn:substringBefore(str, 'o')}<br/>
		5-2. 문자 'o'뒤의 문자열을 출력 : ${fn:substringAfter(str, 'o')}<br/><br/>
		~~~~~~~~~ 2번째 'o'의 위치값을 출력?<br/>
		<br/><hr/>
		
		★ 문자열분리(split(변수, "분리할 문자"))<br/>
		str변수 안의 문자열 중에서 'o'를 기준으로 분리하여 출력하시오<br/>
		<c:set var="strs" value="${fn:split(str, 'o')}" />
		<c:forEach var="s" items="${strs}" varStatus="st">
			${st.count}. ${s}<br/>
		</c:forEach>		
		str변수 안에 'o'문자의 개수 : ${fn:length(strs) -1}개 <br/>
		<br/><hr/>
		
		★ <b>치환(replace)</b><br/><br/>
		7. str변수 안의 'o'를 'O'로 치환하기 : 
		<%=str.replace("o", "O") %> / ${fn:replace(str, 'o','O')} <br/>
		<br/><hr/>
		
		★ 특정 문자열 포함유무? contains() <br/><br/>
		8-1. str변수 안에 'My'가 포함되어있나?> : ${fn:contains(str, 'My')}<br/>
		8-2. str변수 안에 'my'가 포함되어있나?> : ${fn:contains(str, 'my')}
			
	</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>