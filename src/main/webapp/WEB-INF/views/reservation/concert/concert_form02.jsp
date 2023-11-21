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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>	
	concert_form02
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
					<div class="seat2"></div>
					<small>N/A</small>
				</li>
				<li>
					<div class="seat2 selected"></div>
					<small>Selected</small>
				</li>
				<li>
					<div class="seat2 occupied"></div>
					<small>Occupied</small>
				</li>
			</ul>
			
			<ul class="showcase" style="padding: 15px;">
				<div class="container">
					<div class="screen"></div>
					
					<div class="rows">
						<div class="row01">
							<div class="seat2" id="A001"></div>
							<div class="seat2 occupied" id="A002"></div>
							<div class="seat2 occupied" id="A003"></div>
							<div class="seat2" id="A004"></div>
							<div class="seat2 occupied" id="A005"></div>
							<div class="seat2" id="A006"></div>
							<div class="seat2 occupied" id="A007"></div>
							<div class="seat2 occupied" id="A008"></div>
							<div class="seat2" id="A009"></div>
							<div class="seat2" id="A010"></div>
							<div class="seat2" id="A011"></div>
							<div class="seat2 occupied" id="A012"></div>
							<div class="seat2 occupied" id="A013"></div>
							<div class="seat2 occupied" id="A014"></div>
							<div class="seat2" id="A015"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied" id="B001"></div>
							<div class="seat2" id="B002"></div>
							<div class="seat2" id="B003"></div>
							<div class="seat2 occupied" id="B004"></div>
							<div class="seat2 occupied" id="B005"></div>
							<div class="seat2" id="B006"></div>
							<div class="seat2" id="B007"></div>
							<div class="seat2 occupied" id="B008"></div>
							<div class="seat2" id="B009"></div>
							<div class="seat2 occupied" id="B010"></div>
							<div class="seat2 occupied" id="B011"></div>
							<div class="seat2" id="B012"></div>
							<div class="seat2" id="B013"></div>
							<div class="seat2" id="B014"></div>
							<div class="seat2 occupied" id="B015"></div>
						</div>
						<div class="row01">
							<div class="seat2" id="C001"></div>
							<div class="seat2 occupied" id="C002"></div>
							<div class="seat2" id="C003"></div>
							<div class="seat2" id="C004"></div>
							<div class="seat2 occupied" id="C005"></div>
							<div class="seat2 occupied" id="C006"></div>
							<div class="seat2" id="C007"></div>
							<div class="seat2" id="C008"></div>
							<div class="seat2 occupied" id="C009"></div>
							<div class="seat2" id="C010"></div>
							<div class="seat2" id="C011"></div>
							<div class="seat2" id="C012"></div>
							<div class="seat2 occupied" id="C013"></div>
							<div class="seat2" id="C014"></div>
							<div class="seat2" id="C015"></div>
						</div>
						<div class="row01">
							<div class="seat2" id="D001"></div>
							<div class="seat2" id="D002"></div>
							<div class="seat2 occupied" id="D003"></div>
							<div class="seat2" id="D004"></div>
							<div class="seat2" id="D005"></div>
							<div class="seat2" id="D006"></div>
							<div class="seat2 occupied" id="D007"></div>
							<div class="seat2" id="D008"></div>
							<div class="seat2 occupied" id="D009"></div>
							<div class="seat2" id="D010"></div>
							<div class="seat2 occupied" id="D011"></div>
							<div class="seat2" id="D012"></div>
							<div class="seat2 occupied" id="D013"></div>
							<div class="seat2 occupied" id="D014"></div>
							<div class="seat2" id="D015"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied" id="E001"></div>
							<div class="seat2" id="E002"></div>
							<div class="seat2" id="E003"></div>
							<div class="seat2 occupied" id="E004"></div>
							<div class="seat2" id="E005"></div>
							<div class="seat2 occupied" id="E006"></div>
							<div class="seat2" id="E007"></div>
							<div class="seat2" id="E008"></div>
							<div class="seat2" id="E009"></div>
							<div class="seat2 occupied" id="E010"></div>
							<div class="seat2 occupied" id="E011"></div>
							<div class="seat2 occupied" id="E012"></div>
							<div class="seat2" id="E013"></div>
							<div class="seat2" id="E014"></div>
							<div class="seat2 occupied" id="E015"></div>
						</div>
						<div class="row01">
							<div class="seat2" id="F001"></div>
							<div class="seat2 occupied" id="F002"></div>
							<div class="seat2" id="F003"></div>
							<div class="seat2 occupied" id="F004"></div>
							<div class="seat2 occupied" id="F005"></div>
							<div class="seat2" id="F006"></div>
							<div class="seat2" id="F007"></div>
							<div class="seat2 occupied" id="F008"></div>
							<div class="seat2" id="F009"></div>
							<div class="seat2" id="F010"></div>
							<div class="seat2 occupied" id="F011"></div>
							<div class="seat2 occupied" id="F012"></div>
							<div class="seat2" id="F013"></div>
							<div class="seat2 occupied" id="F014"></div>
							<div class="seat2" id="F015"></div>
						</div>
						<div class="row01">
							<div class="seat2" id="G001"></div>
							<div class="seat2 occupied" id="G002"></div>
							<div class="seat2" id="G003"></div>
							<div class="seat2" id="G004"></div>
							<div class="seat2 occupied" id="G005"></div>
							<div class="seat2 occupied" id="G006"></div>
							<div class="seat2" id="G007"></div>
							<div class="seat2" id="G008"></div>
							<div class="seat2 occupied" id="G009"></div>
							<div class="seat2" id="G010"></div>
							<div class="seat2" id="G011"></div>
							<div class="seat2" id="G012"></div>
							<div class="seat2 occupied" id="G013"></div>
							<div class="seat2" id="G014"></div>
							<div class="seat2" id="G015"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied" id="H001"></div>
							<div class="seat2" id="H002"></div>
							<div class="seat2" id="H003"></div>
							<div class="seat2 occupied" id="H004"></div>
							<div class="seat2 occupied" id="H005"></div>
							<div class="seat2" id="H006"></div>
							<div class="seat2" id="H007"></div>
							<div class="seat2 occupied" id="H008"></div>
							<div class="seat2" id="H009"></div>
							<div class="seat2 occupied" id="H010"></div>
							<div class="seat2 occupied" id="H011"></div>
							<div class="seat2" id="H012"></div>
							<div class="seat2" id="H013"></div>
							<div class="seat2" id="H014"></div>
							<div class="seat2 occupied" id="H015"></div>
						</div>
						<div class="row01">
							<div class="seat2" id="I001"></div>
							<div class="seat2" id="I002"></div>
							<div class="seat2 occupied" id="I003"></div>
							<div class="seat2" id="I004"></div>
							<div class="seat2" id="I005"></div>
							<div class="seat2" id="I006"></div>
							<div class="seat2 occupied" id="I007"></div>
							<div class="seat2" id="I008"></div>
							<div class="seat2 occupied" id="I009"></div>
							<div class="seat2" id="I010"></div>
							<div class="seat2 occupied" id="I011"></div>
							<div class="seat2" id="I012"></div>
							<div class="seat2 occupied" id="I013"></div>
							<div class="seat2 occupied" id="I014"></div>
							<div class="seat2" id="I015"></div>
						</div>
						<div class="row01">
							<div class="seat2 occupied" id="J001"></div>
							<div class="seat2" id="J002"></div>
							<div class="seat2" id="J003"></div>
							<div class="seat2 occupied" id="J004"></div>
							<div class="seat2" id="J005"></div>
							<div class="seat2 occupied" id="J006"></div>
							<div class="seat2" id="J007"></div>
							<div class="seat2" id="J008"></div>
							<div class="seat2" id="J009"></div>
							<div class="seat2 occupied" id="J010"></div>
							<div class="seat2 occupied" id="J011"></div>
							<div class="seat2 occupied" id="J012"></div>
							<div class="seat2" id="J013"></div>
							<div class="seat2" id="J014"></div>
							<div class="seat2 occupied" id="J015"></div>
						</div>
					</div>
				</div>
			</ul>
			<div class="showcase">
					<form action="cSeatCheck" method="post" enctype="multipart/form-data">
						콘서트 명 : <input type="text" readonly name="con_title" value="${dto.title}"><br>
						콘서트 날짜 : <input type="text" readonly name="startDate" value="${dto.con_stDate}"><br>
						콘서트 장소 : <input type="text" readonly name="con_place" value="${dto.con_place}"><br>
						티켓 수 : <input type="text" id="count" name="count" readonly value=""><br>
						가격 : <input type="text" id="total" name="price" readonly value=""><br>
						선택 좌석 : <input type="text" id="seatList" name="seatList" readonly value=""><br>
						구매자 : <input type="text" name="con_buyer" readonly value="${glogin }"><br>
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
	<script src="<%=request.getContextPath() %>/resources/js/script02.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>