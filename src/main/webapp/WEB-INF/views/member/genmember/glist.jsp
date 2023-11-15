<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h3>list page</h3>
	<table border="1">
		<tr>
			<th>id</th>
			<th>pwd</th>
			<th>name</th>
			<th>birth</th>
			<th>email</th>
			<th>addr</th>
			<th>tel</th>
			</tr>
		<c:forEach var="dto" items="${glist }">
			<tr>
				<td><a href="gen_info?id=${dto.id }">
					${dto.id }</td>
				<td>${dto.pwd }</td>
				<td>${dto.name }</td>
				<td>${dto.birth }</td>
				<td>${dto.email }</td>
				<td>${dto.addr }</td>
				<td>${dto.tel }</td>
				</tr>
		</c:forEach>
	</table>
<%@ include file="../../default/footer.jsp" %>		
</body>
</html>