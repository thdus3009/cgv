/**
 * 
 */

//삭제
$(".del-td").click(function(){

	if(confirm("삭제하시겠습니까?")){
		var num = $(this).data("reservation_num");
		
		$.get("./delete?num="+num,function(result){
			console.log("result : "+result);
			if(result > 0){
				alert("삭제 성공");
				//var curPage = getUrlParameter('curPage');
				//location.href="./selectList?curPage="+curPage;
				
				location.reload();
				
			}else{
				alert("삭제 실패");
			}
		});
		
	}
});



//Page이동
$(".custompager").click(function(){
	var curPage = $(this).attr("title");
	console.log(curPage);
	$("#form-Data #curPage").val(curPage);

	$("#form-Data").submit();
});


//검색 분야 설정

var type = "";
$(".type").click(function(){
	console.log("aaaa")
	if($(this).prop("checked") == true){
		type = $(this).val();
		console.log("type : "+type);
	}
});
















//콤마 생성
function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}


//총 금액에 콤마 적용
$(".totalPrice").each(function(){
	$(this).text(addComma($(this).text()));
});

//숫자에 맞게 띄워주는 값 변경
$(".flimType").each(function(){
	if($(this).text() == 1){
		$(this).text("2D");
	}else if($(this).text() == 2){
		$(this).text("3D");
	}else if($(this).text() == 4){
		$(this).text("4D");
	}

});





//결제 정보 모델창으로 출력
function show(num){
	console.log("payment Num : "+num);
	
	//받은 값을 이용해 ajax를 실행
	$.get("../payment/SelectOne?num="+num,function(result){
		console.log(result);
		
		//ajax를 통해 받아온 값을 용해서  기존의 html의 값들을 변경해줌
		$("#paymentNum").text(result.num);
		$("#imp_uid").text(result.imp_uid);
		$("#merchant_uid").text(result.merchant_uid);
		$("#pg").text(result.pg);
		$("#pay_method").text(result.pay_method);
		$("#apply_num").text(result.apply_num);
		
	});
	
	
	
	
	
	 $("#myModal").modal('show');
}
























