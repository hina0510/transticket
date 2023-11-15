<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie Seat Booking</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/formstyle01.css">
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	musical_form01
	<div class="con01">
		<div class="con02">
			<div class="movie-container">
				<label for="movie">카테고리: </label>
				<select id="movie">
					<option value="10">Avengers: Endgame ($10)</option>
					<option value="12">Joker ($12)</option>
					<option value="8">Toy Story 4 ($8)</option>
					<option value="9">The Lion King ($9)</option>
				</select>
			</div>
		
			<ul class="showcase">
				<li>
					<div class="seat"></div>
					<small>N/A</small>
				</li>
				<li>
					<div class="seat selected"></div>
					<small>Selected</small>
				</li>
				<li>
					<div class="seat occupied"></div>
					<small>Occupied</small>
				</li>
			</ul>
			<ul class="showcase" style="padding: 15px;">
				<div class="container">
					<div class="screen"></div>
			
					<div class="rows">
						<div class="row01">
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
						</div>
						<div class="row01">
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
							<div class="seat occupied"></div>
							<div class="seat occupied"></div>
							<div class="seat"></div>
						</div>
					</div>
				</div>
			</ul>
			<p class="text">
				You have selected <span id="count">0</span> seats for a price of $<span id="total">0</span>
			</p>
			<div class="frame">
				<button class="custom-btn btn-3" onclick="payment()" style="float: right; "><span>결제</span></button>
			</div>
			<br>
			<br>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/script01.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>