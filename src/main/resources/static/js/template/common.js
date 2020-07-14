/**
 * 
 */


function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}


function removeComma(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}


//사용기간 비교 - 두날짜간에 차이 비교(앞에 날짜가 뒤에 날짜보다 클수 없음) - 해당 Form태그의 아이디값 필요 
function periodComparison(id){
	$("#"+id).submit(function() {
		var startDate = $("#sIssuance").val();
		var endDate = $("#eIssuance").val();

		var startArray = startDate.split('-');
		var endArray = endDate.split('-');

		var start_date = new Date(startArray[0], startArray[1],	startArray[2]);
		var end_date = new Date(endArray[0], endArray[1], endArray[2]);

		if (start_date.getTime() > end_date.getTime()) {
			alert("종료일이 시작일보다 늦어야합니다!");
			return false;
		}
	});

}










