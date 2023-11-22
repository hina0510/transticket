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
			<div class="con03">
				<form action="transWriteSave" method="post" enctype="multipart/form-data">
					<select name="category">
						<option value="공지">공지</option>
						<option value="자유">자유</option>
					</select>
					제목 : <input type="text" name="title">
					작성자 :<input type="text" readonly name="id" value="${genId }"><br>
					
					<c:choose>
						<c:when test="${list.size()==0}">
							예매한 티켓이 없습니다<br>
						</c:when>
						<c:otherwise>
						<c:set var="cdto" value="${list}" />
						<c:forEach var="i" begin="0" end="${list.size()-1}">
							<label>
							<input type="radio" name="seat" id="${cdto[i].conS_id }" value="${cdto[i].conS_id }">
							<!-- <input type="hidden" name="seat" value="${cdto[i].conS_id }"> -->
							<div>
							제목 : ${cdto[i].con_title }<br>
							구매자 : ${cdto[i].con_buyer }<br>
							좌석 : ${cdto[i].conS_id }<br>
							날짜 : ${cdto[i].con_date }<br>
							장소 : ${cdto[i].con_place }<br>
							결제 : ${cdto[i].con_payed }<br>
							가격 : ${cdto[i].conS_price }
							</div>
							</label>
							<hr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					
					<input type="submit" value="전송"><br>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>

</html>