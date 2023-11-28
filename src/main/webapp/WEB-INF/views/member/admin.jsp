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
<button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/glist'"><span>개인회원리스트</span></button><br><br>
<button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/clist'"><span>기업회원리스트</span></button><br><br>

<%@ include file="../default/footer.jsp" %>
</body>
</html>