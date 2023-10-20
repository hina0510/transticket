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
	write_concert_form02
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

	<div class="container">
		<div class="container2">
			<div class="screen"></div>
		</div>
			
		<div>
			<div class="rows">
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
				<div class="row">
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
					<div class="seat2"></div>
				</div>
			</div>
		</div>
	</div>

	<p class="text">
		You have selected <span id="count">0</span> seats for a price of $<span id="total">0</span>
	</p>
</body>
</html>