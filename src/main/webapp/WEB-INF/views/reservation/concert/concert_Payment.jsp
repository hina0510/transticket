<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	결제정보 확인
	<c:choose>
		<c:when test="${list.size()==0}">
			예매할 티켓이 없습니다
		</c:when>
		<c:otherwise>
		<c:set var="cdto" value="${list}" />
		<c:forEach var="i" begin="0" end="${list.size()-1}">
			제목 : ${cdto[i].con_title }<br>
			구매자 : ${cdto[i].con_buyer }<br>
			좌석 : ${cdto[i].conS_id }<br>
			날짜 : ${cdto[i].con_date }<br>
			장소 : ${cdto[i].con_place }<br>
			결제 : ${cdto[i].con_payed }<br>
			가격 : ${cdto[i].conS_price }
			<hr>
		</c:forEach>
		수 : ${list.size()}
		<c:set var="count" value="${list.size()}" />
		가격 : ${ count * cdto[0].conS_price }
		</c:otherwise>
	</c:choose>
	
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>