<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function modichk(){
	 if (confirm("수정 하시겠습니까??") == true){
		 }else{
		 return false;
	}
}
</script>

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
		<input type="submit" onclick="modichk()" value="수정"><br>
	</form>
	
</body>
</html>