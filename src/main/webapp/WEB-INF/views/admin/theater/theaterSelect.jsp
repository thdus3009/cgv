<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<c:import url="../template/head.jsp"></c:import>
<link href="../css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import> 
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="#">CGV Admin</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">Logout</a>
				</div></li>
		</ul>
	</nav>
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