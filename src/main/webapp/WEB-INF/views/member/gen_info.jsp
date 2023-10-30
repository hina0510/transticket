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
	id : ${geninfo.dto.id }<br>
	pwd : ${geninfo.dto.pwd }<br>
	이름 : ${geninfo.dto.name }<br>
	생년월일 : ${geninfo.dto.birth }<br>
	이메일 : ${geninfo.dto.email }<br>
	기본주소 : ${geninfo.dto.addr }<br>
	우편번호 : ${geninfo.addr1 }<br>
	주소 : ${geninfo.addr2 }<br>
	상세주소 : ${geninfo.addr3 }<br>
	전화번호 : ${geninfo.dto.tel }<br>
	<hr>
	<button type="button" onclick="location.href='gen_modify?id=${geninfo.dto.id}'">수정</button>
	
	
</body>
</html>
