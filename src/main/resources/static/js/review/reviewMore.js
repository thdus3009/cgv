/**
 * 		ajax paging
 */

	
	var count=1;	
	
	function getList(curPage){//처음 창을 열면 curPage가 안떠있다가("getList?curPage=" 이 형태) 더보기를 누르면 count++된 정보가 curPage에 들어가게 된다.
		//ajax
		$.get("getList?curPage="+curPage, function(result){//getList에서 만들어진 정보를 result(임의의 이름)로 받아와서 #result의 해당태그 내 자식태그의 밑에서 부터 추가된다.
			$('#result').append(result);
		});
	}
	
	getList(count);
	/* ------------------- */
	$("#more").click(function(){
		count++;
		getList(count);
	});
