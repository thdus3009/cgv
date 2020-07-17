//Page이동
$(".custompager").click(function(){
	var curPage = $(this).attr("title");
	$("#form-Data #curPage").val(curPage);

	$("#form-Data").submit();
});

//현재 날짜보다 시간이 빠르면 css 입힘(가독성용)
var nowDate = new Date();
$(".eIssuance").each(function(){

	var date = new Date($(this).text()+ "T23:59:59");
	console.log(date)
	if(nowDate >= date){
		$(this).parent().css("backgroundColor","gray")
	}

});

//가격에 콤마 적용
$(".price").each(function(){
	if($(this).text() == 0){
		$(this).text("-")
	}else{
		$(this).text(addComma($(this).text()));
	}
});


//종료 글자로 변경
$(".type").each(function(){
	if($(this).text() == 'cgvGiftPrePayipt'){
		$(this).text("CGV 포인트");
	}else if($(this).text() == 'cjOnePointipt'){
		$(this).text("CJ 포인트");	
	}

});