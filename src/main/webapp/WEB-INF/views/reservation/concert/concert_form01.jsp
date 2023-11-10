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
								<div class="seat occupied" id="A001"></div>
								<div class="seat" id="A002"></div>
								<div class="seat" id="A003"></div>
								<div class="seat occupied" id="A004"></div>
								<div class="seat" id="A005"></div>
								<div class="seat occupied" id="A006"></div>
								<div class="seat occupied" id="A007"></div>
								<div class="seat" id="A008"></div>
								<div class="seat" id="A009"></div>
								<div class="seat" id="A010"></div>
								<div class="seat occupied" id="A011"></div>
								<div class="seat" id="A012"></div>
								<div class="seat occupied" id="A013"></div>
								<div class="seat" id="A014"></div>
								<div class="seat" id="A015"></div>
								<div class="seat occupied" id="A016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="B001"></div>
								<div class="seat occupied" id="B002"></div>
								<div class="seat" id="B003"></div>
								<div class="seat" id="B004"></div>
								<div class="seat occupied" id="B005"></div>
								<div class="seat" id="B006"></div>
								<div class="seat" id="B007"></div>
								<div class="seat occupied" id="B008"></div>
								<div class="seat" id="B009"></div>
								<div class="seat" id="B010"></div>
								<div class="seat" id="B011"></div>
								<div class="seat occupied" id="B012"></div>
								<div class="seat" id="B013"></div>
								<div class="seat occupied" id="B014"></div>
								<div class="seat occupied" id="B015"></div>
								<div class="seat" id="B016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="C001"></div>
								<div class="seat" id="C002"></div>
								<div class="seat occupied" id="C003"></div>
								<div class="seat occupied" id="C004"></div>
								<div class="seat" id="C005"></div>
								<div class="seat" id="C006"></div>
								<div class="seat occupied" id="C007"></div>
								<div class="seat" id="C008"></div>
								<div class="seat occupied" id="C009"></div>
								<div class="seat occupied" id="C010"></div>
								<div class="seat" id="C011"></div>
								<div class="seat occupied" id="C012"></div>
								<div class="seat" id="C013"></div>
								<div class="seat" id="C014"></div>
								<div class="seat occupied" id="C015"></div>
								<div class="seat" id="C016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="D001"></div>
								<div class="seat" id="D002"></div>
								<div class="seat" id="D003"></div>
								<div class="seat occupied" id="D004"></div>
								<div class="seat" id="D005"></div>
								<div class="seat occupied" id="D006"></div>
								<div class="seat occupied" id="D007"></div>
								<div class="seat" id="D008"></div>
								<div class="seat" id="D009"></div>
								<div class="seat" id="D010"></div>
								<div class="seat occupied" id="D011"></div>
								<div class="seat" id="D012"></div>
								<div class="seat occupied" id="D013"></div>
								<div class="seat occupied" id="D014"></div>
								<div class="seat" id="D015"></div>
								<div class="seat" id="D016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="E001"></div>
								<div class="seat occupied" id="E002"></div>
								<div class="seat" id="E003"></div>
								<div class="seat" id="E004"></div>
								<div class="seat occupied" id="E005"></div>
								<div class="seat" id="E006"></div>
								<div class="seat" id="E007"></div>
								<div class="seat occupied" id="E008"></div>
								<div class="seat occupied" id="E009"></div>
								<div class="seat" id="E010"></div>
								<div class="seat occupied" id="E011"></div>
								<div class="seat" id="E012"></div>
								<div class="seat" id="E013"></div>
								<div class="seat" id="E014"></div>
								<div class="seat occupied" id="E015"></div>
								<div class="seat occupied" id="E016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="F001"></div>
								<div class="seat" id="F002"></div>
								<div class="seat occupied" id="F003"></div>
								<div class="seat" id="F004"></div>
								<div class="seat" id="F005"></div>
								<div class="seat occupied" id="F006"></div>
								<div class="seat occupied" id="F007"></div>
								<div class="seat" id="F008"></div>
								<div class="seat occupied" id="F009"></div>
								<div class="seat occupied" id="F010"></div>
								<div class="seat" id="F011"></div>
								<div class="seat occupied" id="F012"></div>
								<div class="seat" id="F013"></div>
								<div class="seat occupied" id="F014"></div>
								<div class="seat" id="F015"></div>
								<div class="seat" id="F016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="G001"></div>
								<div class="seat occupied" id="G002"></div>
								<div class="seat" id="G003"></div>
								<div class="seat" id="G004"></div>
								<div class="seat occupied" id="G005"></div>
								<div class="seat" id="G006"></div>
								<div class="seat" id="G007"></div>
								<div class="seat occupied" id="G008"></div>
								<div class="seat" id="G009"></div>
								<div class="seat occupied" id="G010"></div>
								<div class="seat" id="G011"></div>
								<div class="seat" id="G012"></div>
								<div class="seat" id="G013"></div>
								<div class="seat occupied" id="G014"></div>
								<div class="seat occupied" id="G015"></div>
								<div class="seat" id="G016"></div>
							</div>
							<div class="row01">
								<div class="seat occupied" id="H001"></div>
								<div class="seat" id="H002"></div>
								<div class="seat" id="H003"></div>
								<div class="seat occupied" id="H004"></div>
								<div class="seat" id="H005"></div>
								<div class="seat occupied" id="H006"></div>
								<div class="seat occupied" id="H007"></div>
								<div class="seat" id="H008"></div>
								<div class="seat" id="H009"></div>
								<div class="seat" id="H010"></div>
								<div class="seat occupied" id="H011"></div>
								<div class="seat" id="H012"></div>
								<div class="seat occupied" id="H013"></div>
								<div class="seat" id="H014"></div>
								<div class="seat" id="H015"></div>
								<div class="seat occupied" id="H016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="I001"></div>
								<div class="seat" id="I002"></div>
								<div class="seat occupied" id="I003"></div>
								<div class="seat" id="I004"></div>
								<div class="seat" id="I005"></div>
								<div class="seat" id="I006"></div>
								<div class="seat" id="I007"></div>
								<div class="seat" id="I008"></div>
								<div class="seat occupied" id="I009"></div>
								<div class="seat" id="I010"></div>
								<div class="seat" id="I011"></div>
								<div class="seat" id="I012"></div>
								<div class="seat occupied" id="I013"></div>
								<div class="seat" id="I014"></div>
								<div class="seat occupied" id="I015"></div>
								<div class="seat" id="I016"></div>
							</div>
							<div class="row01">
								<div class="seat" id="J001"></div>
								<div class="seat occupied" id="J002"></div>
								<div class="seat" id="J003"></div>
								<div class="seat" id="J004"></div>
								<div class="seat occupied" id="J005"></div>
								<div class="seat" id="J006"></div>
								<div class="seat" id="J007"></div>
								<div class="seat occupied" id="J008"></div>
								<div class="seat" id="J009"></div>
								<div class="seat" id="J010"></div>
								<div class="seat" id="J011"></div>
								<div class="seat occupied" id="J012"></div>
								<div class="seat" id="J013"></div>
								<div class="seat occupied" id="J014"></div>
								<div class="seat occupied" id="J015"></div>
								<div class="seat" id="J016"></div>
							</div>
						</div>
					</div>
				</ul>
				<div class="showcase">
					<form action="cSeatCheck" method="post" enctype="multipart/form-data">
						콘서트 명 : <input type="text" readonly name="title" value="${dto.title}"><br>
						콘서트 날짜 : <input type="text" readonly name="startDate" value="${dto.con_stDate}"><br>
						콘서트 장소 : <input type="text" readonly name="con_place" value="${dto.con_place}"><br>
						티켓 수 : <input type="text" id="count" name="count" readonly value=""><br>
						가격 : <input type="text" id="total" name="price" readonly value=""><br>
						선택 좌석 : <input type="text" id="seatList" name="seatList" readonly value=""><br>
						<button class="custom-btn btn-3" type="submit" style="float: right;" id="payment"><span>결제</span></button>
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