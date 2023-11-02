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
			            		<img src="download?file=${mdto.imageName1 }">
			            	</nav>
			        		<section class="board_view_title_sec">
			        			<div class="title">
				                	<p>${mdto.title }</p>
				                </div>
				                <div class="info">
				                	<div class="info_div01">
				                		<dl>
					                        <dt>글 번호</dt>
					                        <dd>${mdto.writeNo }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성자</dt>
					                        <dd>${mdto.comname }</dd>
					                    </dl>
					                    <dl>
					                        <dt>작성일</dt>
					                        <dd>${mdto.saveDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>조회수</dt>
					                        <dd>${mdto.hit}</dd>
					                    </dl>
				                	</div>
				                	<div class="info_div02">
					                    <dl>
					                        <dt>장소</dt>
					                        <dd>${mdto.mu_place}</dd>
					                    </dl>
					                    <dl>
					                        <dt>일시</dt>
					                        <dd>${mdto.mu_stDate} ~ ${mdto.mu_endDate}</dd>
					                    </dl>
					                    <dl>
					                        <dt>좋아요</dt>
					                        <dd>${mdto.form}</dd>
					                    </dl>
					                    <dl>
					                        <div class="frame">
												<button class="custom-btn btn-3" onclick="location.href='musical_${mdto.form}?writeNo=${mdto.writeNo }'"><span>예매하기</span></button>
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
												<a class="nav-link" href="#scrollspyHeading1">공연정보</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading2">판매정보</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#scrollspyHeading3">기대평</a>
											</li>
										</ul>
									</nav>
									<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
									  <h4 id="scrollspyHeading1">
									  	캐스팅
									  <img src="#" alt="#">
									  <h6>artist name</h6><br>
									  	공연시간 정보
									  <h6>예매가능시간: 전일17시(월~토 관람 시)까지/전일 11시(일요일 관람 시)까지<br>
											금 19시 30분 / 토 18시 / 일 17시</h6><br>
									 	공지사항
									 <h6>※ 본 공연은 지정된 공식 예매처가 아닌 다른 경로를 통한 개인 간의 직거래, 예매대행, 티켓 위조 등의 위법행위를 엄격히 금지하고 있습니다. 불법거래 혹은 비정상적인 방법을 통한 예매 시도 등 부정한 방법을 통한 예매 건 혹은 이에 준하는 부정한 이용으로 확인되는 경우, 해당 예매 건은 사전 통보 없이 예매 취소 처리될 수 있습니다. 이 경우 티켓의 환불은 불가하니 각별히 주의해 주시기 바라며, 그로 인해 발생한 피해에 대해 공연 주최/주관사와 예매처 모두 책임지지 않습니다. 공연 당일 현장에서 본인 확인이 이루어질 수 있으니 반드시 관람하실 본인 명의의 ID로 예매 후, 관람 당일 예매자 본인의 신분을 나타낼 수 있는 신분증을 실물로 지참하여 주시기 바랍니다.<br>
										※ 본 예매페이지에 기재된 <유효 신분증> 기준에 맞지 않는 수단으로는 어떠한 사유로도 본인 확인 및 티켓 수령이 불가하오니 안내되는 상황을 잘 확인하시어 공연 관람에 불이익이 없으시기 바랍니다.<br>
										※ 티켓 예매 시 예매페이지에 기재된 공연 안내사항에 동의한 것으로 간주하며, 본 내용은 정부 지침 및 기획사 사정에 따라 추가 또는 변경될 수 있습니다. 공연 관람에 지장이나 불이익을 받지 않도록 관람 전 반드시 공연 안내사항을 재확인 부탁드립니다.<br><br>
										[결제 안내]<br>
										무통장 입금 방식으로 예매 시 입금 마감 기한은 예매 당일 23시 59분까지 입니다.<br>
										지정 기한 내 입금을 완료하셔야 예매가 완료되며, 입금 기한이 지난 경우 예매가 자동 취소됩니다.<br>
										입금 마감 기한을 반드시 확인하시기 바랍니다. (단, 22시 30분 이후에는 은행 점검으로 인해 입금이 제한 될 수 있으니 유의하시기 바랍니다.)</h6><br><br>
										할인정보
										<h6>- 장애인 할인(동반 1인 포함) 30%<br>
											- 국가유공자 할인(본인만) 30%<br><br>
											*증빙 미 지참 시 차액 지불</h6><br>
										공연상세 / 출연진정보<br>
										<img src="#" alt="#">
									  <h4 id="scrollspyHeading2">
									  상품관련 정보
									  <table>
									  	<tr>
									  		<th>주최/기획</th><td></td><th>고객문의</th><td></td>
									  	</tr>
									  	<tr>
									  		<th>공연시간</th><td></td><th>관람등급</th><td></td>
									  	</tr>
									  	<tr>
									  		<th>주연</th><td></td><th>공연장소</th><td></td>
									  	</tr>
									  	<tr>
									  		<th>예매수수료</th><td></td><th>배송료</th><td></td>
									  	</tr>
									  	<tr>
									  		<th>유효기간/이용조건</th><td colspan="3"></td>
									  	</tr>
									  	<tr>
									  		<th>예매취소조건</th><td colspan="3"></td>
									  	</tr>
									  	<tr>
									  		<th>취소환불방법</th><td colspan="3"></td>
									  	</tr>
									  	<tr>
									  		<th>배송티켓 안내</th><td colspan="3"></td>
									  	</tr>
									  	<tr>
									  		<th>모바일티켓 안내</th><td colspan="3"></td>
									  	</tr>
									  </table>
									  <h4 id="scrollspyHeading3">
									  Third headingThird headingThird heading<br>
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