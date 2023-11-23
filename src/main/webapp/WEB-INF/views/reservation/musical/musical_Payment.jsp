<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>결제정보 확인</strong>
		        </div>
				<div class="board_view_info">
					<form action="musical_BuySeat" method="post">
						계좌번호 : <input type="text" placeholder="계좌번호13자리" name="account"><br>
						제목 : <input type="text" name="title" value="${title }"><br>
						구매자 : <input type="text" name="buyer" value="${buyer }"><br>
						금액 : <input type="text" name="price" value="${price }"><br>
						<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>