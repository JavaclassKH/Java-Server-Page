<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>passCheck.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
  	'use strict';
  	
    function fCheck(idx) {
    	let pwd = myform.pwd.value;
    	if(pwd.trim() == "") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    	}
    	else {
    		myform.idx.value = idx;
    		myform.action = "${ctp}/study/password/PassCheck";
  			myform.submit();
    	}
    }
  
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container"> 
	<h1 class="text-center">비밀번호 암호화 연 습</h1>
	<p class="text-center">
		암호화해서 솔트(Salt)는 데이터, 비밀번호, 통과암호를 해시 처리하는<br/> 
		단방향 함수의 추가 입력으로 사용되는 랜덤 데이터이다.<br/>
		솔트는 스토리지에서 비밀번호를 보호하기 위해 사용된다<br/>
		솔트는 레인보우 테이블(Rainbow Table : 해시테이블)과 같은 미리 계산된 테이블을 사용하는 공격을 방어한다.
	</p>
	<p>(비밀번호는 10자 이내로 입력한다)</p>
  <form name="myform" method="post">
  <table class="table table-border-dark">
      <tr>
        <td colspan="2"><font size="5">로 그 인</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="12345ACCDB어머나" required class="form-control" /></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="숫자비번" onclick="fCheck(1)" class="btn btn-outline-success mr-2"/>
          <input type="button" value="문자비번" onclick="fCheck(2)" class="btn btn-outline-success mr-2"/>
          <input type="button" value="준비중" onclick="fCheck(3)" class="btn btn-outline-success ml-40"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" />
  </form>
  <p><br/></p>
  <div>비밀번호를 전송 후 콘솔창에서 암호화된 비밀번호를 확인하세요.</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>