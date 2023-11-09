const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row01 .seat3:not(.occupied)');
const count = document.getElementById('count');
const total = document.getElementById('total');
const movieSelect = document.getElementById('movie');

populateUI();

let ticketPrice = +movieSelect.value;

// 옵션에 제목과 가격 지정
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem('selectedMovieIndex', movieIndex);
  localStorage.setItem('selectedMoviePrice', moviePrice);
}

// 선택좌석 갯수와 가격 반환
var arr=[];
function updateSelectedCount() {
  // 선택된 좌석 목록 selectedSeats1는 list로 반환
  const selectedSeats1 = document.querySelectorAll('.row01 .seat3.selected');
  
  //선택 좌석 id값 출력
  arr=[];
  for (var i=0; i<selectedSeats1.length; i++){
  	//console.log("selectedSeats1[i] : ",selectedSeats1[i]);
  	var item = $(selectedSeats1[i]).attr('id');
  	console.log("item : ",item);
  	arr.push(item);
  }
  console.log("arr : ",arr);
  // 모든 좌석 DOM 목록(seats)에서 선택된 좌석에 해당하는 인덱스를 가져옴, 구매 가능한 좌석 리스트 중 위치정보
  const seatsIndex = [...selectedSeats1].map((seat3) => [...seats].indexOf(seat3));
  localStorage.setItem('selectedSeats1', JSON.stringify(seatsIndex));
  const selectedSeatsCount = selectedSeats1.length;
  
  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;
}

// Get data from localstorage and populate UI
function populateUI() {
  const selectedSeats1 = JSON.parse(localStorage.getItem('selectedSeats1'));

  if (selectedSeats1 !== null && selectedSeats1.length > 0) {
    seats.forEach((seat3, index) => {
      if (selectedSeats1.indexOf(index) > -1) {
        seat3.classList.add('selected');
      }
    });
  }

  const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');

  if (selectedMovieIndex !== null) {
    movieSelect.selectedIndex = selectedMovieIndex;
  }
}

// Movie select event
movieSelect.addEventListener('change', (event) => {
  ticketPrice = +event.target.value;

  setMovieData(event.target.selectedIndex, event.target.value);
  updateSelectedCount();
});

// Seat click event
container.addEventListener('click', (event) => {
  // classList로 해당 DOM이 가진 class 목록을 확인할 수 있음
  if (event.target.classList.contains('seat3') && !event.target.classList.contains('occupied')) {
    // toggle로 classList에 해당 클래스명이 있다면 제거하고 없다면 추가
    event.target.classList.toggle('selected'); // 좌석 색깔이 파란색으로 변경됨

    updateSelectedCount();
  }
});

// Initial count and total set
updateSelectedCount();