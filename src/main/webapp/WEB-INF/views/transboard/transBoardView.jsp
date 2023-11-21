<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function alertChat() {
	alert("로그인하세요");
	location.href="${contextPath }/root/member/prelogin";
}
function sellChat() {
	window.open("sellChatList", "", "width=500px, height=700px");
}
function buyChat() {
	window.open("buyChatList", "", "width=500px, height=700px");
}
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>

	transboard_content
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>${dto.title }</strong>
	        </div>
	        <div class="board_view_wrap">
	            <div class="board_view">
	                <div class="info">
	                    <dl>
	                        <dt>글 번호</dt>
	                        <dd>${dto.writeNo }</dd>
	                    </dl>
	                    <dl>
	                        <dt>작성자</dt>
	                        <dd>${dto.id }</dd>
	                    </dl>
	                    <dl>
	                        <dt>작성일</dt>
	                        <dd>${dto.saveDate }</dd>
	                    </dl>
	                    <dl>
	                        <dt>좋아요</dt>
	                        <dd>${dto.likes }</dd>
	                    </dl>
	                    <dl>
	                        <dt>1:1채팅</dt>
	                        <dd>
	                        <c:choose>
	                    		<c:when test="${genId == 'undefined' }">
	                    			<button type="button" onclick="alertChat()">채팅</button>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:if test="${genId == dto.id}">
		                    			<button type="button" onclick="sellChat()">채팅</button>
		                    		</c:if>
	                    			<c:if test="${genId != dto.id}">
		                    			<button type="button" onclick="buyChat()">채팅</button>
		                    		</c:if>
	                    		</c:otherwise>
	                    	</c:choose>
	                    	</dd>
	                    </dl>
	               </div>
	                
	               <div class="info2">
	                    <dl>
	                        <dt>내용</dt>
	                        <dd>
	                        	<nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
									<ul class="nav nav-pills">
										<li class="nav-item">
											<a class="nav-link" href="#scrollspyHeading1">First</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#scrollspyHeading2">Second</a>
										</li>
										<li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Dropdown</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#scrollspyHeading3">Third</a></li>
												<li><a class="dropdown-item" href="#scrollspyHeading4">Fourth</a></li>
												<li><hr class="dropdown-divider"></li>
												<li><a class="dropdown-item" href="#scrollspyHeading5">Fifth</a></li>
											</ul>
										</li>
									</ul>
								</nav>
								<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
								  ${dto.content },  asdsad : ${genId }, likes : ${likes }
								 
								  
								</div>
	                        </dd>
	                    </dl>
	                    <br>
	                    <dl>
	                    	<dd>
	                    		 <form action="likes" method="post">
	                    		 <c:choose>
	                    		 	<c:when test="${genId != 'undefined' }">
		                    		 	<c:choose>
												<c:when test="${genId != dto.id }">
													<c:choose>
														<c:when test="${likes == 'none' }">
															<input type="hidden" value="${genId }" name="id">
									  						<input type="hidden" value="${dto.writeNo }" name="writeNo">
									  						<button>♡</button>
														</c:when>
														<c:otherwise>
															<button disabled>♥</button>
														</c:otherwise>
													</c:choose>	
												</c:when>
												
												<c:otherwise>
													<c:choose>
														<c:when test="${likes == 'none' }">
															<input type="hidden" value="${genId }" name="id">
									  						<input type="hidden" value="${dto.writeNo }" name="writeNo">
									  						<button>♡</button>
														</c:when>
														<c:otherwise>
															<button disabled>♥</button>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
	                    		 	</c:when>
	                    		 	<c:otherwise>
	                    		 	</c:otherwise>
	                    		 	
	                    		 </c:choose>
								  </form>
					 			<c:if test="${genId == dto.id }">
								<button type="button" onclick="location.href='transModify?writeNo=${dto.writeNo}'">수정</button>
                    			<button type="button" onclick="location.href='transDelete?writeNo=${dto.writeNo}'">삭제</button>
								</c:if>
					  			<button type="button" onclick="location.href='transBoardList'">목록</button>
							</dd>
	                    </dl>
	                </div>
	            </div>
	        </div>
		</div>
	</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</body>
</html>