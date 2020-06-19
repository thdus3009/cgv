		

		//리뷰쓰기 모달창 열기
		$("#modal-review").click(function () {
			$(".modal").css('display', 'inline');
		});

		//리뷰쓰기 모달창 닫기
		$("#btn_close").click(function () {
			console.log("sdfsd");
			$(".modal").css('display', 'none');
		});

		//관람포인트 선택 모달창 닫기
		$("#btn_point_close").click(function () {
			console.log("sdfsd");
			$(".point-modal").css('display', 'none');
		});

		//좋아요/별로에요 누르면 배경이미지 변경

		//리뷰 글씨 카운트
		$(function () {
			$('#mContents').keyup(function (e) {
				var content = $(this).val();
				$('#counter').html(content.length * 2);
			});
			$('#content').keyup();
		});

		//작성완료 버튼 - 리뷰 쓰지 않음
		$(".review-done").click(function () {
			if ($('#mContents').val().length < 1) {
				alert("내용을 입력하지 않았습니다.");
				return false;
				//작성완료 버튼 - 10자 이상 등록
			} else if ($('#mContents').val().length < 10) {
				alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
				return false;
				//작성완료 버튼 - 관람 포인트 선택 물어보기
			} else {
				if (confirm("관람평이 등록되었습니다.\n관람하신 영화의 관람포인트를\n선택하시겠습니까?")) {
					$(".modal").css('display', 'none');
					event.preventDefault();
					//관람포인트 선택 모달띄우기
					$(".point-modal").css('display', 'inline');
				}
				$(".modal").css('display', 'none');
			}
		});
		
		