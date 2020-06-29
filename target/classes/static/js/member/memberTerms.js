/* 약관 동의 */

/*var all = document.getElementById("all");
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
		// console.log(ch1[0]);

		console.log(this.title);
		console.log(ch1[this.title]);
		console.log(ch1[this.title].checked);
		if (ch1[this.title].checked == false) {
			ch1[this.title].checked = true;
		} else {
			ch1[this.title].checked = false;
		}

		var all_flag = true;
		for (i = 0; i < ch1.length; i++) {
			if (!ch1[i].checked) {
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

/*$("#btn").click(function name() {
	if ($(".terms_ch").is(":checked")) {
		alert("회원가입 페이지로 이동합니다.");
		location.href = "./memberJoin";
	} else{
		alert("체크하지 않은 필수 항목이 있습니다.");
	}
});*/

/*전체 체크박스 기능*/
$(".all").click(function() {
    if ($(".all").prop("checked")) {
        $("input[type=checkbox]").prop("checked",true);
    } else{
        $("input[type=checkbox]").prop("checked",false);
    }
});

/*일반 체크 박스 해제 시, 전체 체크박스 해제*/
$(".checkbox").click(function() {
    $(".all").prop("checked", false);
});

/*일반 체크 박스 선택 시, 전체 체크박스 선택*/
$(".checkbox").each(function() {
	$(this).click(function() {
		
		var check = true;
		$(".checkbox").each(function() {
			if($(this).prop("checked") === false) {
				check = false;
				return;
			}
		});
		$(".all").prop("checked", check);
	});
});

/*버튼 눌렀을 시, 체크박스 확인*/
var flag = false;

$("#btn").click(function() {
    $(".terms_ch").each(function(index) {
        console.log(this);
        if ($(this).is(":checked") == true) {
            flag=true;
        } else if($(this).is(":checked") == false){
            flag=false;
    		alert("체크하지 않은 필수 항목이 있습니다.");
            return false;
        }
    });

    if (flag == true) {
		alert("회원가입 페이지로 이동합니다.");
		location.href = "./memberJoin";
    }
});
