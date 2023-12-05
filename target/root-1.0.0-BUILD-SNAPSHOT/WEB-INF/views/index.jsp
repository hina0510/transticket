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
		        	<img src="resources/images/light_off.jpg" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="resources/images/light_off.jpg" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="resources/images/light_off.jpg" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="resources/images/light_off.jpg" class="d-block w-100" alt="...">
		        </div>
		        <div class="carousel-item">
		        	<img src="resources/images/light_off.jpg" class="d-block w-100" alt="...">
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
	    	<img src="resources/images/light_off.jpg">
	    	<img src="resources/images/light_off.jpg">
	    	<img src="resources/images/light_off.jpg"><br>
	    	<img src="resources/images/light_off.jpg">
	    	<img src="resources/images/light_off.jpg">
	    	<img src="resources/images/light_off.jpg"><br>
	    </div>
	    
	    <section>
	    <div style="height: 40px;"></div>
	    <div style="height: 40px;font-size: 28px;"><span>장르별 랭킹</span></div>
	   
	    <div class="slider">
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
			<div class="col-md-3">
		    	<div class="card">
					<a href="${contextPath }/reservation/concert_content">
						<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
					</a>
					<div class="card-body">
						<a href="${contextPath }/reservation/concert_content">
							<dt class="card-title">뮤지컬 레베카 1주년 기념 공연</dt>
						</a>
						<dd>블루스퀘어 신한카드홀</dd>
						<dd>2023.8.19 ~ 11.19</dd>
					</div>
				</div>
		    </div>
		</div>        
		
	    <div style="height: 40px;"></div>
	    <div style="height: 40px;font-size: 28px;"><span>추천 공연</span></div>
	    <div class="row">
	    	<div class="col-3">
				<div class="card">
					<a href="${contextPath }/reservation/concert_content">
				    	<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">뮤지컬 레베카 10주년 기념 공연</dt>
				        </a>
				        <dd>블루스퀘어 신한카드홀</dd>
				        <dd>2023.8.19 ~ 11.19</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="${contextPath }/reservation/concert_content">
				    	<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">뮤지컬 레베카 10주년 기념 공연</dt>
				        </a>
				        <dd>블루스퀘어 신한카드홀</dd>
				        <dd>2023.8.19 ~ 11.19</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="${contextPath }/reservation/concert_content">
				    	<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">뮤지컬 레베카 10주년 기념 공연</dt>
				        </a>
				        <dd>블루스퀘어 신한카드홀</dd>
				        <dd>2023.8.19 ~ 11.19</dd>
				    </div>
				</div>
			</div>
	    	<div class="col-3">
				<div class="card">
					<a href="${contextPath }/reservation/concert_content">
				    	<img src="https://tickets.interpark.com/_next/image?url=https%3A%2F%2Fticketimage.interpark.com%2FPlay%2Fimage%2Flarge%2F23%2F23008837_p.gif&w=3840&q=75" class="card-img-top" alt="card">
				    </a>
				    <div class="card-body">
				    	<a href="${contextPath }/reservation/concert_content">
				        	<dt class="card-title">뮤지컬 레베카 10주년 기념 공연</dt>
				        </a>
				        <dd>블루스퀘어 신한카드홀</dd>
				        <dd>2023.8.19 ~ 11.19</dd>
				    </div>
				</div>
			</div>
		</div>	
	</section>
	<div style="height: 30px;"></div>
	<div class="lbanner">
		<img src="resources/images/light_off.jpg">
	</div>
<%@ include file="./default/footer.jsp" %>
</body>
</html>