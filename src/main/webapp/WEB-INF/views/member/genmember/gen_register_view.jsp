<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function fn_idchk(){
	$.ajax({
		url : "gen_idchk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#id").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idchk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
function fn_emailchk(){
	$.ajax({
		url : "gen_emailchk",
		type : "post",
		dataType : "json",
		data : {"email" : $("#email").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 이메일입니다.");
			}else if(data == 0){
				$("#emailchk").attr("value", "Y");
				alert("사용가능한 이메일입니다.");
			}
		}
	})
}
$(document).ready(function(){
	$("#submit").on("click", function(){
		var idchkVal = $("#idchk").val();
		var emailchkVal = $("#emailchk").val();
		if(idchkVal == "Y" && emailchkVal == "Y"){
			$("#regForm").submit();
		}else if(idchkVal == "Y"&& emailchkVal == "N"){
			alert("email 중복확인 버튼을 눌러주세요.");
		}else if(emailchkVal == "Y" && idchkVal == "N"){
			alert("id 중복확인 버튼을 눌러주세요.");
		}else{
			alert("중복확인 버튼을 눌러주세요.");
		}
	});
})

</script>
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
<%@ include file="../../default/header.jsp" %>
	<h3>개인회원가입</h3>
	<form action="${contextPath }/member/genregister" method="post" id="regForm">
		<input type="text" id="id" name="id" placeholder="id">
		<button class="idchk" type="button" id="idchk" onclick="fn_idchk();" value="N">중복확인</button><br>
		<input type="text" name="pwd" placeholder="pwd"><br>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="birth" placeholder="생년월일"><br>
		<input type="text" id="email" name="email" placeholder="email">
		<button class="emailchk" type="button" id="emailchk" onclick="fn_emailchk();" value="N">중복확인</button><br>
		<input type="text" readonly id="addr1" name="addr" placeholder="우편번호">
		<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
		<input type="text" readonly id="addr2" name="addr" placeholder="주소"><br>
		<input type="text" id="addr3" name="addr" placeholder="상세주소"><br>
		<input type="text" name="tel" placeholder="tel"><br>
	</form>
	<button type="button" id="submit">회원가입</button>
	<%@ include file="../../default/footer.jsp" %>	
</body>
</html>