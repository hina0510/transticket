<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie Seat Booking</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/formstyle02.css">
</head>
<body>
<%@ include file="../default/header.jsp" %>	
	concert_form02
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
					<div class="seat1 selected"></div>
					<small>Selected</small>
				</li>
				<li>
					<div class="seat1 occupied"></div>
					<small>Occupied</small>
				</li>
			</ul>
		
			<div class="container">
				<div class="container2">
					<nav>
						<div class="rows">
							<div style="height: 30px;">
							</div>
							<div class="row01">
								<div class="seat1"></div>
								<div class="seat1"></div>
							</div>
							<div class="row01">
								<div class="seat1"></div>
								<div class="seat1 occupied"></div>
							</div>
							<div class="row01">
								<div class="seat1 occupied"></div>
								<div class="seat1"></div>
							</div>
						</div>
					</nav>
					<section>
						<div class="screen"></div>
					</section>
					<aside>
						<div class="rows">
							<div style="height: 30px;">
							</div>
							<div class="row01">
								<div class="seat3 occupied"></div>
								<div class="seat3"></div>
							</div>
							<div class="row01">
								<div class="seat3"></div>
								<div class="seat3"></div>
							</div>
							<div class="row01">
								<div class="seat3"></div>
								<div class="seat3 occupied"></div>
							</div>
						</div>
					</aside>
				</div>
					
				<div>
					<div class="rows">
						<div class="row01">
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
						</div>
						<div class="row01">
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
						</div>
						<div class="row01">
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
						</div>
						<div class="row01">
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
							<div class="seat2 occupied"></div>
							<div class="seat2"></div>
						</div>
					</div>
				</div>
			</div>
		
			<p class="text">
				You have selected <span id="count">0</span> seats for a price of $<span id="total">0</span>
			</p>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/script02.js"></script>
<%@ include file="../default/footer.jsp" %>
</body>
</html>