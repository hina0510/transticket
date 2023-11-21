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
	<%@ include file="../../default/header.jsp" %>
	<h3>list page</h3>
	<table border="1">
		<tr>
			<th>id</th>
			<th>pwd</th>
			<th>name</th>
			<th>addr</th>
			<th>email</th>
		</tr>
		<c:forEach var="dto" items="${clist }">
			<tr>
				<td>${dto.id }</td>
				<td>${dto.pwd }</td>
				<td>${dto.name }</td>
				<td>${dto.addr }</td>
				<td>${dto.email }</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>