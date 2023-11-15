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