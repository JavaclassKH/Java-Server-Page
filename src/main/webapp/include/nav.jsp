<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	String mid_ = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
%>

<nav class="navbar navbar-expand-md bg-light navbar-gray">
  <%-- <a class="navbar-brand ml-3" href="<%=request.getContextPath()%>/" style="font-size:1.2em;">Home</a> --%>
  <a class="navbar-brand ml-3" href="http://192.168.50.64:9090/javaclass/Main" style="font-size:1.3em;"><b>Home</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link ml-5" href="${ctp}/GuestList">Guest</a>
      </li>
      <%if(!mid_.equals("")) {%>
      <li class="nav-item">
        <a class="nav-link ml-5" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ml-5 mr-2" href="#">PDS</a>
      </li>        
      <li class="nav-item">
        <!-- <a class="nav-link ml-2" href="#">Study</a> -->
        <div class="dropdown dropright">
				  <button type="button" class="btn btn-outline-primary dropdown-toggle dropdown-toggle-split ml-4" data-toggle="dropdown">
				    IVE Medley
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=07EzMbVH3QE" target="_blank">해야 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=Da4P2uT4mVc" target="_blank">Baddie 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=_ApV7Lm87cg" target="_blank">Off The Record 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=_Hu4GYtye5U" target="_blank">Either Way 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=6ZUIwj3FgUY" target="_blank">I AM 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=pG6iaOMV46I" target="_blank">Kitsch 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=F0B7HDiY-10" target="_blank">After Like 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=Y8JFxS1HlDo" target="_blank">LOVE DIVE 뮤직비디오</a>
				    <a class="dropdown-item" href="https://www.youtube.com/watch?v=--FmExEAsM8" target="_blank">ELEVEN 뮤직비디오</a>
				  </div>
				</div>
      <li class="nav-item">
        <!-- <a class="nav-link ml-2" href="#">Study</a> -->
        <div class="dropdown dropright">
				  <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split ml-4 mr-2" data-toggle="dropdown">
				    Study
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경확인</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/ex1_Login.jsp">아이디저장</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_cookies.jsp">쿠키연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_session.jsp">세션연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage 연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp">JSTL연습</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_filter.jsp">Filter 한글연습</a>
				    <%-- <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_certification.jsp">인증코드발급(관리자전용)</a> --%>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t3_init.jsp">초기값 확인</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/homework/ex2_GuGuDan.jsp">구구단(걸그룹 아님)</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle1.jsp">서블릿 생명주기1</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿 생명주기2</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스</a>
				  </div>
				</div>
      <li class="nav-item">
        <!-- <a class="nav-link ml-2" href="#">Study</a> -->
        <div class="dropdown dropright">
				  <button type="button" class="btn btn-outline-danger dropdown-toggle dropdown-toggle-split ml-3 mr-3" data-toggle="dropdown">
				    Study2
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호암호화</a>
				  </div>
				</div>
			</li> 
<%      }%>    	
					<li class="nav-item">
					<%if(!mid_.equals("")) {%>
	        	<a class="nav-link " href="<%=request.getContextPath()%>/database/Logout" class="btn btn-link">Logout</a>
	        <%} else { %>
	        	<a class="nav-link " href="<%=request.getContextPath()%>/study/database/login.jsp" class="btn btn-link">Login</a>
	        <%}%>
	      	</li>   
    </ul>
  </div>  
</nav>
