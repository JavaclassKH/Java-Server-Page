<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>t08.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h1>아래 콤보상자에서 그림화일을 선택하면 선택된 그림을 화면에 출력시켜주시오</h1>
		<form action="t08Ok.jsp">
			<div>그림선택
				<select name="tag">
					<option>111</option>
					<option>112</option>
					<option>113</option>
					<option>114</option>
					<option>115</option>
				</select>
			</div>
			<div>그림 여러장선택
				<select name="imgs" multiple>
					<option>111</option>
					<option>112</option>
					<option>113</option>
					<option>114</option>
					<option>115</option>
				</select>
			</div>
			<input type="submit" value="출력" class="btn btn-success" />
		</form>
	</div>
<p><br/></p>
</body>
</html>