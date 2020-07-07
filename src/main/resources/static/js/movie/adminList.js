	


//관리자 리스트 정렬
	$("#admin_sort").click(function(){
		console.log("관리자 정렬");
		var kind = $("#selectA").val();
		console.log(kind+"관리자 정렬");
		
		
		location.href = "./movieList?kind="+kind;
	});
	
	// 관리자 페이지 영화 리스트 검색 기능
	$("#admin_search").click(function() {
		var search=$("#search").val();
		var kind =$("#select").val();
		console.log(search);
		location.href = "./movieSearchA?search="+search;
			
		//$.get("./movieListSearch?search="+search,function(result){
		//	console.log(result);
		});
	

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
