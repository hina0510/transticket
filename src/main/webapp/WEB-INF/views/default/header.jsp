<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/js/daumPost.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
    @font-face {
      font-family: 'omyu_pretty';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }
    nav {
      font-family: 'omyu_pretty';
    }
    #trin {width: 190px; height: 120px;}
    #main01 {width: 100%; height: 150px; display:flex; flex-flow:row;}
    #main01>#title{padding: 1.2% 15%; width: 65%;}
    #main01>#login{width: 45%; font-family: 'omyu_pretty'; 
    	font-size: 20px; text-align: center; margin: 4%;}

    a { text-decoration: none; color: black;}
    .li01 {list-style-type: none; font-size: 15px; padding-left: 1px; text-align: left;}
    nav a {text-decoration: none; color: black;}
    nav label {padding: 0 100px 0 100px; }
    
    .navbar {margin: 0 7%}

    .dropdown{
        position : relative;
        display : inline-block;
    }
    .dropdown-item{
    	font-size: 18px;
    	text-align: center;
    }
    .dropdown-content{
        display : none;
        position : absolute;
        z-index : 1; 
    }

    .dropdown-content a{
        display : block;
        flex-flow: row wrap; 
        width: 100px; height: 20px; 
        margin: auto;
    }

    .dropdown:hover .dropdown-content {
        display: block; 
    }
    .login01{
    	margin: 0 2%;
    }
</style>
<script>
function clogchk(){
	 if (confirm("로그아웃 하겠습니까??") == true){
		 location.href='${contextPath }/member/clogout'
	 }else{
		 return false;
	}
}
function glogchk(){
	 if (confirm("로그아웃 하겠습니까??") == true){
		 location.href='${contextPath }/member/glogout'
	 }else{
		 return false;
	}
}
function loginfo(){
	if (confirm("로그인 먼저하세요") == true){
		 location.href='${contextPath }/member/prelogin'
	 }else{
		 return false;
	}
}
</script>
</head>
<body>
	<header>
		<div id="main01">
			<dd id="title">
			    <a href="${contextPath }/">transticket</a>
			</dd>
			<dd id="login">
				<c:choose>
					<c:when test="${clogin!=null }">
						<a onclick="clogchk()" class="login01">로그아웃</a>
					</c:when>
					<c:when test="${glogin!=null }">
						<a onclick="glogchk()" class="login01">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath }/member/prelogin" class="login01">로그인</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${clogin==null and glogin==null  }">	
					<a href="${contextPath }/member/gen_register_view" class="login01">회원가입</a>
				</c:if>
				<c:choose>
					<c:when test="${clogin!=null }">
						<a href="${contextPath }/member/com_mypage" class="login01">마이페이지</a>	
					</c:when>
					<c:when test="${glogin!=null }">
						<a href="${contextPath }/member/gen_mypage" class="login01">마이페이지</a>	
					</c:when>
					<c:otherwise>
						<a onclick="loginfo()" class="login01">마이페이지</a>
					</c:otherwise>
				</c:choose>
			    <a href="#" class="login01">예약확인/취소</a>
			</dd>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0% 5%;">
			<div class="container-fluid">
				<li class="li01">
					<button class="btn btn-light" style="font-size: 24px;">
				  		<a href="${contextPath }/reservation/concert_board">콘서트</a>
				  	</button>
				</li>
				<li class="li01">
				  	<button class="btn btn-light" style="font-size: 24px;">
				  		<a href="${contextPath }/reservation/musical_board">뮤지컬</a>
				  	</button>
				</li>
				<li class="li01">
				  	<button class="btn btn-light" style="font-size: 24px;">
				  		<a href="${contextPath }/reservation/exhibition_board">전시</a>
				  	</button>
				</li>
				<li class="li01"> 
				  	<button class="btn btn-light" style="font-size: 24px;">
				  		<a href="#">양도게시판</a>
				  	</button>
				</li>
				<li class="li01">
				  	<button class="btn btn-light" style="font-size: 24px;">
				  		<a href="#">자유게시판</a>
				  	</button>
				</li>
			</div>
		</nav>
	<hr>
	</header>
</body>
</html>