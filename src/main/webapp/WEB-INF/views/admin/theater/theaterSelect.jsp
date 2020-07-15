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
					<!--  <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="#">서울</li></a>
                            <li class="breadcrumb-item active">경기</li>
                            <li class="breadcrumb-item active">인천</li>
                            <li class="breadcrumb-item active">강원</li>
                            <li class="breadcrumb-item active">대전/충청</li>
                            <li class="breadcrumb-item active">대구</li>
                            <li class="breadcrumb-item active">부산/울산</li>
                            <li class="breadcrumb-item active">경상</li>
                            <li class="breadcrumb-item active">광주/전라/제주</li>
                        </ol> -->
					<div class="card mb-4">
						<div class="card-body">
							<p class="mb-0">
								<code>Theater Info</code>
								<br> <span>${cine.name}</span><br> <span>${cine.local}</span><br>
								<span>${cine.tel}</span><br> <span>${cine.totalTheater}</span><br>
								<span>${cine.totalSeat}</span><br> <span>${cine.trafficInfo}</span><br>
								<span>${cine.parkingInfo}</span><br> <span>${cine.intro}</span><br>
							</p>
						</div>
					</div>
					<div>
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
											<td><a href="">${vo.num}</a></td>
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
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<c:import url="../template/scripts.jsp"></c:import>
</body>
</html>