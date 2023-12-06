<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/indexstyle.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script>
	$( document ).ready( function() {
		$( '.slider' ).slick( {
          autoplay: true,
          autoplaySpeed: 2000,
          slidesToShow: 5,
          slidesToScroll: 1,
          prevArrow : "<button type='button' class='slick-prev'><img src='resources/images/icons8-back-30.png' style='width:30px;height:30px;'></button>",		// 이전 화살표 모양 설정
		  nextArrow : "<button type='button' class='slick-next'><img src='resources/images/icons8-forward-30.png' style='width:30px;height:30px;'></button>",		// 다음 화살표 모양 설정
		} );
	} );
</script>
</head>
<body>
<%@ include file="./default/header.jsp" %>
	
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
		        <div class="carousel-item active">
		        	<img src="http://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2311/231117090821_23016747.gif" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="http://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2312/231204092630_23017036.gif" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="http://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2310/231004050026_23013512.gif" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="http://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2311/231115045426_23013472.gif" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="http://ticketimage.interpark.com/TCMS3.0/NMain/BbannerPC/2311/231117092951_23016221.gif" class="d-block w-100" alt="...">
		        </div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	    
	    <div style="height: 30px;"></div>
	    <div class="sbanner">
	    	<img src="resources/images/KakaoTalk_20231205_152230177_01.jpg">
	    	<img src="resources/images/KakaoTalk_20231205_152230177_02.jpg">
	    	<img src="resources/images/KakaoTalk_20231205_152230177_03.jpg"><br>
	    	<img src="resources/images/KakaoTalk_20231205_152230177_04.jpg">
	    	<img src="resources/images/KakaoTalk_20231205_152230177_05.jpg">
	    	<img src="resources/images/KakaoTalk_20231205_152230177.jpg"><br>
	    </div>
	    
	    <section>
	    <div style="height: 40px;"></div>
	    <div style="height: 40px;font-size: 28px;"><span>추천 공연</span></div>
	   
	    <div class="slider">
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content?writeNo=36">
						<img src="resources/images/에일리 메인2.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">에일리콘서트</dt>
						</a>
						<dd>잠실주경기장</dd>
						<dd>2023.12.19 ~ 12.23</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content?writeNo=23">
						<img src="resources/images/다니엘 시저 메인.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content?writeNo=23">
							<dt class="card-title">다니엘 시저</dt>
						</a>
						<dd>장충체육관</dd>
						<dd>2023.12.30 ~ 12.31</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content?writeNo=39">
						<img src="resources/images/임영웅 메인2.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content?writeNo=39">
							<dt class="card-title">임영웅 콘서트</dt>
						</a>
						<dd>경희대학교 평화의전당</dd>
						<dd>2023.12.24 ~ 12.25</dd>
					</div>
				</div>
		    </div>
			
		    <div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/musical_content?writeNo=24">
						<img src="resources/images/드라큐라 메인.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/musical_content?writeNo=24">
							<dt class="card-title">뮤지컬 드라큐라</dt>
						</a>
						<dd>청담아트홀</dd>
						<dd>2023.12.04 ~ 12.25</dd>
					</div>
				</div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/musical_content?writeNo=34">
						<img src="resources/images/벤허 메인.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/musical_content?writeNo=34">
							<dt class="card-title">벤허</dt>
						</a>
						<dd>삼성 블루스퀘어</dd>
						<dd>2023.12.01 ~ 12.31</dd>
					</div>
				</div>
		    </div>
		    <div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/musical_content?writeNo=37">
						<img src="resources/images/셜록홈즈 메인.gif" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/musical_content?writeNo=37">
							<dt class="card-title">셜록홈즈</dt>
						</a>
						<dd>코엑스 신한카드아트리움</dd>
						<dd>2023.12.01 ~ 12.25</dd>
					</div>
				</div>
		    </div>
		</div>        
		
	    <div style="height: 40px;"></div>
	    <div style="height: 40px;font-size: 28px;"><span>추천 전시</span></div>
	    <div class="row">
	    	<div class="col-3">
				<div class="card">
					<a href="">
				    	<img src="resources/images/럭스 메인.gif" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">럭스</dt>
				        </a>
				        <dd>DDP 뮤지엄 전시관</dd>
				        <dd>2023.11.19 ~ 12.31</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="">
				    	<img src="resources/images/일리야 밀스타인 메인.jpg" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">일리야 밀스타인</dt>
				        </a>
				        <dd>마이 아트 뮤지엄</dd>
				        <dd>2023.11.19 ~ 2024.01.19</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="">
				    	<img src="resources/images/이경준 사진전 메인.gif" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">이경준 사진전 메인</dt>
				        </a>
				        <dd>그라운드 시소 센트럴</dd>
				        <dd>2023.8.19 ~ 12.19</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="">
				    	<img src="resources/images/2023 AGF 메인.gif" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">2023 AGF</dt>
				        </a>
				        <dd>일산 킨텍스</dd>
				        <dd>2023.12.03 ~ 12.05</dd>
				    </div>
				</div>
			</div>
		</div>	
	</section>
	<div style="height: 30px;"></div>
	<div class="lbanner">
		<img src="resources/images/KakaoTalk_20231205_152230177_06.jpg">
	</div>
<%@ include file="./default/footer.jsp" %>
</body>
</html>