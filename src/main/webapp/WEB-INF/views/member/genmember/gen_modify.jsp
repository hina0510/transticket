<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
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
		var emailchkVal = $("#emailchk").val();
		if(emailchkVal == "Y"){
			if (confirm("수정 하시겠습니까??") == true){
				 $("#modifyForm").submit();
				 alert("수정완료")
				 }else{
				 return false;
			}
			
		}else if(emailchkVal == "N"){
			alert("email 중복확인 버튼을 눌러주세요.");
		}
	});
})

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
<%@ include file="../../default/header.jsp" %>
<h3>개인수정페이지</h3>
<form action="${contextPath }/member/genmodify" method="post" id="modifyForm">
		<input type="text" readonly name="id" value="${geninfo.dto.id}"><br>
		<input type="text" name="pwd" placeholder="pwd"><br>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="birth" placeholder="생년월일"><br>
		<input type="text" name="email" placeholder="email" id="email">
		<button class="emailchk" type="button" id="emailchk" onclick="fn_emailchk();" value="N">중복확인</button><br>
		<input type="text" id="addr1" name="addr" placeholder="우편번호">
		<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
		<input type="text" id="addr2" name="addr" placeholder="주소"><br>
		<input type="text" id="addr3" name="addr" placeholder="상세주소"><br>
		<input type="text" name="tel" placeholder="tel"><br>
</form>
	<button type="button" id="submit">정보수정</button>
<%@ include file="../../default/footer.jsp" %>	
</body>
</html>