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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

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
			<div id="stDate">${dto.con_stDate}</div>
			<div id="endDate">${dto.con_endDate}</div>
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
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A003"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A005"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A006"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A010"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A012"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A013"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A014"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_A015"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_A016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B001"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B004"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B006"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B007"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B011"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B013"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_B015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_B016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C002"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C003"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C006"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C008"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C009"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C011"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C013"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_C015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_C016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D003"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D005"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D006"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D010"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D012"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D013"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_D014"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_D016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E001"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E004"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E006"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E007"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E008"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E010"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E013"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_E014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E015"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_E016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F002"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F005"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F006"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F008"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F009"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F011"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F013"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_F014"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_F016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G001"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G004"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G006"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G007"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G009"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G013"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_G015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_G016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H003"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H005"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H006"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H010"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H012"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H013"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H014"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_H015"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_H016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I001"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I002"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_I003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I004"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I006"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I007"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I008"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_I009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I011"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I012"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_I013"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_I015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_I016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J001"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J002"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J003"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J004"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J005"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J006"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J007"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J008"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J009"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J010"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J011"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J012"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J013"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J014"></div>
								<div class="seat occupied" id="${dto.title}_${dto.con_stDate}_J015"></div>
								<div class="seat" id="${dto.title}_${dto.con_stDate}_J016"></div>
							</div>
						</div>
					</div>
				</ul>
				<div class="showcase">
					<form action="seatCheck" method="post">
						seat : <input type="text" id="count" readonly><br>
						price : <input type="text" id="total" readonly><br>
						seatList : <input type="text" id="seatList" readonly><br>
						startDate : <input type="text" id="startDate" readonly><br>
						endDate : <input type="text" id="endDate" readonly><br>
						<button class="custom-btn btn-3" type="submit" style="float: right; "><span>결제</span></button>
					</form>
				</div>
				<br>
				<br>
			</div>
		</div>
		<div class="divCal">
			<div class="con03">
				<div class="calendar-wrap">
				    <div class="calendar-middle-wrap">
				      <div class="cal_nav">
				        <a href="javascript:;" class="nav-btn go-prev"></a>
				        <span class="year-month start-year-month"></span>
				        <a href="javascript:;" class="nav-btn go-next"></a>
				      </div>
				      <div class="cal_wrap">
				        <div class="days">
				          <div class="day">일</div>
				          <div class="day">월</div>
				          <div class="day">화</div>
				          <div class="day">수</div>
				          <div class="day">목</div>
				          <div class="day">금</div>
				          <div class="day">토</div>
				        </div>
				        <div class="dates start-calendar"></div>
				      </div>
				    </div>
				
				    <div class="calendar-middle-wrap" style="display:none">
				      <div class="cal_nav">
				        <a href="javascript:;" class="nav-btn go-prev"></a>
				        <span class="year-month last-year-month"></span>
				        <a href="javascript:;" class="nav-btn go-next"></a>
				      </div>
				      <div class="cal_wrap">
				        <div class="days">
				          <div class="day">일</div>
				          <div class="day">월</div>
				          <div class="day">화</div>
				          <div class="day">수</div>
				          <div class="day">목</div>
				          <div class="day">금</div>
				          <div class="day">토</div>
				        </div>
				        <div class="dates last-calendar"></div>
				      </div>
				    </div>
				
				    <div class="checkInOutInfo">
				      <div>
				        <p>
				          <span>시작</span>
				          <label id="check_in_day"></label>
				        </p>
				        <p class="space">~</p>
				        <p>
				          <span>끝</span>
				          <label id="check_out_day"></label>
				        </p>
				      </div>
				    </div>
				  </div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/script01.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>