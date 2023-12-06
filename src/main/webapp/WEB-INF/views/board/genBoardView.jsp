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
<style type="text/css">
		#modal_wrap {
			display : none;
			position : fixed; z-index: 9; margin: auto;
			top: 0; left: 1000; right:0; width: 100%; height: 100%;
			background-color: rgba(0, 0, 0, 0.4); 
			
		}
	</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>

	<div id="modal_wrap" style="margin: auto; border: solid 1px black;">
		<div style="text-align:center; display:inline-block; width: 30%;">
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" onclick="prevImage()">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		    </button>
		</div>
		
		<div style="display:inline-block; width : 40%; margin : auto; padding-top: 20px; text-align: center;">
			<img id="mainImg" width="600" height="600" alt="없음">
			<hr>
			<button type="button" onclick="slide_hide()">취소</button>
		</div>
		
		<div style="text-align:center;  display:inline-block; width:25%;">
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" onclick="nextImage()">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="visually-hidden">Next</span>
      		</button>
		</div>
	</div>
	
	<script type="text/javascript">	
		var num;
		
		function slide_hide() {
			$("#first").hide();
			$("#modal_wrap").hide();
		}
		
		function imgShow(su) {
			var imgId = document.getElementById("mainImg");
			
			num = su;
			console.log("imgShow > ", num)
			if(num == 1) {
				if("${dto.imageName1 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName1 }";
				}
				
			}
			
			if(num == 2) {
				if("${dto.imageName2 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName2 }";
				}
			}
			
			if(num == 3) {
				if("${dto.imageName3 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName3 }";
				}
			}
			
			if(num == 4) {
				if("${dto.imageName4 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName4 }";
				}
			}
			
			if(num == 5) {
				if("${dto.imageName5 }" == "nan") {
					num = 1;
					nextShow(num);
				}else {
					imgId.src = "imgView?name=${dto.imageName5 }";
				}
			}
			
			$("#modal_wrap").show();
		}
		
		function nextImage() {
			num++;
			if(num > 5) {
				num = 1;
			}
			nextShow(num);
		}
		
		function nextShow(num) {
			var imgId = document.getElementById("mainImg");
			
			console.log("nextShow > ", num)
			
			if(num == 1) {
				if("${dto.imageName1 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName1 }";
				}
			}
			console.log("1 > ", num);
			if(num == 2) {
				if("${dto.imageName2 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName2 }";
				}
			}
			console.log("2 > ", num);
			if(num == 3) {
				if("${dto.imageName3 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName3 }";
				}
			}
			console.log("3 >", num);
			if(num == 4) {
				if("${dto.imageName4 }" == "nan") {
					num++;
				}else {
					imgId.src = "imgView?name=${dto.imageName4 }";
				}
			}
			console.log("4 >", num);
			if(num == 5) {
				if("${dto.imageName5 }" == "nan") {
					num = 1;
					imgShow(num);
				}else {
					imgId.src = "imgView?name=${dto.imageName5 }";
				}
			}
			console.log("5 > ", num);
		}
		
		function prevImage() {
			num--;
			if(num < 1) {
				num = 5;
			}
			prevShow(num);
		}
		
		function prevShow() {
			
			var imgId = document.getElementById("mainImg");
			console.log("prevShow > ", num);
			
			if(num == 5) {
				if("${dto.imageName5 }" == "nan") {
					num--;
				}else {
					imgId.src = "imgView?name=${dto.imageName5 }";
				}
			}
			console.log("5 > ", num);
			if(num == 4) {
				if("${dto.imageName4 }" == "nan") {
					num--;
				}else {
					imgId.src = "imgView?name=${dto.imageName4 }";
				}
			}
			console.log("4 > ", num);
			if(num == 3) {
				if("${dto.imageName3 }" == "nan") {
					num--;
				}else {
					imgId.src = "imgView?name=${dto.imageName3 }";
				}
			}
			console.log("3 > ", num);
			if(num == 2) {
				if("${dto.imageName2 }" == "nan") {
					num--;
				}else {
					imgId.src = "imgView?name=${dto.imageName2 }";
				}
			}
			console.log("2 > ", num);
			if(num == 1) {
				if("${dto.imageName1 }" == "nan") {
					num = 5;
					imgShow(num);
				}else {
					imgId.src = "imgView?name=${dto.imageName1 }";
				}
			}
			console.log("1 > ", num);
		}
		
	</script>
	
	concert_content
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>콘서트 제목</strong>
	            <p>여러분들의 여행후기를 올려주세요!</p>
	        </div>
	        <div class="board_view_wrap">
	            <div class="board_view">
	                <div class="title">
	                	<p>${dto.title }</p>
	                </div>
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
	                    
	                </div>
	                
	                
                	<div style="text-align: center;">
	                	<c:choose>
	                		<c:when test="${dto.imageName1 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName1 }" id="img1" onclick="imgShow(1)" width="100" height="100" alt="없음">
	                		</c:when>
	                	</c:choose>

						  
						<c:choose>
	                		<c:when test="${dto.imageName2 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName2 }" id="img2"  onclick="imgShow(2)" width="100" height="100" alt="없음">
	                		</c:when>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName3 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName3 }" id="img3" onclick="imgShow(3)" width="100" height="100" alt="없음">
	                		</c:when>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName4 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName4 }" id="img4" onclick="imgShow(4)" width="100" height="100" alt="없음">
	                		</c:when>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName5 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName5 }" id="img5" onclick="imgShow(5)" width="100" height="100" alt="없음">
	                		</c:when>
	                	</c:choose>
						  <br>
						  <b style="font-size: 12px;">※이미지를 클릭하면 확대됩니다.</b>
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
								  ${dto.content }  
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
					 			<c:choose>
					 			<c:when test="${mlogin!=null }">
					 			<button type="button" onclick="location.href='genModify?writeNo=${dto.writeNo}'">수정</button>
                    			<button type="button" onclick="location.href='genDelete?writeNo=${dto.writeNo}'">삭제</button>
					 			</c:when>
					 			<c:when test="${glogin!=null }">
					 			<c:if test="${genId == dto.id }">
								<button type="button" onclick="location.href='genModify?writeNo=${dto.writeNo}'">수정</button>
                    			<button type="button" onclick="location.href='genDelete?writeNo=${dto.writeNo}'">삭제</button>
								</c:if>
					 			</c:when>
					 			</c:choose>
					 			<button type="button" onclick="location.href='genBoardList'">목록</button>
							</dd>
	                    </dl>
	                </div>
	            </div>
	        </div>
	        
	        <hr>
	        <form action="reply" method="post" style="text-align: center;">	
				<c:if test="${genId != 'undefined' }">
					<input type="hidden" value="${genId }" name="gId">
				</c:if>
	        	<c:if test="${comId != 'undefined' }">
	        		<input type="hidden" value="${comId }" name="cId">
	        	</c:if>
				<input type="hidden" value="${dto.writeNo }" name="writeNo">
	        	<textarea rows="3" cols="70%" style="resize: none;" name="content"></textarea>
	        	<button>답글달기</button>
	        </form>
	        <hr>
	        
	        <script type="text/javascript">
				function modArea(replyNo) {
					$("#modifyArea_"+replyNo).show();
				}
				
				function modCancel(replyNo) {
					$("#modify_"+replyNo).val("");
					$("#modifyArea_"+replyNo).hide();
				}
			</script>
			
	        <c:forEach var="rep" items="${reply }">
	        	<c:choose>
	        	
	        	
	        		<c:when test="${rep.nId != 'nan' }">
	        			일반 사용자 : ${rep.nId } 작성일 : ${rep.saveDate }
	        			<c:if test="${rep.nId == genId }">
	        				<a onclick="modArea('${rep.replyNo }')">수정</a>
	        				<a href="replyDelete?replyNo=${rep.replyNo }&writeNo=${dto.writeNo}">삭제</a>
	        				<div id="modifyArea_${rep.replyNo }" style="display: none;">
			        			<form action="replyModify" method="post">
			        				<textarea rows="3" cols="50%" id="modify_${rep.replyNo }" name="modify"></textarea>
			        				<input type="hidden" value="${dto.writeNo }" name="writeNo">
			        				<input type="hidden" value="${rep.replyNo }" name="replyNo">
				        			<button>수정하기</button>
				        			<input type="button" value="취소" onclick="modCancel('${rep.replyNo }')">
			        			</form>
	        				</div>
	        			</c:if> <br>
	        			작성 내용 : ${rep.content } <br>
	        		</c:when>
	        		
	        		
	        		<c:otherwise>
	        			기업 사용자 : ${rep.cId } 작성일 : ${rep.saveDate } 
	        			<c:if test="${rep.cId == comId }">
	        				<a onclick="modArea(this)">수정</a>
	        				<a href="replyDelete?replyNo=${rep.replyNo }&writeNo=${dto.writeNo}">삭제</a>
	        				<div id="modifyArea" style="display: none;">
			        			<form action="replyModify" method="post">
			        				<textarea rows="3" cols="50%" id="modify" name="modify"></textarea>
			        				<input type="hidden" value="${dto.writeNo }" name="writeNo">
			        				<input type="hidden" value="${rep.replyNo }" name="replyNo">
				        			<button>수정하기</button>
				        			<input type="button" value="취소" onclick="modCancel()">
			        			</form>
	        				</div>
	        			</c:if> <br>
	        			작성 내용 : ${rep.content } <br>
	        		</c:otherwise>
	        		
	        		
	        	</c:choose>
	        	<hr>
	        </c:forEach>
		</div>
	</div>
	</div>
	

<%@ include file="../default/footer.jsp" %>
</body>
</html>