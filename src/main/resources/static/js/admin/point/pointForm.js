/**
 * 
 */

//숫자만 등록 가능
	$("#price").keyup(function() {
		reg = /[^0-9]/gi;
		v = $(this).val();

		if (reg.test(v)) {
			$(this).val(v.replace(reg, ''));
			$(this).focus();
		}
	});

	$("#btnSubmit").click(function(){
		var rate = $("#discountRate").val();

		$.ajax({
			url : './accumulateManagement',
			type : 'post',
			data : {
				rate : rate,
				_csrf : $("#_csrf").val()
			},
			success : function(result){
				if(result>0){
					$("#discountRate").val(result);
					alert("변경되었습니다.");
				}else{
					alert("변경 실패");
				}
			}
		});
	});
