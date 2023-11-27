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
			<input type="checkbox" name="autoLogin">자동로그인
			<button class="custom-btn btn-3" type="submit"><span>로그인</span></button><br>
			<a href="${contextPath }/member/gen_pw_find">비번찾기</a>
			<a href="${contextPath }/member/gen_register_view">개인회원가입</a>
		</form>
	</div>

</body>
</html>