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
<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>양도게시판</strong>
		        </div>
		    </div>
			<div class="container">
				<form action="${contextPath }/transboard/transBoardList" method="get" id="searchFoam" name="search-form">
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
				<br>
				<table style="text-align: center;">
						<tr>
							<th>번호</th><th style="width: 20px;"></th><th>id</th><th style="width: 20px;"></th>
							<th>제목</th><th style="width: 20px;"></th><th>날짜</th><th style="width: 20px;"></th><th>조회수</th>
						<tr>
						<tr>
							<th colspan="9" style="border-bottom: 2px solid #000;height: 20px;"></th>
						</tr>
						<tr>
							<th colspan="9" style="height: 20px;"></th>
						</tr>
						<c:if test="${list.size() == 0 }">
							<tr>
								<th colspan="6"> 작성된 글이 없습니다.</th>
							</tr>
						</c:if>
			
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.writeNo }</td>
								<td style="width: 20px;"></td>
								<td>${dto.id }</td>
								<td style="width: 20px;"></td>
								<td><a href="transBoardView?writeNo=${dto.writeNo }">${dto.title }</a></td>
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
									<button class="custom-btn6" onclick="location.href='concert_board?num=${n }'">${n }</button>
								</c:forEach>
								<button class="custom-btn6" onclick="">&gt;</button>
							</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</body>
</html>