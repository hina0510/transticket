<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
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
					<form action="concert_BuySeat" method="post">
						<p>계좌번호 : <input type="text" placeholder="계좌번호13자리" name="account"><br>
						제목 : ${title }<input type="hidden" name="title" value="${title }"><br>
						구매자 : ${buyer }<input type="hidden" name="buyer" value="${buyer }"><br>
						금액 : ${price }<input type="hidden" name="price" value="${price }"><br></p>
						<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>