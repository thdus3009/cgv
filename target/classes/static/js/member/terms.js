
var all = document.getElementById("all");
var h_all = document.getElementById("h_all");
var ch1 = document.getElementsByClassName("ch1");

/* 전체 체크 */
$("#all").change(function(){
	if ($("#all").is(':checked')) {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = true;
		}
	} else {
		for (i = 0; i < ch1.length; i++) {
			ch1[i].checked = false;
		}
	}
});

/* 부분 체크 */
$('.ch1').each(function() {
	$(this).click(function() {

		var check = true;
		$('.ch1').each(function() {
			if ($(this).prop('checked') === false) {
				check = false;
				return;
			}
		});

		$('#all').prop('checked', check);
	});
});

/* 약관 동의 체크 */
/* term1,2 체크되면 */
$("#btn").click(function() {
	if ($("#term1").is(':checked') && $("#term1").is(':checked')) {
		location.href = "../member/join";
	} else {
		alert("필수 조건에 동의해야 가입이 가능합니다!");
	}
});




























