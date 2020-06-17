<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기대되는 영화</title>
</head>
<body>
	<div>
		<h3>기대되는 영화</h3>
		<em>n건</em>
		<div>
			<select>
				<option>등록일 순</option>
				<option>개봉일 순</option>
			</select>
			<button type="button">GO</button>
		</div>
	</div>
	<div>
	<!-- 기대되는 영화가 있을 경우 -->
		<ul>
			<!-- li 반복 -->
			<li>
				<a href="">
					<img title="영화 포스터" alt="" src="">
					<strong>영화 제목</strong>
				</a>
				<span>개봉날짜</span>
				<span>상영여부</span>
			</li>
			
		</ul>
	<!-- 기대되는 영화가 없을 경우 -->
		<div>
			<p>기대되는 영화가 없습니다.<br>영화 상세 프리에그에서 '기대돼요!'를 선택하여 영화를 추가해보세요.</p>
			<a href="">무비차트</a>
		</div>
	</div>
</body>
</html>