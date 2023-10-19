<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<h3>개인회원가입</h3>
	<form action="${contextPath }/member/genregister" method="post">
		<input type="text" name="id" placeholder="id"><br>
		<input type="text" name="pwd" placeholder="pwd"><br>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="birth" placeholder="생년월일"><br>
		<input type="text" name="email" placeholder="email"><br>
		<input type="text" readonly id="addr1" name="addr" placeholder="우편번호">
		<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
		<input type="text" readonly id="addr2" name="addr" placeholder="주소"><br>
		<input type="text" id="addr3" name="addr" placeholder="상세주소"><br>
		<input type="text" name="tel" placeholder="tel"><br>
		<input type="submit" value="회원가입"><br>
	</form>
</body>
</html>