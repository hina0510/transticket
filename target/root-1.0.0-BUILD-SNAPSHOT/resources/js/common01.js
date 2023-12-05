// 날짜 포맷 정규식 (yyyy-mm-dd)
const regexDate = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
// date 객체 만들기
const thisDate = new Date();
// 선택 날짜 (yyyy-mm-dd 00:00:00)
const stdate = document.getElementById('stDate').innerText;
let styear = stdate.substring(0, 4);
let stmonth = stdate.substring(5, 7);
let stday = stdate.substring(8, 10);
stday = parseInt(stday, 10);
console.log(stday);
stmonth = parseInt(stmonth, 10);
console.log(stmonth);
styear = parseInt(styear, 10);
console.log(styear);
const today = new Date(styear, stmonth-1, stday);
console.log(today);

// 종료 날짜 (yyyy-mm-dd 00:00:00)
const endate = document.getElementById('endDate').innerText;
let endyear = endate.substring(0, 4);
let endmonth = endate.substring(5, 7);
let enday = endate.substring(8, 10);
enday = parseInt(enday, 10);
console.log(enday);
endmonth = parseInt(endmonth, 10);
console.log(endmonth);
endyear = parseInt(endyear, 10);
console.log(endyear);
const today2 = new Date(endyear, endmonth-1, enday);
console.log(today2.getDate());
// 달력에서 표기하는 종료 년
let edYear = today2.getFullYear();
// 달력에서 표기하는 종료 월
let edMonth = today2.getMonth();

// 달력이동 최대 개월 수
const limitMonth = 4;
// 달력에서 표기하는 날짜 객체
let thisMonth = today;
// 달력에서 표기하는 년
let currentYear = thisMonth.getFullYear();
// 달력에서 표기하는 월
let currentMonth = thisMonth.getMonth();
// 체크인 날짜
let checkInDate = "";

$(document).ready(function () {
    // 달력 만들기
    calendarInit(thisMonth);

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        const startDate = $('.start-year-month').html().split('.');

        // 달력이 현재 년 월 보다 같거나 작을경우 뒤로가기 막기
        if (getLimitMonthCheck(parseInt(startDate[0]), parseInt(startDate[1])) <= 0) {
            return;
        }

        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        calendarInit(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        const lastDate = $('.last-year-month').html().split('.');

        // 예약 가능 최대 개월수와 같거나 크다면 다음달 이동 막기
        if (getLimitMonthCheck(parseInt(lastDate[0]), parseInt(lastDate[1])) >= limitMonth) {
            alert('최대예약 기간은 ' + limitMonth + '개월 입니다.');
            return;
        }

        let limitYear = today.getFullYear();
        if (currentMonth + limitMonth >= 12) {
            limitYear = limitYear + 1
        }

        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        calendarInit(thisMonth);
    });
});

// 달력 그리기
function calendarInit(thisMonth) {

    // 렌더링을 위한 데이터 정리
    currentYear = thisMonth.getFullYear();
    currentMonth = thisMonth.getMonth();

    // 렌더링 html 요소 생성
    let start_calendar = '';
    let last_calendar = '';

    makeStartCalendar();
    makeLastCalendar();

    // start_calendar
    function makeStartCalendar() {
        // 이전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(currentYear, currentMonth, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(currentYear, currentMonth + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            start_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            if (currentYear === today.getFullYear()) {// 선택 년도가 현재 년도가 같을경우
            	if (currentMonth === today.getMonth()) {// 선택 월이 현재 월과 같을 경우
            		if (today.getMonth() === today2.getMonth()) {// 선택 월이 종료 월과 같을 경우
		                if (i < today.getDate()) {// 지난 날짜는 disable 처리
		                    start_calendar += pervDisableDay(i);
		                } else if (i <= today2.getDate()){ // 예약기간 이후 disable 처리
		                	start_calendar += dailyDay(currentYear, currentMonth, i);
		                } else if (i > today2.getDate()){ 
		                    start_calendar += nextDisableDay(i);
		                }
	            	} 
		        }
            } else {
                last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
            }

        }

        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            start_calendar += nextDisableDay(i);
        }

        $('.start-calendar').html(start_calendar);
        // 월 표기
        $('.start-year-month').text(currentYear + '.' + zf((currentMonth + 1)));
    }

    // last_calendar
    function makeLastCalendar() {
        let tempCurrentYear = currentYear;
        let tempCurrentMonth = currentMonth + 1;

        if (tempCurrentMonth >= 12) {
            tempCurrentYear = parseInt(tempCurrentYear) + 1;
            tempCurrentMonth = 0;
        }

        // 이전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(tempCurrentYear, tempCurrentMonth, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(tempCurrentYear, tempCurrentMonth + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            last_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            // 이번달이 현재 년도와 월이 같을경우
            if (tempCurrentYear === today.getFullYear() && tempCurrentMonth === today.getMonth()) {
                // 지난 날짜는 disable 처리
                if (i < today.getDate()) {
                    last_calendar += pervDisableDay(i)
                } else {
                    last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
                }
            } else {
                last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
            }

        }
        
        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            last_calendar += nextDisableDay(i);
        }

        $('.last-calendar').html(last_calendar);
        // 월 표기
        $('.last-year-month').text(tempCurrentYear + '.' + zf((tempCurrentMonth + 1)));
    }


    // 지난달 미리 보기
    function pervDisableDay(day) {
        return '<div class="day prev disable">' + day + '</div>';
    }

    // 이번달
    function dailyDay(currentYear, currentMonth, day) {
        const date = currentYear + '' + zf((currentMonth + 1)) + '' + zf(day);

        if (checkInDate === date) {
            return '<div class="day current checkIn" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        } else {
            return '<div class="day current" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        }
    }

    // 다음달 미리 보기
    function nextDisableDay(day) {
        return '<div class="day next disable">' + day + '</div>';
    }

    addClassSelectDay();
}

// 선택 끝 기간 안에 날짜 선택 처리
function addClassSelectDay() {
    if (checkInDate !== "") {
        $('.day').each(function () {
            const data_day = $(this).data('day');
        });

        $('.checkIn').find('.check_in_out_p').html('선택');
    }
}

// 달력 날짜 클릭
function selectDay(obj) {
    if (checkInDate === "") {
        $(obj).addClass('checkIn');
        $('.checkIn').find('.check_in_out_p').html('선택');

        checkInDate = $(obj).data('day');

        $('input[name=startDate]').attr('value',getCheckIndateHtml());
        //$('#check_in_day').html(getCheckIndateHtml());

        lastCheckInDate();
    } else {
        // 선택 날짜를 한번더 클릭했을때 아무 동작 하지 않기
        if (parseInt(checkInDate) === $(obj).data('day')) {
            return;
        }

        // 선택 날짜보다 끝 날짜를 더 앞으로 찍었을경우 선택 날짜와 체크아웃 날짜를 바꿔준다
        if (parseInt(checkInDate) != $(obj).data('day')) {
            $('.checkIn').find('.check_in_out_p').html('');
            $('.day').removeClass('checkIn');
            $('input[name=startDate]').attr('value',"");
        	//$('#check_in_day').html("");

            checkInDate = $(obj).data('day');

            $(obj).addClass('checkIn');
            $('.checkIn').find('.check_in_out_p').html('선택');

            $('input[name=startDate]').attr('value',getCheckIndateHtml());
        	//$('#check_in_day').html(getCheckIndateHtml());

            addClassSelectDay();

            return;
        }
    }
}

// 선택 날짜 표기
function getCheckIndateHtml() {
    checkInDate = checkInDate.toString();
    return checkInDate.substring('0', '4') + "-" + checkInDate.substring('4', '6') + "-" + checkInDate.substring('6', '8') + " ( " + strWeekDay(weekday(checkInDate)) + " )";
}

// 날짜형태 변환
function conversion_date(YYMMDD, choice) {
    const yyyy = YYMMDD.substring(0, 4);
    const mm = YYMMDD.substring(4, 6);
    const dd = YYMMDD.substring(6, 8);

    return (choice === 1)
        ? yyyy + "-" + zf(mm) + "-" + zf(dd)
        : yyyy + "." + zf(mm) + "." + zf(dd);
}

// 몇요일인지 알려주는 함수 (숫자 형태)
function weekday(YYYYMMDD) {
    const weekday_year = YYYYMMDD.substring(0, 4);
    const weekday_menth = YYYYMMDD.substring(4, 6);
    const weekday_day = YYYYMMDD.substring(6, 9);

    return new Date(weekday_year + "-" + weekday_menth + "-" + weekday_day).getDay();
}

// 요일 리턴
function strWeekDay(weekday) {
    switch (weekday) {
        case 0: return "일"
            break;
        case 1: return "월"
            break;
        case 2: return "화"
            break;
        case 3: return "수"
            break;
        case 4: return "목"
            break;
        case 5: return "금"
            break;
        case 6: return "토"
            break;
    }
}

// 숫자 두자리로 만들기
function zf(num) {
    num = Number(num).toString();

    if (Number(num) < 10 && num.length == 1) {
        num = "0" + num;
    }

    return num;
}