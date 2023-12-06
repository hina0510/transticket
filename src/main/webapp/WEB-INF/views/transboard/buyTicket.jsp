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
				<div class="board_wrap">
	        		<div class="board_title">
	        			<strong>양도받기</strong>
			        </div>
			    </div>
				<c:set var="cdto" value="${list}" />
				<c:forEach var="i" begin="0" end="${list.size()-1}">
					<form action="ticketChk" method="post">
						<input type="hidden" name="writeNo" value="${writeNo}"><br>
						좌석 : ${cdto[i].conS_id }
						<input type="hidden" name="seat" value="${cdto[i].conS_id }"><br>
						거래자 :${cdto[i].con_buyer }
						<input type="hidden" name="sAccount" value="${alist.account }"><br>
						구매자 : ${glogin}<input type="hidden" name="buyer" value="${glogin}"><br>
						계좌번호 : <input type="text" name="bAccount" placeholder="계좌번호13자리"><br>
						금액 : ${cdto[i].conS_price }<input type="hidden" name="price" value="${cdto[i].conS_price }"><br><br>
						<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>
</html>