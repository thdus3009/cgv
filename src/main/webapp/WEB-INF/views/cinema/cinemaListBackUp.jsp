<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieList.css" rel="stylesheet" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -------------------------------------------------------------------------------------->
		<c:import url="../template/header.jsp"></c:import>

		<!-- 컨테이너 -------------------------------------------------------------------------------------->

		<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="./cinemaList">극장</a></li>
						<li class="last">극장 리스트</li>
					</ul>
				</div>
			</div>

			<div class="contents">
				<div class="movie-chart">
					<!-- 			헤더 제목부분+ 차트종류(서브) -->
					<div class="sect-movie-title">
						<h3>CinemaList</h3>
						<div class="submenu">
							<ul>
								<li class="on"><a href="">무비 차트</a></li>
								<li><a href="">상영예정작</a></li>
							</ul>
						</div>
					</div>

					<!-- 			정렬부분 -->
					<div class="sect-sorting">
						<select id="select" name="kind">
							<option title="1" value="rate" selected="selected">전체보기</option>
							<c:forEach var="li" items="${list}">
								<option title="2" value="date">${li.local}</option>
							</c:forEach>
							<!-- <option title="2" value="date">최신순</option>
						<option title="3" value="title">제목순</option> -->
						</select>
						<button id="btn-sort" type="button" class="round gray">
							<span>GO</span>
						</button>
					</div>


					<!-- 			리스트 출력부분 -->
					<div class="sect-movie-chart">

						<table class="table table-hover">
							<tr>
								<td>Num</td>
								<td>Name</td>
								<td>Local</td>
								<td>Address</td>
								<td>Tel</td>
								<td>totalTheater</td>
								<td>totalSeat</td>
								<td>TrafficInfo</td>
								<td>ParkingInfo</td>
							</tr>
							<c:forEach var="list" items="${list}">

								<tr>
									<td>${list.num}</td>
									<td><a href="./cinemaUpdate?num=${list.num}">${list.name}</a></td>
									<td>${list.local}</td>
									<td>${list.address}</td>
									<td>${list.tel}</td>
									<td>${list.totalTheater}</td>
									<td>${list.totalSeat}</td>
									<td>${list.trafficInfo}</td>
									<td>${list.parkingInfo}</td>

								</tr>

							</c:forEach>

						</table>


						<a href="./cinemaInsert" class="btn btn-danger">Add</a>





						<div class="sect-movie-chart" id="list-more"></div>


						<div class="chart-ad">
							<div class="box-com">
								<a href=""><img alt="adImage"
									src="../images/movie/movieList/200313_160x300.jpg"></a>
							</div>
							<div class="chart-ad-desc">
								<dl>
									<dt>
										<img alt="ad1" src="../images/movie/movieList/ico_ad1.png">
										<span>CGV 기프트 카드</span>
									</dt>
									<dd>
										<span>센스있는 선물의 정석</span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="btn-more" id="btn-more">
						더보기 <i class="link-more"></i>
					</div>

				</div>

			</div>
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>


	<script type="text/javascript" src="../js/movie/movieList.js"></script>




</body>
</html>
















