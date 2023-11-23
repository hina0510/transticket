<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
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
<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>개인수정페이지</strong>
		        </div>
				<div class="board_view_info">
					<form action="${contextPath }/member/genmodify" method="post">
						<input type="text" readonly name="id" value="${geninfo.dto.id}"><br>
						<input type="text" name="pwd" placeholder="pwd"><br>
						<input type="text" name="name" placeholder="이름"><br>
						<input type="text" name="birth" placeholder="생년월일"><br>
						<input type="text" name="email" placeholder="email"><br>
						<input type="text" id="addr1" name="addr" placeholder="우편번호">
						<button type="button" onclick="daumPost()">우편번호 찾기</button><br>
						<input type="text" id="addr2" name="addr" placeholder="주소"><br>
						<input type="text" id="addr3" name="addr" placeholder="상세주소"><br>
						<input type="text" name="tel" placeholder="tel"><br>
						<input type="submit" onclick="modichk()" value="수정"><br>
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>	
</body>
</html>