<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jstl1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
	  th {
	 	  background-color: #abc;
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
				<td> $ { fn  : 태그명... } ※function라이브러리는 반드시 EL표시겁과 같이 간다 </td>
				<td>국밥</td>
			</tr>
			<tr>
				<td>SQL</td>
				<td>http://java.sun.com/jsp/jstl/sql</td>
				<td>sql</td>
				<td>< sql : 태그명...  ※function라이브러리는 반드시 EL표시법과 같이 간다 ></td>
				<td>보쌈</td>
			</tr>
		</table>
		<hr/>
		<p>
			앞의 라이브러리를 사용할 경우에는 반드시 상단에 jsp지시자 중 'taglib'를 이용하여 먼저 선언 후 사용해야 한다
		</p>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>