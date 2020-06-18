<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 본 영화</title>
</head>
<body>
	<div>
		<h3>내가 본 영화</h3>
		<em>n건</em>
		<div>
			<select>
				<option>전체</option>
				<option>연도1</option>
				<option>연도2</option>
			</select>
			<button type="button">GO</button>
			<button>실관람객 등록</button>
			<button>내 평점 보기</button>
		</div>
	</div>
	<div>
	<!-- 내가 본 영화가 있을 경우 -->
	<div>
		<ul>
			<!-- li 반복 -->
			<li>
				<div>
					<a href="">
						<img alt="" src="" title="영화 포스터">
					</a>
				</div>
				<div>
					<a href=""><strong>영화제목</strong></a>
					<p>영문제목</p>
					<p>상영날짜 상영시간</p>
					<p>상영 위치 / 관람객수</p>
					<!-- 관람평을 작성했을 경우 -->
					<a href=""><span></span>좋았어요</a>
					<!-- 관람평을 작성하지 않았을 경우 -->
					<button type="button" id="modal-review">이 영화를 평가해주세요</button>
				</div>
				<img alt="해당영화 삭제버튼" src="">
			</li>
		</ul>
	</div>
	<!-- 내가 본 영화가 없을 경우 -->
	<div>
		<p>내가 본 영화가 없습니다.<br>현재 상영중인 영화를 예매해 보세요</p>
		<a href="">무비차트</a>
	</div>
	</div>


	  <!-- 리뷰쓰기 모달창 -->
	  <div class="modal">
		<div class="modal-dialog">
		  <div class="modal-content">
		  
			<!-- Modal Header -->
			<form id="form" name="form" method="post" action="./review/review_Write">
			<div class="modal-header">
			  <h4 class="modal-title">평점작성</h4>
			  <span id="btn_close">닫기</span>
			</div>
			
			<div class="modal-contents">
			<!-- Modal body -->
			<div class="modal-body">
				<h1>영화제목</h1>
				<div class="likeornot">
					<span class="like">
						<img src="sprite_egg.png" alt="">
						<label>
							<input type="radio" name="liked">
							<span>좋았어요~^^</span>
						</label>
					<div class="profile">
						<img src="" alt="프로필 사진">
						<em>실관람객</em>
						<span>닉네임</span>
					</div>
					<span class="notlike">
						<label>
							<input type="radio" name="liked">
							<span>흠~ 좀 별로였어요;;;</span>
						</label>
				</div>
			<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
				<textarea id="mContents" name="contents" rows="5" cols="70" 
				placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." 
				style="font-size: small;"></textarea>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<span>
					<strong id="counter">0</strong>
					/280(byte)
				</span>
			  	<button type="submit" class="review-done">작성완료!</button>
			</div>
		</div>
			</form>

		  </div>
		</div>
	  </div>

	   <!-- 관람포인트 선택 모달창 -->
	   <div class="point-modal">
		<div class="point-modal-dialog">
		<div class="point-modal-content">
		
		  <!-- Modal Header -->
		  <form id="form" name="form" method="post" action="./review/review_Write">
		  <div class="modal-header">
			<h4 class="modal-title">관람 포인트 선택</h4>
			<span id="btn_point_close">닫기</span>
		  </div>
		  
		  <!-- Modal body -->
		  <div class="modal-body">
			<h1>이 영화의 관람 포인트를 선택해주세요!</h1>
			<p>중복선택이 가능합니다.</p>
			<div class="movie-point1">
				<strong>매력 포인트</strong>
				<label>
					<input type="checkbox">
					감독연출
				</label>
				<label>
					<input type="checkbox">
					스토리
				</label>
				<label>
					<input type="checkbox">
					영상미
				</label>
				<label>
					<input type="checkbox">
					배우연기
				</label>
				<label>
					<input type="checkbox">
					OST
				</label>
			</div>
			<div class="movie-point2">
				<strong>감정 포인트</strong>
				<label>
					<input type="checkbox">
					몰입감
				</label>
				<label>
					<input type="checkbox">
					감동
				</label>
				<label>
					<input type="checkbox">
					감독연출
				</label>
				<label>
					<input type="checkbox">
					스트레스 해소
				</label>
				<label>
					<input type="checkbox">
					유쾌함
				</label>
				<label>
					<input type="checkbox">
					공감
				</label>
			</div>
		  
		  <!-- Modal footer -->
		  <div class="modal-footer">
				<button type="submit" class="point-done">확인!</button>
		  </div>
		  </form>

			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
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
	$(function() {
      $('#mContents').keyup(function (e){
          var content = $(this).val();
          $('#counter').html(content.length*2);
      });
      $('#content').keyup();
	});

	//작성완료 버튼 - 리뷰 쓰지 않음
	$(".review-done").click(function () {
		if ( $('#mContents').val().length < 1) {
			alert("내용을 입력하지 않았습니다.");
			return false;
		//작성완료 버튼 - 10자 이상 등록
		} else if($('#mContents').val().length < 10) {
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

	</script>


</body>
</html>