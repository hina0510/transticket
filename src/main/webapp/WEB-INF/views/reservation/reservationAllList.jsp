<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
	@font-face {
      font-family: 'omyu_pretty';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="container2">
				<p style="font-size: 30px;">예약확인<br></p>
				<c:choose>
					<c:when test="${list.size()==0}">
						예매한 티켓이 없습니다<br>
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
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>
</html>