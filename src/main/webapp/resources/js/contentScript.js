$(document).ready(function(){
	  
    $('ul.tabs3 li').click(function(){
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs3 li').removeClass('current');
      $('.tab-content3').removeClass('current');

      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
    })
  })