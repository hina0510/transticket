<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delchk(){
	 if (confirm("정말 삭제하시겠습니까??") == true){
		 location.href='gendelete?id=${geninfo.dto.id}'
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
	id : ${geninfo.dto.id }<br>
	pwd : ${geninfo.dto.pwd }<br>
	이름 : ${geninfo.dto.name }<br>
	생년월일 : ${geninfo.dto.birth }<br>
	이메일 : ${geninfo.dto.email }<br>
	기본주소 : ${geninfo.dto.addr }<br>
	우편번호 : ${geninfo.addr1 }<br>
	주소 : ${geninfo.addr2 }<br>
	상세주소 : ${geninfo.addr3 }<br>
	전화번호 : ${geninfo.dto.tel }<br>
	<hr>
	<button type="button" onclick="location.href='gen_modify?id=${geninfo.dto.id}'">수정</button>
	<button type="button" onclick="delchk()">삭제</button>
<%@ include file="../../default/footer.jsp" %>	
</body>
</html>