<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		  
		  $('ul.tabs2 li').click(function(){
		    var tab_id = $(this).attr('data-tab');

		    $('ul.tabs2 li').removeClass('current');
		    $('.tab-content').removeClass('current');

		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
		var msg = '${msg}';
		console.log(msg);
		if(msg =='가입완료') {
		    alert("회원가입완료");
		  }else if(msg=='로그인실패'){
			  alert("아이디나 비밀번호를 확인해주세요.");
		  }else if(msg=='기업로그인성공'){
		    	alert("기업 로그인 성공");
		    	location.href='${contextPath }/root'
		  }else if(msg=='개인로그인성공'){
		    	alert("개인 로그인 성공");
		    	location.href='${contextPath }/root'
		  }
		  
		
		})
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02" style="text-align: center;">
			<ul class="tabs2">
				<li class="tab-link current" data-tab="tab-1">개인회원 로그인</li>
				<li class="tab-link" data-tab="tab-2" >기업회원 로그인</li>
			</ul>
									
			<div id="tab-1" class="tab-content current"><%@ include file="genmember/gen_login.jsp" %></div>
			<div id="tab-2" class="tab-content"><%@ include file="commember/com_login.jsp" %></div>
		</div>
	</div>

<%@ include file="../default/footer.jsp" %>
</body>
</html>