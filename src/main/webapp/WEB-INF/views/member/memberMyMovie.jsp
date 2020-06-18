<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="col-aside" title="프로필&메뉴">
		<div class="box-round-dgray">
			<img alt="프로필사진" src="test.jpg">
			<div class="box-contents">
				<strong>이름</strong>
				<a href=""><img></a>
				<em>닉네임</em>
			</div>
		</div>
		<div class="box-round-wgray">
			<a href="" class="movie-col">
				<em>숫자</em>
				<strong>기대되는 영화</strong>
			</a>
		</div>
		<div class="box-round-wgray">
			<a href="" class="movie-col">
				<em>숫자</em>
				<strong>내가 본 영화</strong>
			</a>
		</div>
	</div>
	<div class="col-detail">
		<!-- 기대되는 영화 -->
		<div class="tit-mycgv">
			<div class="tit">
				<h3>기대되는 영화</h3>
				<p>
					<em>1건</em>
				</p>
			</div>
			<div class="sect-sorting">
				<select>
					<option>등록일 순</option>
					<option>개봉일 순</option>
				</select>
				<button>GO</button>
			</div>
		</div>
		<!---->

		<!-- 내가 본 영화 -->
		<div class="tit-mycgv">
			<div class="tit">
				<h3>내가 본 영화</h3>
				<p>
					<em>1건</em>
				</p>
			</div>
			<div class="sect-sorting">
				<select>
					<option>전체</option>
					<option>년도</option>
				</select>
				<button class="go-button">GO</button>
				<button class="red-button">실관람객 등록</button>
				<button class="red-button">내 평점 보기</button>
			</div>
		</div>
		<!---->
	</div>
	<script type="text/javascript">

	</script>
</body>
</html>