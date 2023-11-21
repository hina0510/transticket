
function con_seat_form() {
	$.ajax({
		type : 'post',
		url : 'seatCheck',
		data : {arr : arr},
		dataType : 'json',
		contentType:"application/json; charset=utf-8",
		traditional: true,
		success : function(data){
			alert("추가되었습니다");
		},
		error: ()=>{alert("문제 발생")}
	});
}
