<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberUpdate.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src = "${ctp}/js/woo.js"></script>
  <script>
    'use strict';
	    let idCheckSw = 0;
	    let nickCheckSw = 1;
    
 	   	function fCheck() {
	    
		    let email1 = myform.email1.value.trim();
		    let email2 = myform.email2.value;
		    let email = email1 + "@" + email2;
		    
		    let tel1 = myform.tel1.value;
		    let tel2 = myform.tel2.value.trim();
		    let tel3 = myform.tel3.value.trim();
		    let tel = tel1 + "-" + tel2 + "-" + tel3;
		    
		    let postcode = myform.postcode.value + " ";   
		    let roadAddress = myform.roadAddress.value + " ";   
		    let detailAddress = myform.detailAddress.value + " ";   
		    let extraAddress = myform.extraAddress.value + " ";   
		    let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
		    
	    	// 유효성 검사.....
	    	// 정규식을 이용한 유효성 검사..
	    	
	    	
	    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
	    	
	    	
	    	
	    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
				
	    	if(idCheckSw == 0) {
	    		alert("아이디 중복체크를 시행해주세요");
	    		document.getElementById("midBtn").focus();
	    	} 
	    	else if(nickCheckSw == 0) {    		
	    		alert("닉네임 중복체크를 시행해주세요");
	    		document.getElementById("nickNameBtn").focus();
	    	}
	    	else {
	    		myform.email.value = email;
	    		myform.tel.value = tel;
	    		myform.address.value = address;
	    		
	    		myform.submit();
	    	}
   	 }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	
    	if(mid.trim() == ""){
    		alert("아이디를 입력하세요");
    		myform.mid.focus();
    	}
    	else{
	    	$.ajax({
					url : "${ctp}/MemberIdCheck.mem",
					type : "get",
					data : { mid : mid },
					success : function(res) {
						if(res == 1) {
							alert("이미 사용중인 아이디입니다.");
							myform.mid.focus();
						}
						else {
							alert("사용 가능한 아이디입니다.");
							idCheckSw = 1;
						}
					},
					error : function() {
						alert("전송 오류");
					}
	    	});    		
    	}
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	
    	if(nickName.trim() == ""){
    		alert("닉네임을 입력하세요");
    		myform.nickName.focus();
    	}
    	else{
	    	$.ajax({
					url : "${ctp}/MemberIdCheck.mem",
					type : "get",
					data : { nickName : nickName },
					success : function(res) {
						if(res == 1) {
							alert("이미 사용중인 닉네임입니다.");
							myform.mid.focus();
						}
						else {
							alert("사용 가능한 닉네임입니다.");
							nickCheckSw = 1;
						}
					},
					error : function() {
						alert("전송 오류");
					}
	    	});    		
    	}
    }
    
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/MemberJoinOk.mem" class="was-validated">
    <h2>회 원 가 입</h2>
    <br/>
    <div class="form-group">
			아이디
		 <input type="text" class="form-control mt-2 mb-1" disabled value="${sMid}" required />	
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 <input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-warning btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="${vo.nickName}" name="nickName" required />
    </div>
    <div class="form-group">
      <label for="name">성명 </label>
      <input type="text" class="form-control" id="name" value="${vo.name}" name="name" required />
    </div>
    <div class="form-group">
      <label for="email1">Email address</label>
        <div class="input-group mb-3">
        <c:set var="email" value="${fn:split(vo.email,'@')}" />
          <input type="text" class="form-control" id="email1" name="email1" value="${email[0]}" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">          	
              <option value="naver.com" ${email[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
              <option value="hanmail.net" ${email[1] == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
              <option value="hotmail.com" ${email[1] == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
              <option value="gmail.com" ${email[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
              <option value="nate.com" ${email[1] == 'nate.com' ? 'selected' : ''}>nate.com</option>
              <option value="yahoo.com"	${email[1] == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
            </select>
          </div>
        </div>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 </span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자" <c:if test="${vo.gender == '남자'}">checked</c:if>>남자
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자" <c:if test="${vo.gender == '여자'}">checked</c:if>>여자
        </label>
      </div>
    </div>
    <div class="form-group">
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value="${fn:substring(vo.birthday,0,10)}" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 </span> &nbsp;&nbsp;         	
            <select name="tel1" class="custom-select">
              <option value="010" ${tel1 == '010' ? 'selected' : ''}>010</option>
              <option value="02" ${tel1 == '02' ? 'selected' : ''}>서울</option>
              <option value="031" ${tel1 == '031' ? 'selected' : ''}>경기</option>
              <option value="032" ${tel1 == '032' ? 'selected' : ''}>인천</option>
              <option value="041" ${tel1 == '041' ? 'selected' : ''}>충남</option>
              <option value="042" ${tel1 == '042' ? 'selected' : ''}>대전</option>
              <option value="043" ${tel1 == '043' ? 'selected' : ''}>충북</option>
              <option value="051" ${tel1 == '051' ? 'selected' : ''}>부산</option>
              <option value="052" ${tel1 == '052' ? 'selected' : ''}>울산</option>
              <option value="061" ${tel1 == '061' ? 'selected' : ''}>전북</option>
              <option value="062" ${tel1 == '062' ? 'selected' : ''}>광주</option>
              <option value="850" ${tel1 == '850' ? 'selected' : ''}>북한</option>
            </select>-
        </div>
        <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control"/>
      </div>
    </div>
    <div class="form-group">
      <label for="address">주소</label>
      <div class="input-group mb-1">
        <input type="text" name="postcode" value="${postcode}" id="sample6_postcode" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
        </div>
      </div>
      <input type="text" name="roadAddress" value="${roadAddress}" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" value="${detailAddress}" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
        <div class="input-group-append">
          <input type="text" name="extraAddress" value="${extraAddress}"  id="sample6_extraAddress" placeholder="참고항목" class="form-control">
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage address </label>
      <input type="text" class="form-control" name="homePage" value="${vo.homePage}" id="homePage"/>
    </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <option ${vo.job == '학생' ? 'selected' : ''}>학생</option>
        <option ${vo.job == '회사원' ? 'selected' : ''}>회사원</option>
        <option ${vo.job == '공무원' ? 'selected' : ''}>공무원</option>
        <option ${vo.job == '군인' ? 'selected' : ''}>군인</option>
        <option ${vo.job == '의사' ? 'selected' : ''}>의사</option>
        <option ${vo.job == '법조인' ? 'selected' : ''}>법조인</option>
        <option ${vo.job == '세무인' ? 'selected' : ''}>세무인</option>
        <option ${vo.job == '자영업' ? 'selected' : ''}>자영업</option>
        <option ${vo.job == '기타' ? 'selected' : ''}>기타</option>
      </select>
    </div>
    <div class="form-group">
 			취미 &nbsp;&nbsp;&nbsp;
 			<c:set var="varHobbys" value="${fn:split('등산/낚시/수영/독서/영화감상/바둑/축구/기타' , '/')}" />
 			<c:forEach var="tempHobby" items="${varHobbys}" varStatus="st">
 				${tempHobby} <input type="checkbox" name="hobby" value="${tempHobby}" <c:if test="${fn:contains(hobby, varHobbys[st.index])}">checked</c:if> /> &nbsp;&nbsp;
 			</c:forEach>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content">${vo.content}</textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
        </label>
      </div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) : <img src="${ctp}/images/member/${vo.photo}" width="120px" />
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <button type="button" class="btn btn-success mr-3" onclick="fCheck()">회원정보수정</button> &nbsp;&nbsp;&nbsp;
    <button type="reset" class="btn btn-warning mr-3">다시작성</button> &nbsp;&nbsp;&nbsp;
    <button type="button" class="btn btn-danger" onclick="location.href='MemberMain.mem';">돌아가기</button>
    
    <input type="hidden" name="email" />
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>