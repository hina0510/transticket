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
	결제정보 확인<br>
	<form action="exhibition_BuySeat" method="post">
	계좌번호 : <input type="text" placeholder="계좌번호13자리" name="account">
	제목 : <input type="text" name="title" value="${title }">
	구매자 : <input type="text" name="buyer" value="${buyer }">
	금액 : <input type="text" name="price" value="${price }">
	<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
	</form>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>