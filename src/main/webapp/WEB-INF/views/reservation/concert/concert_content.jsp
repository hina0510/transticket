<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript">
	$(document).ready(function(){
		  
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');

		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');

		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
	})
</script>
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
			            		<img src="download?file=${cdto.imageName1 }">
			            	</nav>
			        		<section class="board_view_title_sec">
			        			<div class="title">
				                	<p>${cdto.title }</p>
				                </div>
				                <div class="info">
				                	<div class="info_div01">
				                		<dl>
					                        <dt>글 번호</dt>
					                        <dd>${cdto.writeNo }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성자</dt>
					                        <dd>${cdto.comname }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성일</dt>
					                        <dd>${cdto.saveDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>조회수</dt>
					                        <dd>${cdto.hit}</dd>
					                    </dl>
				                	</div>
				                	<div class="info_div02">
					                    <dl>
					                        <dt>장소</dt>
					                        <dd>${cdto.con_place}</dd>
					                    </dl>
					                    <dl>
					                        <dt>일시</dt>
					                        <dd>${cdto.con_stDate} ~ ${cdto.con_endDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>좋아요</dt>
					                        <dd>${cdto.form}</dd>
					                    </dl>
					                    <dl>
					                        <div class="frame">
												<button class="custom-btn btn-3" onclick="location.href='concert_${cdto.form}?writeNo=${cdto.writeNo }'"><span>예매하기</span></button>
											</div>
					                    </dl>
				                	</div>
				                </div>
			        		</section>
		                </div>
		                <div class="info2">
		                	<div class="container">
								<ul class="tabs">
								  	<label for="tab1"><li class="tab-link current" data-tab="tab-1">tab1</li></label>
								  	<label for="tab2"><li class="tab-link" data-tab="tab-2">tab2</li></label>
								  	<label for="tab3"><li class="tab-link" data-tab="tab-3">tab3</li></label>
								</ul>
								
								<div id="tab-1" class="tab-content current"><%@ include file="concert_info01.jsp" %></div>
								<div id="tab-2" class="tab-content"><%@ include file="concert_info02.jsp" %></div>
								<div id="tab-3" class="tab-content"><%@ include file="concert_info03.jsp" %></div>
							</div>
		                </div>
					</div>
		            <div class="frame">
						<button class="custom-btn btn-3" onclick="location.href='modify_concert_form'"><span>수정</span></button>
						<button class="custom-btn btn-3" onclick="location.href='concert_board'"><span>목록</span></button>
					</div>
		        </div>
		    </div>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>