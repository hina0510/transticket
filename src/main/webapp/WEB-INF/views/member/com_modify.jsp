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
<h3>기업수정페이지</h3>
<form action="${contextPath }/member/commodify" method="post">
		<input type="text" readonly name="id" value="${cominfo.dto.id}"><br>
		<input type="text" name="pwd"><br>
		<input type="text" name="name"><br>
		<input type="text" id="addr1" name="addr">
		<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
		<input type="text" id="addr2" name="addr"><br>
		<input type="text" id="addr3" name="addr"><br>
		<input type="text" name="email"><br>
		<input type="submit" value="수정"><br>
	</form>
	
</body>
</html>