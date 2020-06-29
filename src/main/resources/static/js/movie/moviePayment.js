
//discCoupon : 할인쿠폰
//payPoints : 포인트 


//포인트에서 선택한  li값의 명칭 (default)
var selected_li = "CJ ONE 포인트";
var total_discount = 0;
var lastPrice = 0;

var hasPoint = 0;
var usePoint = 0;
var chaPoint = 0;

//info payment-ticket - 아래 바의 결제 부분 감추기
$(".info.payment-ticket").css("display","none");


//summary_total_amount - 결제 총액
var totalPrice = $(".payment-ticket .payment-final .data .price").attr("title");
console.log(totalPrice);
$("#summary_total_amount").text(addComma(totalPrice));


//summary_discount_total - 할인 금액
$("#summary_discount_total").text(0);


//summary_payment_total  - 남은 결제금액
lastPrice = totalPrice-$("#summary_discount_total").text();
$("#summary_payment_total").text(addComma(lastPrice));
$("#summary_payment_list .num").text(addComma(lastPrice));



//#discCoupon .tpm_body - 할인 쿠폰
$("#discCoupon .tpm_header").click(function(){
	discount_select("#discCoupon ","#payPoints ");
});


//#payPoints .tpm_body - 포인트 
$("#payPoints .tpm_header").click(function(){
	discount_select("#payPoints ","#discCoupon ");
	discount_point_ajax();
});

//할인 수단 방법 선택
function discount_select(selected,other){
	if($(selected +".tpm_body").css("display") == 'none'){
		$(selected +".tpm_body").css("display","block");
		$(other+".tpm_body").css("display","none");
		
	}else{
		$(selected+" .tpm_body").css("display","none");
	}
}

//할인 수단 선택시 ajax으로 해당 값들을 읽어옴
function discount_point_ajax(){
	alert("ajax")
	var memberNum = $("#memberId").val();
	
	$.ajax({
		url : '../point/pointSelectList',
		type : 'get',
		data : {
			memberNum : memberNum
		},
		success : function(result){
			for(i=0;i<result.length;i++){
				var type = result[i].type;
				var price = result[i].price;
				
				switch (type) {
				case 'cjone':
					$("#cjOnePoint .hasPoint").text(addComma(price));
					break;
				case 'cgvgift':
					$("#cgvGiftPrePay .hasPoint").text(addComma(price));
					break;			
				}
			}
		}
	});
}


//사용금액창(input)클릭시 내용지움
$(".textBox2.type-n.nohan").click(function(){
	$(this).val("");
});


//포인트 사용 금액 적용
$(".textBox2.type-n.nohan").blur(function(){
	//보유 금액
	hasPoint = removeComma($(this).parent().prev().prev().children().text());
	//사용금액
	usePoint = $(this).val();
	chaPoint = hasPoint - usePoint;
	
	if(usePoint == 0){
		$(this).val(0);
		
		if(total_discount > 0){
			var id = $(this).attr("id");
			removeDiscount(id);
		}
		console.log("totalPrice : "+ totalPrice);
		console.log("total_discount : "+ total_discount);
		
		
	}else if(chaPoint < 0){
		alert("보유하신 금액인 "+hasPoint+"보다 크게 입력하셨습니다.");
		$(this).val(usePoint);
	}else if(usePoint < 1000){
		alert("최소 1,000P부터 사용 가능합니다.");
		$(this).val(usePoint);
	}else if(usePoint % 10 != 0){
		alert("10P 단위로 사용 가능합니다.");
		$(this).val(usePoint);
	}else{
		
		//정상적인 사용가능 포인트
		var id = $(this).attr("id");
		appendDiscount(id);
		
	}
});


//할인 내역 추가 + 총 할인 금액 계산
function appendDiscount(id){
	total_discount += (usePoint*1);

	var html = '<dl>'
	+'<dt>' + selected_li + '</dt>'
	+'<dd><span class="num">'+ addComma(usePoint) +'</span>'
	+'<span class="won">원</span>'
	+'<a class="discount_del" id="'+ id +'_del" href="#none"><span>적용취소</span></a>'
	+'</dd>'
	+'</dl>';
	
	$("#summary_discount_list").append(html);
	$("#summary_discount_total").text(addComma(total_discount));
	
	console.log("totalPrice : "+ totalPrice);
	console.log("total_discount : "+ total_discount);
	
	//남은 결제 금액 출력
	console.log("aa");
	console.log($("#summary_total_amount").text());
	var startPrice = removeComma($("#summary_total_amount").text());
	$("#summary_payment_total").text(addComma(startPrice - total_discount));
}

//할인 내역 제거 + 가격 변환
function removeDiscount(id){
	total_discount -= removeComma($("#"+ id +"_del").prev().prev().text());
	$("#summary_discount_total").text(addComma(total_discount));
	$("#"+ id +"_del").parent().parent().remove();
}


//적용 포인트 X버튼 클릭시 취소
$("#summary_discount_list").on("click",".discount_del",function(){
	console.log($(this).prev().prev().text());
	var subPoint = removeComma($(this).prev().prev().text());
	total_discount -= (subPoint*1);
	
	var arr = [];
	arr = $(this).attr("id").split("_");
	$("#"+arr[0]).val(0)
	
	$(this).parent().parent().remove();
	$("#summary_discount_total").text(addComma(total_discount));
	
	totalPrice += usePoint;
	
	console.log("totalPrice : "+ totalPrice);
	console.log("total_discount : "+ total_discount);
});


//포인트 모두 사용
//계산해야될 금액 - 잔여금액 < 0     :       계산해야될금액  
//계산해야될 금액 - 잔여금액 > 0     :		잔여금액 전부 (일의 자리 내림)
$(".secondTit").click(function(){
	//checked가 true이면
	if($(this).children().prop("checked") == true){
		usePoint = removeComma($(this).parent().find(".hasPoint").text());
		
		if(totalPrice - usePoint < 0){
			console.log(totalPrice);
			usePoint = totalPrice;
		}else{
			usePoint = Math.floor(usePoint/10)*10;
			console.log(usePoint);
		}
		
		totalPrice -= usePoint;
		//input창에 출력
		$(this).parent().find("input").val(usePoint);
		//할인내역 추가
		var id = $(this).parent().find("input").attr("id");
		appendDiscount(id);
		
	}else{
		console.log("false");
		//input창에 0
		//할인내역에서 삭제 
		//totalPrice값 더하기
		//total_discount값 빼기
		
		if(total_discount > 0){
			var id = $(this).parent().find("input").attr("id");
			removeDiscount(id);
			
			$(this).parent().find("input").val(0);
			totalPrice += usePoint;
		}
		
		console.log("totalPrice : "+ totalPrice);
		console.log("total_discount : "+ total_discount);
		
		
	}
	
});



















//포인트 및 기타 결제 수단 출력 내용 변경 
$("#discCoupon .discount_list li").click(function(){
	$("#discCoupon .discount_list li").removeClass("selected");
	$(this).addClass("selected");
	
	discount_form_change("#discCoupon ");
});

//포인트 및 기타 결제 수단 출력 내용 변경 
$("#payPoints .discount_list li").click(function(){
	$("#payPoints .discount_list li").removeClass("selected");
	$(this).addClass("selected");
	
	discount_form_change("#payPoints ");
});


//li selected값 변경 
function discount_form_change(selected){
	$(selected+".discount_list li").each(function(){
		if($(this).hasClass("selected")){
			
			selected_li = $(this).find("a").text();
			console.log("li name : "+ selected_li);
			
			
			$(selected+".discount_form .form").css("display","none");
			console.log($(this).attr("id"));
			
			var str = [];
			str = $(this).attr("id").split("_");
			
			$("#"+str).css("display","block");
		}
	});
}














//간편 결제 클릭시 아래 수단 추가
//last_pay_radio3
$("#lastPayCon span").click(function(){
	$("#summary_payment_list dl dt").text($(this).find("label").text());
	
	
	if($(this).find("input").prop("checked") == true && $(this).val() == 3){
		$("#smartPayCon").css("display","block");
	}else{
		$("#smartPayCon").css("display","none");
	}
});




//이니스트 결제
function payment_inicis(data){
	var IMP = window.IMP; // 생략가능
    IMP.init('imp08695126'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    
    IMP.request_pay({
        pg : 'inicis', // version 1.1.0부터 지원.
        pay_method : 'card',
        merchant_uid : 'cgv_' + new Date().getTime(),
        amount : data.amount,
        buyer_email : data.email,
        buyer_name : data.name,
        buyer_tel : data.tel,
        m_redirect_url : 'https://www.yourdomain.com/payments/complete'
        	
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            
            var imp_uid =  rsp.imp_uid; //고유ID
            var merchant_uid = rsp.merchant_uid; //상점 거래ID 
            var paid_amount = rsp.paid_amount; //결제 금액 
            var apply_num = rsp.apply_num; //카드 승인번호 
            var pay_method = rsp.pay_method; //결제 방식 
            var pg_provider =  rsp.pg_provider; //PG사
            
            $.ajax({
            	url : '../payment/paymentInsert',
            	type : 'post',
            	data : {
            			imp_uid : imp_uid,
            			merchant_uid : merchant_uid,
            			apply_num : apply_num,
            			pay_method : pay_method,
            			pg : pg_provider,
            			_csrf : $("#_csrf").val(),
            			
            	},
            	success : function(result){
            		if(result > 0){
            			alert(msg + "결제 번호 : "+result);
            			console.log("결제 번호 : "+result);
            			
            			//결제 성공시 예매 테이블에 등록 
            			reservation_save(result);
            		}else{
            			alert('결제 DB 저장 실패');
            		}
            	}
            });
            
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
        }
        
    });
	
}

//예매 정보 + 좌석예매 정보 DB저장
function reservation_save(result){
	$.ajax({
		url : '../reservation/reservationInsert',
		type : 'post',
		data : { 
			movieNum : $("#movieNum").val(),
			paymentNum : result,
			movieTimeNum : $("#movieTimeNum").val(),
			uid : 'tester',
			filmType : $("#filmType").val(),
			cinemaName : $("#cinemaName").val(),
			theaterName : $("#theaterName").val(),
			seats : $("#select_Seat").text(),
			totalPrice : lastPrice,
			common : commonCount,
			teenager : teenagerCount,
			preference : preferenceCount,
			selectedSeatNums : selectedSeatNumList.join(","),
			_csrf : $("#_csrf").val()
			
		},
		success : function(data){
			console.log(data);
			if(data > 0){
				console.log("예매 번호 : "+data);
			}else{
				console.log(">>>예매 테이블 등록 실패");
			}
			
		}
	});
}






































