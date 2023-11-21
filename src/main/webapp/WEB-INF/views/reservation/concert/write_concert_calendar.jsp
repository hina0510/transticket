<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>달력 만들기</title>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/calendar.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/calendar.js"></script>

</head>

<body>
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
</body>

</html>