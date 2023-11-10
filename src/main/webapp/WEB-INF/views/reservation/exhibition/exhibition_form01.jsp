<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie Seat Booking</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/eformstyle01.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	function count() {
		const count = document.getElementById('count');
		const price = document.getElementById('price');
		
		var ticket = count.value;
		price.value = ticket*${dto.price};
	}
	count();
});
</script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	exhibition_form01
	<div class="con01">
		<div class="con02">
			<div class="divSeat">
			<div class="movie-container" style="display:none">
				<select id="movie">
					<option value="${dto.price}">${dto.title}</option>
				</select>
			</div>
			<div id="stDate">${dto.ex_stDate}</div>
			<div id="endDate">${dto.ex_endDate}</div>
			<div class="showcase">
				<form action="eSeatCheck" method="post" enctype="multipart/form-data">
					콘서트 명 : <input type="text" readonly name="title" value="${dto.title}"><br>
					콘서트 날짜 : <input type="text" readonly name="startDate" value="${dto.ex_stDate}"><br>
					콘서트 장소 : <input type="text" readonly name="ex_place" value="${dto.ex_place}"><br>
					티켓 수 : <input type="number" name="count" id="count"><br>
					가격 : <input type="number" name="price" id="price" readonly value=""><br><!-- 갯수 가격 가져오기 수정 -->
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
	<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>