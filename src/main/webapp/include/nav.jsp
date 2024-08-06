<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	int level = session.getAttribute("sLevel") == null ? 444 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<nav class="navbar navbar-expand-md bg-light navbar-gray">
  <%-- <a class="navbar-brand ml-3" href="<%=request.getContextPath()%>/" style="font-size:1.2em;">Home</a> --%>
  <a class="navbar-brand ml-3" href="http://192.168.50.64:9090/javaclass/Main" style="font-size:1.5em;"><b>로비</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link ml-5" href="${ctp}/GuestList">방문자방명록</a>
      </li>
			<c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link ml-5" href="BoardList.bo">게시판</a>
	      </li>
	    </c:if>
	    <c:if test="${level <= 4 && (level > 1 || level == 0)}">
	      <li class="nav-item">
	        <a class="nav-link ml-5 mr-2" href="PdsList.pds">자료실</a>
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
				</li>
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
					    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t3_init.jsp">초기값 확인</a>
					    <a class="dropdown-item" href="<%=request.getContextPath()%>/homework/ex2_GuGuDan.jsp">구구단(걸그룹 아님)</a>
					    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle1.jsp">서블릿 생명주기1</a>
					    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿 생명주기2</a>
					    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스</a>
					  </div>
					</div>
				</li>
	      <li class="nav-item">
	        <!-- <a class="nav-link ml-2" href="#">Study</a> -->
	        <div class="dropdown dropright">
					  <button type="button" class="btn btn-outline-danger dropdown-toggle dropdown-toggle-split ml-3 mr-2" data-toggle="dropdown">
					    Study2
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호암호화</a>
					    <a class="dropdown-item" href="${ctp}/mapping/Test1">디렉토리 맵핑연습(URL패턴)</a>
					    <a class="dropdown-item" href="${ctp}/mapping/Test2.do">확장자 맵핑연습1(URL패턴)</a>
					    <a class="dropdown-item" href="${ctp}/mapping/Test3.do3">확장자 맵핑연습3(URL패턴)</a>
					    <a class="dropdown-item" href="${ctp}/mapping/Test4.do4">확장자 맵핑연습4(URL패턴)</a>
					    <a class="dropdown-item" href="Modal1.st">Modal연습1(보여주기)</a>
					    <a class="dropdown-item" href="Modal2.st">Modal연습2(값 제어)</a>
					  </div>
					</div>
				</li>
				<li class="nav-item">
	        <div class="dropdown dropright">
					  <button type="button" class="btn btn-outline-info dropdown-toggle dropdown-toggle-split ml-3 mr-3" data-toggle="dropdown">
					    Study3
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="${ctp}/ajaxTest1.st">AJAX연습(일반)</a>
					    <a class="dropdown-item" href="${ctp}/ajaxTest2.st">AJAX연습(응용)</a>
					    <a class="dropdown-item" href="${ctp}/ajaxTest3.st">AJAX연습(회원관리)</a>
					    <a class="dropdown-item" href="${ctp}/uuidForm.st">UUID연습</a>
					    <a class="dropdown-item" href="${ctp}/MemberLogin.mem">로그인연습</a>
					    <a class="dropdown-item" href="BoardList.bo">게시판목록</a>
					    <a class="dropdown-item" href="FileUpload1.st">싱글파일업로드</a>
					    <a class="dropdown-item" href="FileUpload2.st">멀티파일업로드2</a>
					    <a class="dropdown-item" href="FileUpload3.st">멀티파일업로드3</a>
					    <a class="dropdown-item" href="FileUpload4.st">멀티파일업로드4</a>
					    <a class="dropdown-item" href="FileDownload.st">파일다운로드</a>
					    <a class="dropdown-item" href="FileUpload.st">자바파일업로드(싱글)</a>
					  </div>
					</div>
				</li>
				<li class="nav-item">
					<!-- <a class="nav-link ml-2" href="#">Study</a> -->
					<div class="dropdown dropright">
						<button type="button" class="btn btn-outline-danger dropdown-toggle dropdown-toggle-split ml-1 mr-2" data-toggle="dropdown">
						Study4
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="InputTest.st">input태그 테스트</a>
							<a class="dropdown-item" href="Calendar1.st">달력연습1</a>
							<a class="dropdown-item" href="Calendar2.st">달력연습2</a>
							<a class="dropdown-item" href="ScrollStudy.st">스크롤연습</a>
							<a class="dropdown-item" href="ScrollBasic.st">무한스크롤연습</a>
							<a class="dropdown-item" href="Transaction.st">트랜잭션연습</a>
							<a class="dropdown-item" href="Error.st">에러페이지 연습</a>
						</div>
					</div>
				</li>
			</c:if>  	
			<c:if test="${level <= 4}">
	      <li class="nav-item">
	        <div class="dropdown dropright">
					  <button type="button" class="btn btn-outline-success dropdown-toggle dropdown-toggle-split ml-2 mr-3" data-toggle="dropdown">
					    <font color="black"><b>마이페이지</b></font>
					  </button>
 					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="MemberMain.mem">로비</a>
					    <c:if test="${level <= 4 && (level > 1 || level == 0)}">
					    	<a class="dropdown-item" href="Schedule.sc">일정관리</a>
					    	<a class="dropdown-item" href="WebMessage.wm">메세지관리</a>
					    	<a class="dropdown-item" href="MemberList.mem">회원리스트</a>
					    </c:if>
					    <a class="dropdown-item" href="MemberPwdCheck.mem">회원정보수정</a>
					    <a class="dropdown-item" href="MemberDeleteCheck.mem"><font color="red"><b>회원탈퇴</b></font></a>
					    <c:if test="${level == 0}"><a class="dropdown-item" href="AdminMain.ad">관리자전용</a></c:if>
					  </div>
					</div>
				</li>
			</c:if>	
					<li class="nav-item">
					<c:if test="${level <= 4}"><a class="nav-link " href="${ctp}/MemberLogout.mem" class="btn btn-link">Logout</a></c:if>
	        <c:if test="${level > 4}"><a class="nav-link " href="${ctp}/MemberLogin.mem" class="btn btn-link">Login</a></c:if>  	       
	      	</li>     	
					<li class="nav-item">
	        <c:if test="${level > 4}"><a class="nav-link " href="${ctp}/MemberJoin.mem" class="btn btn-link">Join</a></c:if>
    			</li>
    </ul>
  </div>  
</nav>
