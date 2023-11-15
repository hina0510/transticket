$(document).ready(function(){
		  
    $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');

      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
    })
  })
function readURL(input) {
var file = input.files[0] //파일에 대한 정보
console.log(file)
if (file != '') {
   var reader = new FileReader();
   reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
   reader.onload = function (e) { // 파일 로드한 값을 표현한다
    //e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
     $('#preview').attr('src', e.target.result);
    }
}
}
function daumPost() {
  new daum.Postcode({
      oncomplete: function(data) {
          console.log(data);
          const addr1 = document.getElementById("addr1");
          const addr2 = document.getElementById("addr2");
          const addr3 = document.getElementById("addr3");
          let addr = "";
            
          if(data.userSelectedType === "R"){
              addr = data.roadAddress;
          }else {
              addr = data.jibunAddress;
          }
          addr1.value = data.zonecode;
          addr2.value = addr;
          addr3.focus();
     }
 }).open();
}