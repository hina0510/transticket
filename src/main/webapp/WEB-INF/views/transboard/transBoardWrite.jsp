<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="container2">
				<p style="font-size: 30px;">선물하기<br></p>
				<c:set var="cdto" value="${list}" />
				<c:forEach var="i" begin="0" end="${list.size()-1}">
					<form action="transWriteSave" method="post">
						<select name="category">
							<option value="콘서트">콘서트</option>
							<option value="뮤지컬">뮤지컬</option>
							<option value="전시">전시</option>
						</select>
						<br>
						제목 : ${cdto[i].conS_id }_양도
						<input type="hidden" name="title" value="${cdto[i].conS_id }_양도"><br>
						작성자 :${cdto[i].con_buyer }
						<input type="hidden" readonly name="id" value="${cdto[i].con_buyer }"><br>
						좌석 : ${cdto[i].conS_id }
						<input type="hidden" name="seat" value="${cdto[i].conS_id }"><br>
						<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>

</html>