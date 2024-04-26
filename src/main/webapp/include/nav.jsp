<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-dark navbar-red">
  <%-- <a class="navbar-brand ml-3" href="<%=request.getContextPath()%>/" style="font-size:1.4em;">Home</a> --%>
  <a class="navbar-brand ml-3" href="http://192.168.50.64:9090/javaclass" style="font-size:1.4em;">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link ml-2" href="<%=request.getContextPath()%>/study/0426/t01.jsp">Guest</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ml-2" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ml-2" href="#">PDS</a>
      </li>    
      <li class="nav-item">
        <!-- <a class="nav-link ml-2" href="#">Study</a> -->
        <div class="dropdown">
				  <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
				    Study1
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경확인</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a>
				    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_cookies.jsp">쿠키연습</a>
				    <a class="dropdown-item" href="#">Link 3</a>
				  </div>
				</div>
      </li>    
    </ul>
  </div>  
</nav>
