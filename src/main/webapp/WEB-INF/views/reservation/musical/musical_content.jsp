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
<%@ include file="../../default/header.jsp" %>
	musical_content
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>뮤지컬 제목</strong>
		            <p>뮤지컬 예매</p>
		        </div>
		        <div class="board_view_wrap">
		            <div class="board_view">
		            	<div class="board_view_title">
			            	<nav class="board_view_title_nav">
			            		<img src="#">
			            	</nav>
			        		<section class="board_view_title_sec">
			        			<div class="title">
				                	<p>d</p>
				                </div>
				                <div class="info">
				                	<div class="info_div01">
				                		<dl>
					                        <dt>글 번호</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성자</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성일</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <dt>조회수</dt>
					                        <dd>d</dd>
					                    </dl>
				                	</div>
				                	<div class="info_div02">
					                    <dl>
					                        <dt>장소</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <dt>일시</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <dt>좋아요</dt>
					                        <dd>d</dd>
					                    </dl>
					                    <dl>
					                        <div class="frame">
												<button class="custom-btn btn-3" onclick="location.href='musical_form01'"><span>예매하기</span></button>
											</div>
					                    </dl>
				                	</div>
				                </div>
			        		</section>
		                </div>
		                <div class="info2">
		                    <dl>
		                        <nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
										<ul class="nav nav-pills">
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading1">First</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading2">Second</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading3">Third</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading4">Fourth</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading5">Fifth</a>
											</li>
										</ul>
									</nav>
									<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
									  <h4 id="scrollspyHeading1">
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading<br>
									  First headingFirst headingFirst heading</h4>
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
		                    </dl>
		                </div>
		                <div class="frame">
							<button class="custom-btn btn-3" onclick="location.href='modify_musical_form'"><span>수정</span></button>
							<button class="custom-btn btn-3" onclick="location.href='musical_board'"><span>목록</span></button>
						</div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>