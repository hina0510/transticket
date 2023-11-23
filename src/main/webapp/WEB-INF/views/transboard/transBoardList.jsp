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
	<form action="${contextPath }/board/transBoardList" method="get" id="searchFoam" name="search-form">
        <select name="type" class="type-box">
			<option value="">검색 유형 선택</option>
			<option value="title">제목</option>
			<option value="n_id">작성자</option>
		</select>
		<td colspan="2">
          <input class="inputId" type="text" name="keyword" placeholder="검색어 입력">
        </td>
		<td>
          <input class="submitBtn" type="submit" value="검색하기">
		</td>
	</form>
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
					<td><a href="transBoardView?writeNo=${dto.writeNo }">${dto.title }</a></td>
					<td>${dto.saveDate }</td>
					<td>${dto.viewCount }</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="6">
					<c:forEach var="n" begin="1" end="${repeat }">
						<a href="transBoardList?num=${n }">${n }</a>
					</c:forEach>
				</td>
			</tr>
	</table>
<%@ include file="../default/footer.jsp" %>
</body>
</html>