/**
 * 
 */

//추가 버튼 클릭 
$("#btn-add").click(function(){
	location.href="./write?num="+cinemaNum;
});


//삭제 버튼 클릭 - 해당 필름 관람가격 전체 삭제
$("#timePriceTable").on("click",".btnDel",function(){
	var filmType = $(this).parent().data("filmtype");

	location.href = './deleteFilm?cinemaNum='+cinemaNum+'&filmType='+filmType;
});


//수정버튼 클릭 
$("#timePriceTable").on("click",".btnUpdate",function(){
	var filmType = $(this).parent().data("filmtype");

	location.href = './update?cinemaNum='+cinemaNum+'&filmType='+filmType;
});	

//테이블 생성
for(i=0;i<timePriceList.length;i++){
	var type = "2D";
	switch(timePriceList[i].filmType){
	case '2':
		type = "3D";
		break;	
	case '4':
		type = "4D";
		break;
	}
	var tdHTML = '<tr>'
		+'<td>'+ list[i] +' ~ '+ timePriceList[i].eTime +'</td>'
		+'<td>'+ addComma(timePriceList[i].commonPrice) +'</td>'
		+'<td>'+ addComma(timePriceList[i].teenagerPrice) +'</td>'
		+'</tr>'

		var tableHTML = '<div class="filmTypeTable" data-filmType="'+ timePriceList[i].filmType +'">' 
		+ '<h3>' + type + '</h3>'
		+ '<button class="btnDel btn btn-primary">삭제</button>'
		+ '<button class="btnUpdate btn btn-primary">수정</button>' 
		+ '<table class="table">'
		+ '<thead>'
		+ '<tr>'
		+ '<th>시간대</th>'
		+ '<th>일반</th>'
		+ '<th>청소년</th>'
		+ '</tr>'
		+ '</thead>'
		+ '<tbody></tbody>'
		+ '</table></div>';

	if(filmType != timePriceList[i].filmType){
		$("#timePriceTable").append(tableHTML);
		filmType = timePriceList[i].filmType;
	}
	$(".table:last tbody").append(tdHTML);
}












