<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
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
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>새 비밀번호</strong>
		        </div>
				<div class="board_view_info">
					<form action="gen_pw_new" method="POST" class="content">
						<div class="textbox">
							<label for="pwd">새비밀번호</label><input id="pwd" name="pwd" type="password">
						</div>
						<input type="submit" id="check" onclick="pwnew()" value="비밀번호변경">
						<input type="hidden" name="email" value=${email }>
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>