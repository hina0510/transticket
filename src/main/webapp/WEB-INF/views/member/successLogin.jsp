<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<h3>로그인 성공 페이지</h3><hr>
	
	<a href="${contextPath }/member/com_info?id=${cominfo.dto.id }">기업정보</a><br>
	<a href="${contextPath }/member/gen_info?id=${geninfo.dto.id }">개인정보</a>
	
</body>
</html>
