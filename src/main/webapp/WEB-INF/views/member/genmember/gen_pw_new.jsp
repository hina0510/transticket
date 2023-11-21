<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function pwnew(){
	 if (confirm("변경 하시겠습니까??") == true){
		 alert("변경완료");
		 }else{
		 return false;
	}
}
</script>
<body>
<%@ include file="../../default/header.jsp" %>
<form action="gen_pw_new" method="POST" class="content">
	<div class="textbox">
		<input id="pwd" name="pwd" type="password"><label>새비밀번호</label>
		
	</div>
	<input type="submit" id="check" onclick="pwnew()" value="비밀번호변경">
	<input type="hidden" name="email" value=${email }>
	
</form>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>