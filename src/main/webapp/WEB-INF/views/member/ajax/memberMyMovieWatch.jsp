<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 본 영화</title>
</head>
<body>
	<div class="contentsBox">
		<div class="watchBox1">
			<div class="tit-mycgv">
				<div class="tit">
					<h3>내가 본 영화</h3>
					<p>
						<em>1건</em>
					</p>
				</div>
				<div>
					<select class="sect-sorting">
						<option>전체</option>
						<option>연도1</option>
						<option>연도2</option>
					</select>
					<button class="go-button" type="button">GO</button>
					<button class="red-button">실관람객 등록</button>
					<button class="red-button">내 평점 보기</button>
				</div>
			</div>
		</div>

		<div class="watchBox2">
			<!-- 내가 본 영화가 있을 경우 -->
			<div class="sect-movielog-list">
				<ul>
					<!-- li 반복 -->
					<li class="movie-info">
						<div>
							<a href="" class="movie-poster">
								<img alt="영화 포스터" src="test2.jpg">
								<span></span>
							</a>
						</div>
						<div class="reserve-info">
							<a href="" class="movie-name">
								<strong>영화제목</strong>
							</a>
							<p class="movie-eng-name">영문제목</p>
							<p class="movie-rev">상영날짜 상영시간</p>
							<p class="movie-rev">상영 위치 / 관람객수</p>
							<!-- 관람평을 작성했을 경우 -->
							<a href="" class="movie-rev">
								<img>
								좋았어요
								별로였어요
							</a>
							<!-- 관람평을 작성하지 않았을 경우 -->
							<a id="modal-review" class="movie-rev">이 영화를 평가해주세요</a>
						</div>
						<img alt="해당영화 삭제버튼" src="" class="movie-del">
					</li>
				</ul>
			</div>
			<!-- 내가 본 영화가 없을 경우 -->
			<div style="display: none;">
				<p>내가 본 영화가 없습니다.<br>현재 상영중인 영화를 예매해 보세요</p>
				<a href="">무비차트</a>
			</div>
		</div>


	</div>


	<!-- 리뷰쓰기 모달창 -->
	<div class="modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<form id="form" name="form" method="post" action="./review/review_Write">
					<div class="modal-header">
						<h1 class="modal-title">평점작성</h1>
						<span id="btn_close">닫기</span>
					</div>

					<div class="modal-contents">
						<!-- Modal body -->
						<div class="modal-body">
							<strong>영화제목</strong>
							<div class="likeornot">
								<span class="like">
									<img src="sprite_egg.png" alt="">
									<label>
										<input type="radio" name="liked" checked="checked">
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
									</span>
								</span>
							</div>
							<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
							/
							<textarea id="mContents" name="contents">
							</textarea>
							<textarea placeholder="daf">

							</textarea>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<span>
								<button type="submit" class="review-done">작성완료!</button>
								<strong id="counter">0</strong>
								/280(byte)
							</span>
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
	<script type="text/javascript" src="../js/member/memberMyMovieWatch.js"></script>

</body>
</html>