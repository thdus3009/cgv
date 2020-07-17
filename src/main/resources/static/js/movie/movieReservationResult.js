/**
 * 
 */

$("#ticket_cancle").click(function(){
	var reservationNum = $(this).data("index");
	var check = confirm("예매를 취소하시겠습니까? \n※인터넷 예매 취소는 상영시간 20분 전까지 가능하며, \n예매 가능은 상영시간 30분 전까지 가능합니다.");
	
	if(check){
		//location.href="../reservation/reservationCancle?num="+reservationNum;
		
		$.ajax({
			url:'../reservation/reservationCancle',
			type:'get',
			data :{
				num : reservationNum
			},
			success : function(result){
				location.href="../";
			}
		});
	}
});