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
			display:none;
			position : fixed; z-index: 9; margin: auto;
			top: 0; left: 1000; right:0; width: 100%; height: 100%;
			background-color: rgba(0, 0, 0, 0.4); 
			
		}
		
	</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>

	<div id="modal_wrap">
		<div style="display:inline-block; width: 200px; background: red;" onclick="showNextImage()">ㅇㅇㅇㅇㅇ</div>
		<div style="display:inline-block; width : 650px; margin : auto; padding-top: 20px;">
			<img src="imgView?name=${dto.imageName1 }" width="600" height="600" alt="없음">
			<hr>
			<button type="button" onclick="rep()">답글</button>
			<button type="button" onclick="slide_hide()">취소</button>
		</div>
		<div style="display: inline; width: 200px; background: red;" onclick="showPreviousImage()">asddd</div>
	</div>
	
	<script type="text/javascript">	
	var currentImage = 1; // 현재 이미지 인덱스
	var totalImages = 5; // 전체 이미지 수
	
	function slide_hide() {
		$("#first").hide();
		$("#modal_wrap").hide();
	}
	
	function showNextImage() {
	    if (currentImage < totalImages) {
	        currentImage++;
	    } else {
	        currentImage = 1; // 마지막 이미지 다음에는 첫 번째 이미지로 이동
	    }
	    updateSlideshow();
	}

	function showPreviousImage() {
	    if (currentImage > 1) {
	        currentImage--;
	    } else {
	        currentImage = totalImages; // 첫 번째 이미지에서 이전에는 마지막 이미지로 이동
	    }
	    updateSlideshow();
	}
	
	function updateSlideshow() {
		$("#modal_wrap").show();
	    for (var i = 1; i <= totalImages; i++) {
	        var image = document.getElementById('img' + i);
	        if (i === currentImage) {
	            image.style.display = 'block'; // 현재 이미지 표시
	        } else {
	            image.style.display = 'none'; // 다른 이미지 숨김
	        }
	    }
	}

	updateSlideshow();
	
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
	                			<img src="imgView?name=${dto.imageName1 }" id="img1" onclick="updateSlideshow()" width="100" height="100" alt="없음">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img1" onclick="slideClick()" width="100" height="100" alt="없음" >
	                		</c:otherwise>
	                	</c:choose>

						  
						<c:choose>
	                		<c:when test="${dto.imageName2 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName2 }" id="img2"  onclick="updateSlideshow()" width="100" height="100" alt="없음">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img2" onclick="" width="100" height="100" alt="없음" >
	                		</c:otherwise>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName3 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName3 }" id="img3" onclick="updateSlideshow()" width="100" height="100" alt="없음">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img3" onclick="" width="100" height="100" alt="없음" >
	                		</c:otherwise>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName4 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName4 }" id="img4" onclick="" width="100" height="100" alt="없음">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img4" onclick="" width="100" height="100" alt="없음" >
	                		</c:otherwise>
	                	</c:choose>
						  
						  <c:choose>
	                		<c:when test="${dto.imageName5 != 'nan' }">
	                			<img src="imgView?name=${dto.imageName5 }" id="img5" onclick="" width="100" height="100" alt="없음">
	                		</c:when>
	                		<c:otherwise>
	                			<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img5" onclick="" width="100" height="100" alt="없음" >
	                		</c:otherwise>
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
								  <h4 id="scrollspyHeading1">
								  ${dto.content }
								  <p>...</p>
								  <h4 id="scrollspyHeading2">
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading<br>
								  Second headingSecond headingSecond heading</h4>
								  <p>...</p>
								  <h4 id="scrollspyHeading3">
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading<br>
								  Third headingThird headingThird heading</h4>
								  <p>...</p>
								  <h4 id="scrollspyHeading4">
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading<br>
								  Fourth headingFourth headingFourth heading</h4>
								  <p>...</p>
								  <h4 id="scrollspyHeading5">
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading<br>
								  Fifth headingFifth headingFifth heading</h4>
								  <p>...</p>
								</div>
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dd>
	                    		<button type="button" onclick="location.href='genModify?writeNo=${dto.writeNo}'">수정</button>
	                    		<button type="button" onclick="location.href='genDelete?writeNo=${dto.writeNo}'">삭제</button>
								<button type="button" onclick="location.href='genBoardList'">목록</button>
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