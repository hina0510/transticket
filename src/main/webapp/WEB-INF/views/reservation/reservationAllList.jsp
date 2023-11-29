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
<script type="text/javascript">
	function present() {
		location.href="${contextPath }/root/reservation/presentTicket?conS_id=${cdto[i].conS_id }";
	}
</script>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="container2">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>예약확인</strong>
		        </div>
		    </div>
				<c:choose>
					<c:when test="${list.size()==0}">
						예매한 티켓이 없습니다<br>
					</c:when>
					<c:otherwise>
					<c:set var="cdto" value="${list}" />
					<c:forEach var="i" begin="0" end="${list.size()-1}">
						<section class="ticketbox">
							<div class="text">
								제목 : ${cdto[i].con_title }<br>
								구매자 : ${cdto[i].con_buyer }<br>
								좌석 : ${cdto[i].conS_id }<br>
								날짜 : ${cdto[i].con_date }<br>
								장소 : ${cdto[i].con_place }<br>
								결제 : ${cdto[i].con_payed }<br>
								가격 : ${cdto[i].conS_price }<br>
							</div>
							<c:choose>
								<c:when test="${cdto[i].con_payed =='payed'}">
									<div class="button">
										<form action="presentTicket" method="post">
											<input type="hidden" name="seat" value="${cdto[i].conS_id }">
											<button class="custom-btn btn-3" type="submit"><span>선물하기</span></button>
										</form>
										<c:if test="${cdto[i].conS_write == 0 }">
											<form action="/root/transboard/transWrite" method="post">
												<input type="hidden" name="seat" value="${cdto[i].conS_id }">
												<button class="custom-btn btn-3" type="submit"><span>양도글 게시</span></button>
											</form>
										</c:if>
										<form action="cancelTicket" method="post" onsubmit="return confirm('환불하시겠습니까?\n수수료 2000원이 차감됩니다.')">
											<input type="hidden" name="buyer" value="${cdto[i].con_buyer }">
											<input type="hidden" name="seat" value="${cdto[i].conS_id }">
											<input type="hidden" name="price" value="${cdto[i].conS_price }">
											<button class="custom-btn btn-3" type="submit"><span>좌석 환불</span></button>
										</form>
									</div>
								</c:when>
								<c:otherwise>
									<div class="button">
										<button class="custom-btn btn-3" type="button" onclick="location.href='concert_Payment?con_title=${cdto[i].con_title }&&con_buyer=${cdto[i].con_buyer }&&price=${cdto[i].conS_price }'"><span>결제하기</span></button>
									</div>
								</c:otherwise>
							</c:choose>
						</section>
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