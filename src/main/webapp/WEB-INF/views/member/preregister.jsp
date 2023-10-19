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
<button type="button" onclick="location.href='${contextPath }/member/gen_register_view'">개인회원가입</button>
<button type="button" onclick="location.href='${contextPath }/member/com_register_view'">기업회원가입</button>




<%@ include file="../default/footer.jsp" %>
</body>
</html>