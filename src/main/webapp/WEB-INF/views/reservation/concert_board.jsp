<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript">
	function contentView(){
		href="concert_content"//concert_content?writeNo=${dto.writeNo }
	}
</script>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="container">
				<div class="row">
					<div class="col-4">
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
			        <div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
			        <div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
				</div>
				<div style="height: 20px;"></div>
				<div class="row">
					<div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
					<div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
			        <div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
				</div>
				<div style="height: 20px;"></div>
				<div class="row">
					<div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
					<div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
			        <div class="col-4">
						<div class="card">
				            <img src="#" class="card-img-top" alt="card">
				            <div class="card-body">
				              <h5 class="card-title">Lorem</h5>
				            </div>
						</div>
			        </div>
				</div>
				<br>
				<div>
					<button onclick="location.href='write_concert_form'">글 작성</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../default/footer.jsp" %>
</body>
</html>