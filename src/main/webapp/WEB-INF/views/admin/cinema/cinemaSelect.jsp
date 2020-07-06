<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
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
					<h1>${cine.name}</h1>
					<p>영화관 정보</p>
					<div class="card mb-4">
						<div class="card-body">
							<p class="mb-0">
								<code>Cinema Info</code>
								<br> 
								<span>영화관 이름: ${cine.name} CGV</span><br> 
								<span>지역: ${cine.local}</span><br>
								<span>번호: ${cine.tel}</span><br> 
								<span>총 관수: ${cine.totalTheater}개</span><br>
								<span>총 좌석: ${cine.totalSeat}개</span><br> 
								<span>교톻안내: ${cine.trafficInfo}</span><br>
								<span>주차안내: ${cine.parkingInfo}</span><br> 
								<span>영화관 소개: ${cine.intro}</span><br>
							</p>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Num</th>
									<!-- <th>CinemaNum</th> -->
									<th>Name</th>
									<th>seatCount</th>
									<th>filmType</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<!-- <th>CinemaNum</th> -->
									<th>Name</th>
									<th>seatCount</th>
									<th>filmType</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${theaterList}" var="vo">
									<tr class="theaterList-c">
										<td><a href="../theater/theaterSelect">${vo.num}</a></td>
										<%-- <td>${vo.cinemaNum}</td> --%>
										<td>${vo.name}</td>
										<td>${vo.seatCount}</td>
										<c:if test="${vo.filmType eq 0}">
											<td>2D</td>
										</c:if>
										<c:if test="${vo.filmType eq 1}">
											<td>3D</td>
										</c:if>
										<c:if test="${vo.filmType eq 2}">
											<td>4D</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
</body>
</html>