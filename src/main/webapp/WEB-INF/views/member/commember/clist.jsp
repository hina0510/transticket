<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>list page</strong>
		        </div>
				<div class="board_view_info">
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
								<td><a href="com_info?id=${dto.id }">${dto.id }</td>
								<td>${dto.pwd }</td>
								<td>${dto.name }</td>
								<td>${dto.addr }</td>
								<td>${dto.email }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>