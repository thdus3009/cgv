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
					<h1>Cinema List</h1>
					<p>영화관 목록</p>
					<ol class="cinema-ol">
						<li class="breadcrumb-item active"><a href="#">서울</a></li>
						<li class="breadcrumb-item active"><a href="#">경기</a></li>
						<li class="breadcrumb-item active"><a href="#">인천</a></li>
						<li class="breadcrumb-item active"><a href="#">강원</a></li>
						<li class="breadcrumb-item active"><a href="#">대전/충청</a></li>
						<li class="breadcrumb-item active"><a href="#">대구</a></li>
						<li class="breadcrumb-item active"><a href="#">부산,울산</a></li>
						<li class="breadcrumb-item active"><a href="#">경상</a></li>
						<li class="breadcrumb-item active"><a href="#">광주,전라,제주</a></li>
					</ol>


					<!-- 목록 -->
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr class="admin-tr">
									<th>No.</th>
									<th>극장명</th>
									<th>지역</th>
									<th>주소</th>
									<th>연락처</th>
									<th>총 관수</th>
									<th>총 좌석수</th>
									<th>교통안내</th>
									<th>주차안내</th>
									<th>소개</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="admin-tr">
									<th>No.</th>
									<th>극장명</th>
									<th>지역</th>
									<th>주소</th>
									<th>연락처</th>
									<th>총 관수</th>
									<th>총 좌석수</th>
									<th>교통안내</th>
									<th>주차안내</th>
									<th>소개</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${list}" var="vo">
									<tr class="admin-tr-each">
										<td class="ate-center">${vo.num}</td>
										<td class="ate-center"><a
											href="../cinema/cinemaSelect?num=${vo.num}">${vo.name}</a></td>
										<td class="ate-center">${vo.local}</td>
										<td>${vo.address}</td>
										<td class="ate-center">${vo.tel}</td>
										<td class="ate-center">${vo.totalTheater}</td>
										<td class="ate-center">${vo.totalSeat}</td>
										<td>${vo.trafficInfo}</td>
										<td>${vo.parkingInfo}</td>
										<td>${vo.intro}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- 페이저 -->
						<div class="pager">
							<ul class="pagination">
								<c:if test="${pager.curBlock>1}">
									<li><a href="#" class="custompager"
										title="${pager.startNum-1}">이전</a></li>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="p">
									<li><a href="#" class="custompager" title="${p}">${p}</a></li>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li><a href="#" class="custompager"
										title="${pager.lastNum+1}">다음</a></li>
								</c:if>
							</ul>
						</div>

					</div>

				</div>
		</div>
	</div>

	<!-- 스크립트 -->
	<script src="js/scripts.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

</body>
</html>