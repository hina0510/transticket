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
				<p style="font-size: 30px;">선물하기<br></p>
				<c:set var="cdto" value="${list}" />
				<c:forEach var="i" begin="0" end="${list.size()-1}">
					<form action="presentChk" method="post">
						제목 : ${cdto[i].con_title }<br>
						구매자 ID : ${cdto[i].con_buyer }<br>
						선물할 사람 ID : <input type="text" name="receiver"><br>
						좌석 : ${cdto[i].conS_id }
						<input type="hidden" name="seat" value="${cdto[i].conS_id }"><br>
						<button class="custom-btn btn-3" type="submit"><span>선물하기</span></button>
					</form>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>
</html>