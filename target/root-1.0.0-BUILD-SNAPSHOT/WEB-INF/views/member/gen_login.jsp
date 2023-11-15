<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
</head>
<body>
	<div class="loginform">
		<h3>개인로그인</h3>
		<form action="${contextPath }/member/logChk1" method="post">
			<input type="text" name="id" placeholder="ID"><br>
			<input type="text" name="pwd" placeholder="PWD"><br>
			<input type="submit" value ="로그인">
			<a href="${contextPath }/member/gen_register_view">개인회원가입</a>
			<br>	
			<input type="checkbox" name="autoLogin">자동로그인
		</form>
	</div>
</body>
</html>