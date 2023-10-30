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
	id : ${cominfo.dto.id }<br>
	pwd : ${cominfo.dto.pwd }<br>
	이름 : ${cominfo.dto.name }<br>
	기본주소 : ${cominfo.dto.addr }<br>
	우편번호 : ${cominfo.addr1 }<br>
	주소 : ${cominfo.addr2 }<br>
	상세주소 : ${cominfo.addr3 }<br>
	이메일 : ${cominfo.dto.email }<br>
	<hr>
	<button type="button" onclick="location.href='com_modify?id=${cominfo.dto.id}'">수정</button>
	
	
</body>
</html>