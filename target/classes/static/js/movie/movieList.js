/**
 * 
 */

	$("#btn-more").click(function() {
		var kind = $("#select").val();
		var startRow = $("#startRow").val();
		var search=$("#search").val();
		console.log(startRow+"startRow");
		
		$.get("./movieListMore?startRow="+(startRow)+7+"&kind="+kind,function(result){

			console.log("result"+result);
			$("#list-more").html(result);
			
			
			$("#btn-more").css("visibility","hidden");
		});
		
	});

	//고객용 리스트 정렬
	$("#btn-sort").click(function(){
		var kind = $("#select").val();
		location.href = "./movieList?kind="+kind;
	});
	
	
	
	// 고객용 영화 리스트 페이지 검색 기능
	$("#btn_search").click(function() {
		var search=$("#search").val();
		var kind =$("#select").val();
		console.log(search);
		location.href = "./movieSearch?search="+search;
		
		//$.get("./movieListSearch?search="+search,function(result){
		//	console.log(result);
	});
		
	
		
	var params = location.search.substr(location.search.indexOf("?") + 1);
	params = params.split("=");
		
	for(var i=0;i<params.length;i++){
		temp = params[0];
	}
	console.log(temp);
	$("#param").attr("value",temp);
		
		
	
	
	$(document).ready(function() {
		//url로 들어오는 파라미터값 읽어들이기
		function getParam(sname) {

		    var params = location.search.substr(location.search.indexOf("?") + 1);
		    var sval = "";
		    params = params.split("&");
		    for (var i = 0; i < params.length; i++) {
		        temp = params[i].split("=");
		        if ([temp[0]] == sname) { sval = temp[1]; }
		    }
		    return sval;
		}
		
		
		//읽어들인 파라미터값으로 selected값 변경
		$("select option[value='"+getParam("kind") +"']").attr("selected", true);
	});