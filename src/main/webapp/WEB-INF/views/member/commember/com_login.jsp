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
	
	<div style="height: 40px;"></div>
	<div class="board_wrap">
		<form action="${contextPath }/member/logChk" method="post">
			<input type="text" name="id" placeholder="ID"><br>
			<div style="height: 5px;"></div>
			<input type="password" name="pwd" placeholder="PWD"><br>
			<div style="height: 10px;"></div>
			<input type="checkbox" name="autoLogin" id="comauto"><label for="comauto">&nbsp;자동로그인&nbsp;</label>
			<button class="custom-btn btn-3" type="submit"><span>로그인</span></button><br>
			<div style="height: 10px;"></div>
			<a href="${contextPath }/member/com_pw_find">비번찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${contextPath }/member/com_register_view">기업회원가입</a>
		</form>
	</div>
	<div style="height: 20px;"></div>

</body>
</html>