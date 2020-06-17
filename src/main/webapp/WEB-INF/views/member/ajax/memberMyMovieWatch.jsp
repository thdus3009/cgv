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
					<a href="">이 영화를 평가해주세요</a>
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
</body>
</html>