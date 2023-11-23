<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<table border="1">
			<tr>
				<th>번호</th><th>id</th><th>제목</th><th>날짜</th><th>조회수</th>
			<tr>
			
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="6"> 작성된 글이 없습니다.</th>
				</tr>
			</c:if>

			<c:forEach var="dto" items="${list }">
				<tr>
					<c:choose>
						<c:when test="${dto.category != '공지' }">
							<td>${dto.writeNo }</td>
						</c:when>
						<c:otherwise>
							<td>${dto.category }</td>
						</c:otherwise>
					</c:choose>
					<td>${dto.id }</td>
					<td><a href="genBoardView?writeNo=${dto.writeNo }">${dto.title }</a></td>
					<td>${dto.saveDate }</td>
					<td>${dto.viewCount }</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="6">
					<c:forEach var="n" begin="1" end="${repeat }">
						<a href="genBoardList?num=${n }">${n }</a>
					</c:forEach>
					<a href="genWrite">글 작성</a>
				</td>
			</tr>
	</table>
<%@ include file="../default/footer.jsp" %>
</body>
</html>