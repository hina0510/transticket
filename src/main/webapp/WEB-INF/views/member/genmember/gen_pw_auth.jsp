<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var msg = '${msg}';
	console.log(msg);
	if(msg==''){
		alert("이메일발송");
	}else if(msg=='실패'){
		alert("인증번호를 확인하세요.");
	}
</script>
<body>
<%@ include file="../../default/header.jsp" %>

<form action="gen_pw_set" method="post">
	<input type="hidden" name ="num" value="${num }">
		<div class="content">
			<div class="textbox">
				<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
			</div><br><br>
			<input type="submit" id="check" value="확인">
		</div>
</form>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>