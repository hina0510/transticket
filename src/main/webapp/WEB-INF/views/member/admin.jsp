<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script>
  alert("URL을 직접 입력해서 접근하셨습니다.로그인후 정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="prelogin";
 </script>
<%
  return;
 }
%>
<%@ include file="../default/header.jsp" %>
<h3>관리자 페이지</h3>
<hr>
<a href="./clist">기업회원 리스트</a><br><br>
<a href="./glist">개인회원 리스트</a>
<%@ include file="../default/footer.jsp" %>
</body>
</html>