<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript">
var msg = '${msg}';
	console.log(msg);
	if(msg==''){
		alert("이메일발송");
	}else if(msg=='실패'){
		alert("인증번호를 확인하세요.");
	}
</script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>인증번호 확인</strong>
		        </div>
				<div class="board_view_info">
					<form action="com_pw_set" method="post">
						<input type="hidden" name ="num" value="${num }">
						<div class="textbox">
							<label for="injeung">인증번호</label><input type="text" id="injeung" name="email_injeung" placeholder="인증번호를 입력하세요">
						</div><br>
						<input type="submit" id="check" value="확인">
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>