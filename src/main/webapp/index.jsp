<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
  session.getLastAccessedTime();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");	
	String lat = sdf.format(session.getLastAccessedTime());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>해야 & Accendio</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file = "../../include/bs4.jsp" %>  <!-- 부트스트랩(bs4) -->
  <style>
  .fakeimg {
    height: 200px;
    background: #abc;
  }
  </style>
</head>
<body>

<%@ include file = "../../include/header.jsp" %> 

<!-- 메뉴바(Nav) , 상대경로지정 -->
<%@ include file = "../../include/nav.jsp" %> 

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2>About Me(${sMid})</h2>
      <h5>Photo of me:</h5>
      <div class="fakeimg">Fake Image</div>
      <p>끝났어 포기해 물러서라 너는 절대 날 이길 수 없어 패배자는 너야</p>
      <h3>Some Links</h3>
      <p>amigo</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>TITLE HEADING</h2>
      <h5>세션 마지막 접속시간 : <%=lat %></h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>abc</p>
      <br>
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>def</p>
    </div>
  </div>
</div>
<%@ include file = "../../include/footer.jsp" %> 

</body>
</html>
























