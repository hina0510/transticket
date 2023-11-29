<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>작성한 글 목록</strong>
		        </div>
		    </div>
		    <div class="container">
				<table style="text-align: center;">
					<tr>
						<th>번호</th><th style="width: 20px;"><th>id</th><th style="width: 20px;">
						<th>제목</th><th style="width: 20px;"><th>날짜</th><th style="width: 20px;"><th>조회수</th>
					<tr>
					<tr>
						<th colspan="9" style="border-bottom: 2px solid #000;height: 20px;"></th>
					</tr>
					<tr>
						<th colspan="9" style="height: 20px;"></th>
					</tr>
					<c:if test="${list.size() == 0 }">
						<tr>
							<th colspan="9"> 작성된 글이 없습니다.</th>
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
							<td style="width: 20px;"></td>
							<td>${dto.id }</td>
							<td style="width: 20px;"></td>
							<td><a href="genBoardView?writeNo=${dto.writeNo }">${dto.title }</a></td>
							<td style="width: 20px;"></td>
							<td>${dto.saveDate }</td>
							<td style="width: 20px;"></td>
							<td>${dto.viewCount }</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="9">
							<br>
							<button class="custom-btn6" onclick="">&lt;</button>
							<c:forEach var="n" begin="1" end="${repeat }">
								<button class="custom-btn6" onclick="location.href='genBoardMypage?type=${type }&keyword=${keyword }&num=${n }'">${n }</button>
							</c:forEach>
							<button class="custom-btn6" onclick="">&gt;</button>
							<br><br>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</body>
</html>