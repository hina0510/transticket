<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	
	<c:choose>
		<c:when test="${list.size()==0}">
			예매할 티켓이 없습니다
		</c:when>
		<c:otherwise>
		<c:set var="edto" value="${list}" />
		<c:forEach var="i" begin="0" end="${list.size()-1}">
			제목 : ${edto[i].ex_title }<br>
			구매자 : ${edto[i].ex_buyer }<br>
			좌석 : ${edto[i].exS_id }<br>
			날짜 : ${edto[i].ex_date }<br>
			장소 : ${edto[i].ex_place }<br>
			결제 : ${edto[i].ex_payed }<br>
			가격 : ${edto[i].exS_price }
			<hr>
		</c:forEach>
		수 : ${list.size()}
		<c:set var="count" value="${list.size()}" />
		가격 : ${ count * edto[0].exS_price }
		</c:otherwise>
	</c:choose>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>