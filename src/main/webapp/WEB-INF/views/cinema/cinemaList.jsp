<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/cinema/cinemaList.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
						<li class="last">극장별 관람가격</li>
					</ul>
				</div>
			</div>

			<div class="contents">
				<h3>관람가격 안내</h3>

				<!-- 검색 -->
				<div class="search-div">
					<form action="./" method="get" enctype="">
						<!-- 지역 -->
						<select id="search-local">
							<option>서울</option>
							<option>경기</option>
							<option>인천</option>
							<option>강원</option>
							<option>대전/충청</option>
							<option>대구</option>
							<option>부산,울산</option>
							<option>경상</option>
							<option>광주,전라,제주</option>
						</select>
						<!-- 영화관 -->
						<select id="search-cinema">
							<option></option>
						</select>
						<button type="button" class="search-btn"></button>
					</form>
				</div>
				
				<!-- 극장별 영화 관람가격 -->
				<div class="timetable">
					<!-- 2D -->
					<div class="time-table">
						<strong>&nbsp;&nbsp;&nbsp;■ 2D</strong>
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col style="width: 75px;">
								<col style="width: 75px;">
							</colgroup>
							<tr class="time-tr">
								<th scope="row">시간대</th>
								<th scope="row">일반</th>
								<th scope="row">청소년</th>
							</tr>
							<!-- 반복 -->
							<tr class="time-tr">
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					<!-- 3D -->
					<div class="time-table"
						style="border-right: 1px solid #ab9c8f; border-left: 1px solid #ab9c8f;">
						<strong>&nbsp;&nbsp;&nbsp;■ 3D</strong>
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col style="width: 75px;">
								<col style="width: 75px;">
							</colgroup>
							<tr class="time-tr">
								<th scope="row">시간대</th>
								<th scope="row">일반</th>
								<th scope="row">청소년</th>
							</tr>
							<!-- 반복 -->
							<tr class="time-tr">
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					<!-- 4D -->
					<div class="time-table">
						<strong>&nbsp;&nbsp;&nbsp;■ 4D</strong>
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col style="width: 75px;">
								<col style="width: 75px;">
							</colgroup>
							<tr class="time-tr">
								<th scope="row">시간대</th>
								<th scope="row">일반</th>
								<th scope="row">청소년</th>
							</tr>
							<!-- 반복 -->
							<tr class="time-tr">
								<td>asd</td>
								<td>asd</td>
								<td>sd</td>
							</tr>
							<tr class="time-tr">
								<td>asd</td>
								<td>asd</td>
								<td>sd</td>
							</tr>
							<tr class="time-tr">
								<td>asd</td>
								<td>asd</td>
								<td>sd</td>
							</tr>
							<tr class="time-tr">
								<td>asd</td>
								<td>asd</td>
								<td>sd</td>
							</tr>
						</table>
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


<%-- <table class="table table-hover">
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
						</table> --%>















