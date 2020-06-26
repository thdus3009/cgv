



//#discCoupon .tpm_body - 할인 쿠폰
$("#discCoupon .tpm_header").click(function(){
	if($("#discCoupon .tpm_body").css("display") == 'none'){
		$("#discCoupon .tpm_body").css("display","block");
		$("#payPoints .tpm_body").css("display","none");
	}else{
		$("#discCoupon .tpm_body").css("display","none");
	}
});




//#payPoints .tpm_body - 포인트 
$("#payPoints .tpm_header").click(function(){
	if($("#payPoints .tpm_body").css("display") == 'none'){
		$("#payPoints .tpm_body").css("display","block");
		$("#discCoupon .tpm_body").css("display","none");
	}else{
		$("#payPoints .tpm_body").css("display","none");
	}
});


//info payment-ticket - 아래 바의 결제 부분 감추기
$(".info.payment-ticket").css("display","none");


//summary_total_amount - 결제 총액
var totalPrice = $(".payment-ticket .payment-final .data .price").attr("title");
console.log(totalPrice);
$("#summary_total_amount").text(addComma(totalPrice));


//summary_discount_total - 할인 금액
$("#summary_discount_total").text(0);


//summary_payment_total  - 남은 결제금액
$("#summary_payment_total").text(addComma(totalPrice-$("#summary_discount_total").text()));



//간편 결제 클릭시 아래 수단 추가
//last_pay_radio3
$("#lastPayCon span input").click(function(){
	if($(this).prop("checked") == true && $(this).val() == 3){
		$("#smartPayCon").css("display","block");
	}else{
		$("#smartPayCon").css("display","none");
	}
});




//이니스트 결제

function payment(){
	
	var IMP = window.IMP; // 생략가능
    IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    
    IMP.request_pay({
        pg : 'inicis', // version 1.1.0부터 지원.
        pay_method : 'card',
        merchant_uid : 'cgv_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : 100,
        buyer_email : 'iamport@siot.do',
        buyer_name : 'tm',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456',
        m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
    });
	
}
	











