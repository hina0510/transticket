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
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>${dto.title }</strong>
	        	</div>
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
			                    	</c:choose>
								</form>
							</dd>
		                </dl>
					</div>
		                
					<div class="info2">
		            	<dl>
		                	<dt>내용</dt>
		                	<dd>
		                    	<c:if test="${genId != 'undefined' }">
			                    	<c:if test="${genId != dto.id }">
				                    	<form action="buyTicket" method="post">
											<input type="hidden" name="writeNo" value="${dto.writeNo }">
											<input type="hidden" name="seller" value="${dto.id }">
											<input type="hidden" name="seat" value="${dto.content }">
											<button class="custom-btn btn-3" type="submit"><span>양도받기</span></button>
										</form>
									</c:if>
								</c:if>
							</dd>
						</dl>
		                <dl>
		                    <dd>
								 ${dto.content },  
								  일반 사용자 : ${genId }, <br>
								  기업 사용자 : ${comId }, <br>  
								  좋아요 : ${likes }
		                    </dd>
		                </dl>
		                <br>
		                <dl>
		                	<dd>
						 		<c:if test="${genId == dto.id }">
		                    		<button class="custom-btn btn-3" type="button" onclick="location.href='transDelete?writeNo=${dto.writeNo}'">삭제</button>
									<button class="custom-btn btn-3" type="button" onclick="location.href='transBoardList'">목록</button>
								<br><br>
								</c:if>
							</dd>
		                </dl>
		            </div>
		        </div>
			</div>
		</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</body>
</html>