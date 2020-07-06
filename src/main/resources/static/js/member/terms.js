

var all = document.getElementById("all");
var ch1 = document.getElementsByClassName("ch1");
var terms_ch = document.getElementsByClassName("terms_ch");
var h3 = document.getElementsByTagName("h3");
var btn = document.getElementById("btn");

var h_all = document.getElementById("h_all");

var flag = true;


h_all.addEventListener("click", function() {
	all_check();
});

all.addEventListener("click", function() {
	// alert(all.checked);
	// console.log(all.checked);

	if (all.checked) {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = true;
		}
	} else {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = false;
		}
	}

});

function all_check() {
	if (!all.checked) {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = true;
			all.checked = true;
		}
	} else {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = false;
			all.checked = false;
		}
	}
}






for (i = 0; i < ch1.length; i++) {
	ch1[i].addEventListener("click", function() {
		if (this.checked == false) {
			all.checked = false;
		} else {
			for (k = 0; k < ch1.length; k++) {
				all.checked = ch1[k].checked;
			}
		}
	});
}



for (i = 1; i < h3.length; i++) {
	h3[i].addEventListener("click", function() {
//		console.log(ch1[0]);
		
		console.log(this.title);
		console.log(ch1[this.title]);
		console.log(ch1[this.title].checked);
		if (ch1[this.title].checked == false) {
			ch1[this.title].checked = true;
		}else{
			ch1[this.title].checked = false;
		}
		
		var all_flag = true;
		for(i=0;i<ch1.length;i++){
			if(!ch1[i].checked){
				all_flag = false;
			}
			all.checked = all_flag;
		}
	});
}




btn.addEventListener("click", function() {
	for (i = 0; i < terms_ch.length; i++) {
		if (!terms_ch[i].checked) {
			flag = false;
		}
	}

	if (flag) {
		alert("회원가입 페이지로 이동합니다.");
		location.href = "./join";
	} else {
		alert("체크하지 않은 필수 항목이 있습니다.");
	}

});

/*var*/
var all = document.getElementById("all");
var h_all = document.getElementById("h_all");
var ch1 = document.getElementsByClassName("ch1");

/*	전체 체크/해제	*/
$("#h_all").click(function(){
	ch1[i].checked = true;
	for (i = 0; i < ch1.length; i++) {
		ch1[i].checked = true;
	}
});

/*	각자 체크 *3 전체체크	*/
/*$(".content_title").click(function() {
	console.log($(this).prev());
	$(this).prev().prop("checked", true);
});*/

/*	전체체크 - 각자체크*1 해제	*/


