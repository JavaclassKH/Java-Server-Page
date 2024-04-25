<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t11_form.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>값 전송연습 3</h2>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/j0425/T11Ok">
			<div> 성 명
				<input type="text" name="name" value="엄준식" class="form-control mb-4" autofocus required /> 		
			</div>
			<div> 나 이 
			 <input type="number" name="age" value="29" min="1" max="99" class="form-control mb-4" required /> 
			</div>
			<div class="mb-5 mr-3"> 성 별&nbsp;&nbsp;&nbsp; 
			 남자&nbsp;<input type="radio" name="gender" value="남자" checked />
			 여자<input type="radio" name="gender" value="여자"/> 
			</div>
	    <div class="mr-5 mb-5"> 취미&nbsp;&nbsp;&nbsp;
				등산 &nbsp;<input type="checkBox" name="hobby" value="등산" class="mr-3" />
				살인 &nbsp;<input type="checkBox" name="hobby" value="살인" class="mr-3" />
				도박 &nbsp;<input type="checkBox" name="hobby" value="도박" class="mr-3" />
				폭행 &nbsp;<input type="checkBox" name="hobby" value="폭행" class="mr-3" />
				사기 &nbsp;<input type="checkBox" name="hobby" value="사기" class="mr-3" />
				절도 <input type="checkBox" name="hobby" value="절도" class="mr-3" />
			</div>
 			<div class="mr-5 mb-5"> 직업&nbsp;&nbsp;
				<select name="job">
					<option value="">선택</option>
					<option>카지노환전상</option>
					<option>다단계종사자</option>
					<option>마약제조업자</option>
					<option>살인청부업자</option>
					<option>시체전문처리업자</option>
					<option>사기전문설계사</option>
				</select>
			</div> 
 			<div class="mr-5 mb-5 bordered"> 가본 빵&nbsp;&nbsp;
				<select name="bbang" size="5" multiple>
					<option value="">선택</option>
					<option>청주여자교도소</option>
					<option>대구교도소</option>
					<option>포항교도소</option>
					<option>군산교도소</option>
					<option>서울구치소</option>
					<option>수원구치소</option>
					<option>대전교도소</option>
					<option>광주교도소</option>
				</select>
			</div> 
			<div class="mb-3"> 자기소개
				<textarea rows="6" name="content" class="form-control"></textarea>
			</div>
			<div class="mb-6"> 파일첨부
				<input type="file" name="fname" class="form-control-file border" />
			</div>
			<div>  
				<input type="submit" value="전송" class="btn btn-light mt-3" /> 
			</div>
		</form>
	</div>
<p><br/></p>
</body>
</html>















