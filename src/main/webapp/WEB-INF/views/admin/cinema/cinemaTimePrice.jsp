<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/price.css" />
</head>
<body class="sb-nav-fixed">

	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Cinema Time Price</h1>
					<p>시간대별 관람가격 안내</p>

					<div class="container-box">
						<form action="./" method="get" enctype="" class="search-f">
							<!-- 지역 -->
							<select class="form-control">
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
							<select class="form-control" style="border-left: none;">
								<option></option>
							</select>
							<button type="button" class="btn btn-primary">
								<i class="fas fa-search"></i>
							</button>
						</form>

						<!-- 표 -->
						<div>
							<!-- 2D -->
							<div class="time-table">
								<strong>■ 2D</strong>
								<table>
									<tr class="time-tr">
										<th>시간대</th>
										<th>일반</th>
										<th>청소년</th>
									</tr>
									<tr class="time-tr">
										<td>모닝( 06:00~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>브런치( 10:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>데이라이트( 13:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>프라임( 16:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>문라이트( 22:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>나이트( 24:01~ )</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
							<!-- 3D -->
							<div class="time-table">
								<strong>■ 3D</strong>
								<table>
									<tr class="time-tr">
										<th>시간대</th>
										<th>일반</th>
										<th>청소년</th>
									</tr>
									<tr class="time-tr">
										<td>모닝( 06:00~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>브런치( 10:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>데이라이트( 13:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>프라임( 16:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>문라이트( 22:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>나이트( 24:01~ )</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
							<!-- 4D -->
							<div class="time-table">
								<strong>■ 4D</strong>
								<table>
									<tr class="time-tr">
										<th>시간대</th>
										<th>일반</th>
										<th>청소년</th>
									</tr>
									<tr class="time-tr">
										<td>모닝( 06:00~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>브런치( 10:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>데이라이트( 13:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>프라임( 16:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>문라이트( 22:01~ )</td>
										<td></td>
										<td></td>
									</tr>
									<tr class="time-tr">
										<td>나이트( 24:01~ )</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>

	<!-- 스크립트 -->
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript">
		
	</script>

</body>
</html>


