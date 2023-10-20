const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row01 .seat2:not(.occupied)');
const count = document.getElementById('count');
const total = document.getElementById('total');
const movieSelect = document.getElementById('movie');

populateUI();

let ticketPrice = +movieSelect.value;

// Save selected movie index and price
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem('selectedMovieIndex', movieIndex);
  localStorage.setItem('selectedMoviePrice', moviePrice);
}

// Update total and count
function updateSelectedCount() {
  // 선택된 좌석 목록
  const selectedSeats1 = document.querySelectorAll('.row01 .seat2.selected');

  // 로컬 스토리지에 좌석 선택 상태 저장하기
  // Copy selected seats into array
  // Map through array
  // return a new array indexes

  // 모든 좌석 DOM 목록(seats)에서 선택된 좌석에 해당하는 인덱스를 가져옴
  const seatsIndex = [...selectedSeats1].map((seat2) => [...seats].indexOf(seat2));

  localStorage.setItem('selectedSeats1', JSON.stringify(seatsIndex));

  const selectedSeatsCount = selectedSeats1.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;
}

// Get data from localstorage and populate UI
function populateUI() {
  const selectedSeats1 = JSON.parse(localStorage.getItem('selectedSeats1'));

  if (selectedSeats1 !== null && selectedSeats1.length > 0) {
    seats.forEach((seat2, index) => {
      if (selectedSeats1.indexOf(index) > -1) {
        seat2.classList.add('selected');
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
  if (event.target.classList.contains('seat2') && !event.target.classList.contains('occupied')) {
    // toggle로 classList에 해당 클래스명이 있다면 제거하고 없다면 추가
    event.target.classList.toggle('selected'); // 좌석 색깔이 파란색으로 변경됨

    updateSelectedCount();
  }
});

// Initial count and total set
updateSelectedCount();

function payment(){
  // 선택된 좌석 목록
  const selectedSeats = document.querySelectorAll('.row01 .seat2.selected');
  // 모든 좌석 DOM 목록(seats)에서 선택된 좌석에 해당하는 인덱스를 가져옴
  const seatsIndex = [...selectedSeats].map((seat2) => [...seats].indexOf(seat2));

  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;
}