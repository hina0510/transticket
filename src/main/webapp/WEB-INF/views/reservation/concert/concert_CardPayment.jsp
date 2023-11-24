<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
function requestPay() {
	var IMP = window.IMP; 	
	IMP.init("imp00574368"); 
  //IMP.request_pay(param, callback) 결제창 호출
   IMP.request_pay({ // param
      pg: "kcp", //결제대행사 설정에 따라 다르며 공식문서 참고
      pay_method: "card", //결제방법 설정에 따라 다르며 공식문서 참고
      merchant_uid : 'merchant_' + new Date().getTime(),  //주문(db에서 불러옴) 고유번호
      name: '${title}',
      amount:"${price }",
      buyer_email: "",
      buyer_name: "${buyer }",
      
  }, function(res) {

      // 결제검증
      $.ajax({
          type : "POST",
          url : "/root/verifyIamport/"+ res.imp_uid
      }).done(function(data) {

          if(res.paid_amount == data.response.amount){
              alert("결제 및 결제검증완료");
              location.replace('concert_CardBuySeat?title=${title}&&buyer=${buyer}');
              //결제 성공 시 비즈니스 로직

          } else {
              alert("결제 실패");
          }
      });
  });
}
</script>
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>결제정보 확인</strong>
		        </div>
				<div class="board_view_info">
					<button onclick="requestPay()">카드결제하기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../default/footer.jsp" %>
</body>
</html>