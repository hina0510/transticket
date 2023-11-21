<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg=='실패'){
		  alert("아이디나 이메일을 확인하세요.");
		  location.href='${contextPath }/root/member/com_pw_find'
	}
</script>
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
<%@ include file="../../default/header.jsp" %>
<form class = "content" action="com_pw_auth" method="post">
	<div class="textbox">
  		<input id="text" name=id type="text" />
  		<label for="text">아이디</label>
   		
 	</div>
	<div class="textbox">
  		<input id="email" name=email required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" />
  		<label for="email">이메일</label>
  
	</div><br><br>
   	<input type="submit" id="check" value="비밀번호찾기">
</form>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>