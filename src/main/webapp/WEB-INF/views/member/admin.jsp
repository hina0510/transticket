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
<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>my page</strong>
		        </div>
		        <button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/com_info?id=${cominfo.dto.id }'"><span>관리자정보</span></button><br><br>
		        <button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/glist'"><span>개인회원목록</span></button><br><br>
				<button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/clist'"><span>기업회원목록</span></button><br><br>
			</div>
		</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</body>
</html>