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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.number.min.js"></script>
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
					콘서트 명 : <input type="text" readonly name="ex_title" value="${dto.title}"><br>
					콘서트 날짜 : <input type="text" readonly name="startDate" value="${dto.ex_stDate}"><br>
					콘서트 장소 : <input type="text" readonly name="ex_place" value="${dto.ex_place}"><br>
					티켓 수 : <input type="text" name="count" class="count" value="0" maxLength="2" data-limit="10" onkeyup="setNumeric(this);autoCal();" /><br>
					가격 : <input type="text" name="price" id="price" value="0" readonly /><br>
					구매자 : <input type="text" name="ex_buyer" readonly value="${glogin }"><br>
					<input class="custom-btn btn-3" type="submit" style="float: right;" name="button" value="카드결제">
					<input class="custom-btn btn-3" type="submit" style="float: right;" name="button" value="무통장결제">
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
	<script type="text/javascript">
        /* 숫자타입 셋팅 */
        function setNumeric(num){
            var numeric = Number($.number(num.value));
            var maxNum = Number(num.dataset.limit);
            console.log(numeric);
            if(numeric > maxNum){
                alert('최대 점수를 초과하였습니다.');
                numeric = 0;
            }
            num.value = numeric;
        }

        /*총점 자동계산*/
        function autoCal(){
            var total = 0;
            $('.count').each(function(){
                total += Number($(this).val());
            });
            total *= ${dto.price};
            $('input[name="price"]').val(total);
        }
        </script>
	
<%@ include file="../../default/footer.jsp" %>
</body>
</html>