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
	concert_form01
	<div class="con01">
		<div class="con02">
			<div class="divSeat">
			<div class="movie-container" style="display:none">
				<select id="movie">
					<option value="${dto.price}">${dto.title}</option>
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
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A003"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A005"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A006"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A010"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A012"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A013"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A014"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+A015"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+A016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B001"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B004"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B006"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B007"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B011"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B013"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+B015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+B016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C002"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C003"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C006"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C008"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C009"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C011"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C013"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+C015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+C016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D003"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D005"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D006"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D010"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D012"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D013"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+D014"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+D016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E001"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E004"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E006"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E007"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E008"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E010"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E013"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+E014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E015"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+E016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F002"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F005"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F006"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F008"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F009"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F011"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F013"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+F014"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+F016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G001"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G004"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G006"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G007"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G009"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G013"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+G015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+G016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H003"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H005"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H006"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H010"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H012"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H013"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H014"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+H015"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+H016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I001"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I002"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+I003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I004"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I006"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I007"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I008"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+I009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I011"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I012"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+I013"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+I015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+I016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J001"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J002"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J003"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J004"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J005"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J006"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J007"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J008"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J009"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J010"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J011"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J012"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J013"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J014"></div>
								<div class="seat occupied" id="${dto.title}+${dto.con_stDate}+J015"></div>
								<div class="seat" id="${dto.title}+${dto.con_stDate}+J016"></div>
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
		<div class="divCal">
			<div class="con03">
				<%@ include file="concert_calendar.jsp" %>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/script01.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>