/**
 * 
 */

$("#btn-more").click(function() {
		var kind = $("#select").val();
		
		$.get("./movieListMore?startRow=8&kind="+kind,function(result){

			console.log("result"+result);
			$("#list-more").html(result);
			
			$("#btn-more").css("visibility","hidden");
		});
		
	});


	$("#btn-sort").click(function(){
		var kind = $("#select").val();
		location.href = "./movieList?kind="+kind;
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