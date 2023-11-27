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
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script>
  alert("URL을 직접 입력해서 접근하셨습니다.로그인후 정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="prelogin";
 </script>
<%
  return;
 }
%>
<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>my page</strong>
		        </div>
		        <button class="custom-btn btn-3" onclick="location.href='${contextPath }/member/com_info?id=${cominfo.dto.id }'"><span>기업정보</span></button><br><br>
				<button class="custom-btn btn-3" onclick="location.href='concert_board'"><span>작성한 글</span></button>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>