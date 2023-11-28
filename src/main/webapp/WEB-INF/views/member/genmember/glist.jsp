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
				<div class="container">
					<table style="text-align: center;">
						<tr>
							<th>id</th><th style="width: 20px;"></th>
							<th>name</th><th style="width: 20px;"></th>
							<th>birth</th><th style="width: 20px;"></th>
							<th>email</th><th style="width: 20px;"></th>
							<th>addr</th><th style="width: 20px;"></th>
							<th>tel</th>
						</tr>
						<tr>
							<th colspan="11" style="border-bottom: 2px solid #000;height: 20px;"></th>
						</tr>
						<tr>
							<th colspan="11" style="height: 20px;"></th>
						</tr>
						<c:forEach var="dto" items="${glist }">
							<tr>
								<td><a href="gen_info?id=${dto.id }">${dto.id }</td><td style="width: 20px;"></td>
								<td>${dto.name }</td><td style="width: 20px;"></td>
								<td>${dto.birth }</td><td style="width: 20px;"></td>
								<td>${dto.email }</td><td style="width: 20px;"></td>
								<td>${dto.addr }</td><td style="width: 20px;"></td>
								<td>${dto.tel }</td>
							</tr>
						</c:forEach>
					</table>
					<br><br>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>		
</body>
</html>