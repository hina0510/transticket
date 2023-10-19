const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied');
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
  const selectedSeats = document.querySelectorAll('.row .seat.selected');

  // 로컬 스토리지에 좌석 선택 상태 저장하기
  // Copy selected seats into array
  // Map through array
  // return a new array indexes

  // 모든 좌석 DOM 목록(seats)에서 선택된 좌석에 해당하는 인덱스를 가져옴
  const seatsIndex1 = [...selectedSeats].map((seat1) => [...seats].indexOf(seat1));
  const seatsIndex2 = [...selectedSeats].map((seat2) => [...seats].indexOf(seat2));
  const seatsIndex3 = [...selectedSeats].map((seat3) => [...seats].indexOf(seat3));

  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex1));
  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex2));
  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex3));

  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;
}

// Get data from localstorage and populate UI
function populateUI() {
  const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));

  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat1, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add('selected');
      }
    });
  }
  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat2, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add('selected');
      }
    });
  }
  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat3, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add('selected');
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
  if (event.target.classList.contains('seat1') && !event.target.classList.contains('occupied')) {
    event.target.classList.toggle('selected'); // 좌석 색깔이 파란색으로 변경됨
  }else if (event.target.classList.contains('seat2') && !event.target.classList.contains('occupied')) {
    event.target.classList.toggle('selected'); 
  }else if (event.target.classList.contains('seat3') && !event.target.classList.contains('occupied')) {
    event.target.classList.toggle('selected');



    updateSelectedCount();
  }
});

// Initial count and total set
updateSelectedCount();