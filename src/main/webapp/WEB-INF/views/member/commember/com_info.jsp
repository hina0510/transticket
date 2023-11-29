<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script>
function delchk(){
	 if (confirm("정말 삭제하시겠습니까??") == true){
		 location.href='comdelete?id=${cominfo.dto.id}'
	 }else{
		 return false;
	}
}
</script>

</head>
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
<body>
<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>기업정보</strong>
		        </div>
				<div class="board_view_info">
					<p>id : ${cominfo.dto.id }<br>
					pwd : ${cominfo.dto.pwd }<br>
					이름 : ${cominfo.dto.name }<br>
					기본주소 : ${cominfo.dto.addr }<br>
					우편번호 : ${cominfo.addr1 }<br>
					주소 : ${cominfo.addr2 }<br>
					상세주소 : ${cominfo.addr3 }<br>
					이메일 : ${cominfo.dto.email }<br></p>
				</div>
			</div>
			<button class="custom-btn btn-3" onclick="location.href='com_modify?id=${cominfo.dto.id}'"><span>수정</span></button>
			<button class="custom-btn btn-3" onclick="delchk()"><span>삭제</span></button>
			<br><br>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>	
</body>
</html>