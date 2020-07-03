
		var count = 0;

		//버튼 누를때마다 input추가
		$(".banner-add").click(
			function() {
				var $banner = $('<div class="banner-label"><input type="file"><span class="del" id="btn" style="cursor:pointer;">삭제</span></div>');
				var bannerForm = document.getElementById("banner-form");
				var bannerCount = bannerForm.childElementCount+1;

				if( bannerCount <= 10){
					$("#banner-form").append($banner);
				}else{
					alert("배너는 10개까지만 가능합니다!");
					}
			});

		$(function() {
			//배너 추가 라벨 삭제
			$(".banner-form").on("click", "span", function() {
				$(this).parent().remove();
			});
		});
		