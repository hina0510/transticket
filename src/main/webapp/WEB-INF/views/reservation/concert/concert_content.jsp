<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/contentScript.js"></script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	concert_content
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>콘서트 제목</strong>
		            <p>콘서트 예매</p>
		        </div>
		        <div class="board_view_wrap">
		            <div class="board_view">
		            	<div class="board_view_title">
			            	<nav class="board_view_title_nav">
			            		<img src="download?file=${dto.imageName1 }">
			            	</nav>
			        		<section class="board_view_title_sec">
			        			<div class="title">
				                	<p>${dto.title }</p>
				                </div>
				                <div class="info">
				                	<div class="info_div01">
				                		<dl>
					                        <dt>글 번호</dt>
					                        <dd>${dto.writeNo }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성자</dt>
					                        <dd>${dto.comname }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성일</dt>
					                        <dd>${dto.saveDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>조회수</dt>
					                        <dd>${dto.hit}</dd>
					                    </dl>
				                	</div>
				                	<div class="info_div02">
					                    <dl>
					                        <dt>장소</dt>
					                        <dd>${dto.con_place}</dd>
					                    </dl>
					                    <dl>
					                        <dt>일시</dt>
					                        <dd>${dto.con_stDate} ~ ${dto.con_endDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>좋아요</dt>
					                        <dd>${dto.form}</dd>
					                    </dl>
					                    <dl>
					                        <dt>가격</dt>
					                        <dd>${dto.price}</dd>
					                    </dl>
					                    <dl>
					                        <div class="frame">
												<button class="custom-btn btn-3" onclick="location.href='concert_${dto.form}?writeNo=${dto.writeNo }'"><span>예매하기</span></button>
											</div>
					                    </dl>
				                	</div>
				                </div>
			        		</section>
		                </div>
		                <div class="board_view_info">
							<ul class="tabs3"><!-- 폼 탭 -->
								<label><li class="tab-link current" data-tab="tab-1">form01</li></label>
								<label><li class="tab-link" data-tab="tab-2">form02</li></label>
								<label><li class="tab-link" data-tab="tab-3">form03</li></label>
							</ul>
							<div id="tab-1" class="tab-content3 current">
								<h4>캐스팅</h4>
									<img src="#" alt="#">
									<h6>artist name</h6><br>
														
								<h4>공연시간 정보</h4>
									<h6>예매가능시간: 전일17시(월~토 관람 시)까지/전일 11시(일요일 관람 시)까지<br>
										금 19시 30분 / 토 18시 / 일 17시</h6><br>
										
								<%@ include file="concert_info01.jsp" %><br>
								
								<h4>공연상세 / 출연진정보<br></h4>
									<div style="text-align: center;">
				                		<c:if test="${dto.imageName1 != 'nan' }">
				                			<img src="download?file=${dto.imageName1 }" alt="${dto.imageName1 }">
				                		</c:if>
				                		<c:if test="${dto.imageName2 != 'nan' }">
				                			<img src="download?file=${dto.imageName2 }" alt="${dto.imageName2 }">
				                		</c:if>
				                		<c:if test="${dto.imageName3 != 'nan' }">
				                			<img src="download?file=${dto.imageName3 }" alt="${dto.imageName3 }">
				                		</c:if>
				                		<c:if test="${dto.imageName4 != 'nan' }">
				                			<img src="download?file=${dto.imageName4 }" alt="${dto.imageName4 }">
				                		</c:if>
				                		<c:if test="${dto.imageName5 != 'nan' }">
				                			<img src="download?file=${dto.imageName5 }" alt="${dto.imageName5 }">
				                		</c:if>
									</div>
								<p>${dto.content}</p>
							</div>
							<div id="tab-2" class="tab-content3"><%@ include file="concert_info02.jsp" %></div>
							<div id="tab-3" class="tab-content3"><%@ include file="concert_info03.jsp" %></div>
		                </div>
					</div>
		            <div class="frame">
						<button class="custom-btn btn-3" onclick="location.href='modify_concert_form?writeNo=${dto.writeNo }'"><span>수정</span></button>
						<button class="custom-btn btn-3" onclick="location.href='concert_board'"><span>목록</span></button>
					</div>
		        </div>
		    </div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>