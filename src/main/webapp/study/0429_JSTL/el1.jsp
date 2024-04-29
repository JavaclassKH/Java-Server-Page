<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
	<div class="container">
		<h1>EL(Expression Language)</h1>
		<p><span>저장소(서버 저장소[ServletContextContainer])에 기록되어 있는 자료에 대한 처리를 담당</span></p>
		<pre>
용도 : 사용자가 '변수,값,수식,객체' 등을 전송받은 후에 저장, 또는 기타 작업처리하는 용도로 사용함.
표기법 : $ {변수/값/객체}
서버저장소 : Application , Session , pageContext , Request 
		</pre>
		<hr/>
<%
	String atom = "nmixx";
  String name = "설윤아";
	int su1 = 100 , su2 = 200; 
	String su3 = "100" , su4 = "400";
	
%>
	<h4>스크립틀릿을 이용한 출력</h4>
		<div>
		 atom = <%=atom %><br/>
		 name = <%=name %><br/>
		 su1 = <%=su1 %><br/>
		 su2 = <%=su2 %><br/>
		 su3 + su4 = <%=(su3+su4) %><br/><br/>
		 <%--  su3 * su4 = <%=(su3*su4) %> --%>
		</div>
		<hr/>
		<div>
			<h4>EL을 이용한 출력</h4>
<%
	request.setAttribute("atom", atom);
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("su1", su1);
	pageContext.setAttribute("su2", su2);
	pageContext.setAttribute("su3", su3);
	pageContext.setAttribute("su4", su4);
%>						
		<div> 
		 atom&nbsp; = ${atom}<br/>
		 name&nbsp; = ${name}<br/>
		 su1&nbsp; = ${su1}<br/>
		 su2&nbsp; = ${su2}<br/>
		 su3&nbsp; + su4 = ${su3 + su4}<br/>
		 su3&nbsp; * su4 = ${su3 * su4}
		</div>
		<hr/>
		<div>
			<h3>파라미터를 통해 넘어온 값의 처리(QueryString형식)</h3>
			<div><font color='red'>Form태그의 get,post 방식의 전송이나, url을 통한 값의 전송(주소?변수1=값1&변수2=값2)</font></div>	
			<div>주소창에 현재 주소 뒤에 '?mbc=200&kbs=50'을 입력 후 아래 내용 확인</div><br/>
			<div>
				mbc = ${param.mbc}<br/>
				kbs = ${param.kbs}<br/>
				mbc - kbs = ${param.mbc - param.kbs}<br/>
			</div>
			<hr/><hr/>
			<div>
				<form name="myform" method="post" action="${pageContext.request.contextPath}/j0429/ELTest">
					<h2 class="text-center mb-5">Form 자료 전송 연습</h2>
					<div>성명 : 
						<input type="text" name="name" value="한모네" class="form-control mb-3" autofocus />
					</div>
					<div>취미 : 
						걸그룹&nbsp;&nbsp;<input type="checkbox" name="hobby" value="걸그룹" />
						엔믹스&nbsp;&nbsp;<input type="checkbox" name="hobby" value="엔믹스" />
						아이브&nbsp;&nbsp;<input type="checkbox" name="hobby" value="아이브" />
						르세라핌&nbsp;&nbsp;<input type="checkbox" name="hobby" value="르세라핌" />
						에스파&nbsp;&nbsp;<input type="checkbox" name="hobby" value="에스파" />
						뉴진스&nbsp;&nbsp;<input type="checkbox" name="hobby" value="뉴진스" />
						스테이씨&nbsp;&nbsp;<input type="checkbox" name="hobby" value="스테이씨" />
					</div>
					<div>
						<input type="submit" value="보내라" class="btn btn-outline-danger form-control mt-4" /> 
					</div>
				</form>
			</div>
<%
	name = request.getParameter("name") == null ? "" : request.getParameter("name");  
	if(!name.equals("")) {
%>	
		<p><br/></p>
		<p>성명 : ${name}</p>
		<p>취미 : ${hobby}</p>
<%} %>
		</div>
		</div>
	</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>