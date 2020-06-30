/**
 * 
 */

/*$(".deleteBtn").click(function() {

	if(!confirm("※주의※\n정말 탈퇴시키겠습니까?"))
		return;
		
	var username = $(this).attr("id");
	var parent = $(this).parent();
	console.log(parent);
	$.get('./memberDelete?username=${username}'+username, function(result) {

		if(result==0) {
			// 생기면 안되는 로직
			console.log("삭제 실패");
			return;
		}

		parent.empty();
		parent.html("탈퇴된 계정입니다");
	});
});*/

$("#searchTxt").click(function() {
	
	if($("#searchTag").val() == "") {
		alert("검색 태그를 먼저 설정해주세요")
		$("#searchTxt").blur();
		$("#searchTag").focus();
		return;
	}
});

$("#searchBtn").click(function() {

	var searchTag = $("#searchTag").val();
	var searchTxt = $("#searchTxt").val();
	location.href = "./memberList?curPage=&kind="+searchTag+"&search="+searchTxt;
});