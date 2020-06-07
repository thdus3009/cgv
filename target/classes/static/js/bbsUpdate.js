

var s_byte = document.getElementById("s_byte");
var s_length = document.getElementById("s_length");
var textarea_l = document.getElementById("textarea_l");

var check = document.getElementsByClassName("check");
var btn = document.getElementById("btn");



var strByteLength = function(s, b, i, c) {
	for (b = i = 0; c = s.charCodeAt(i++); b += c >> 11 ? 3 : c >> 7 ? 2 : 1)
		;
	return b
}



textarea_l.addEventListener("keyup", function() {

	var str = textarea_l.value.length;

	s_byte.innerText = strByteLength(textarea_l.value);
	s_length.innerText = str;
});


var str = $("#textarea_l").val().length;

$("#s_byte").text(strByteLength($("#textarea_l").val()))
$("s_length").text(str);



btn.addEventListener("click", function(e) {
	var flag = true;
	var blankArr = [];
	
	console.log(blankArr);
	
	for (i = 0; i < check.length; i++) {
		if (check[i].value.length == 0) {
			flag = false;
			blankArr.push(check[i]);
		}
	}
	console.log(blankArr);
	
	if(blankArr.length != 0){
		var blank_go = document.getElementById(blankArr[0].id);
	}
	

	if(flag) {
		alert("글 등록");
		console.log("글등록")
	} else {
		alert("미기입한 항목이 존재합니다.");
		blank_go.focus();
		e.preventDefault();
	}
});




$("#btn-remove").click(function() {
	var fileName = $(this).data("title");
	var num = $(this).data("num");
	//console.log(fileName);
	//	console.log(num);
	
	$.get("../bbsFile/fileDelete?fileName="+fileName+"&num="+num,function(result){
		console.log("r: "+result);
		
		if(result > 0){
			alert("파일이 삭제 되었습니다.");
			$("#btn-remove").parent().remove();
			$("#fileInput").append('<input type="file" name=files">');
		}
	});
	
});































