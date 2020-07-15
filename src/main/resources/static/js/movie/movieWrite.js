	
var check = document.getElementsByClassName("check");
console.log(check+"check");
var id = document.getElementById("btn");
console.log(btn+"btn");

btn.addEventListener("click",function(e){
	var flag =false;
	var blankArr =[];
	
	for(i=0;i<check.length;i++){
		if(check[i].value.length == 0){
			flag = true;
			blankArr.push(check[i]);
		}
	}
	
	if(blankArr.length != 0){
		var blank_go = document.getElementById(blankArr[0].id);
	}
	
	if(flag){
		e.preventDefault();
		console.log(flag);
		alert("미기입한 항목이 존재합니다.")
		blank_go.focus();
		return;
	}
	
	alert("등록 성공");
});