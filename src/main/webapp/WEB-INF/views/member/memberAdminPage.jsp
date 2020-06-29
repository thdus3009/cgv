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

<title>Admin - Cinema List</title>

<link href="${pageContext.request.contextPath}/css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member/memberMyPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/admin/theater/theaterList.css" rel="stylesheet" type="text/css">

<!-- bootstrap -->
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body class="root">

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>

	<!-- 콘텐츠 -->
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li><a href="../"> <img alt="go to Home"
							src="../images/login/btn_home.png">
					</a></li>
					<li><a href="">MY CGV</a></li>
					<li class="last">MY CGV ADMIN HOME</li>
				</ul>
			</div>
		</div>


		<div class="contents">
			<div>
				<!-- 메뉴바 -->
				<div class="col_aside">
					<div class="snb">
						<ul>
							<li class="on"><a href="">ADMIN HOME<i></i></a></li>
							<li><a href="">회원 관리<i></i></a></li>
							<li><a href="">☞ 영화관 관리<i></i></a></li>
							<li><a href="">상영관 관리<i></i></a></li>
							<li><a href="">공지사항 관리</a></li>
						</ul>
					</div>
					<div class="ad_area">
						<div class="ad_panner_1">
							<a href=""> <img alt=""
								src="../images/bbsList/200313_160x300.jpg">
							</a>
						</div>
						<div class="ad_panner_2">
							<a href=""> <img alt=""
								src="../images/bbsList/0325_160x35.png">
							</a>
						</div>
					</div>
				</div>

				<!-- 내용 -->
				<div class="col_content">
					<div class="col_detail">

						<div class="top-bar">
							<h1>Cinema List</h1>
							<!-- 검색 -->
							<form action="" method="get" class="search-form">
							<input type="text" class="serach-text">
								<button type="submit" class="search-btn">검색</button>
								<a href="" class="theaterAdd-btn">영화관 등록</a>
							</form>
						</div>

						<h3>${cine.name}</h3>
						<ol class="ol">
							<li class="breadcrumb-item"><a href="#">서울</li></a>
							<li class="breadcrumb-item">경기</li>
							<li class="breadcrumb-item">인천</li>
							<li class="breadcrumb-item">강원</li>
							<li class="breadcrumb-item">대전/충청</li>
							<li class="breadcrumb-item">대구</li>
							<li class="breadcrumb-item">부산/울산</li>
							<li class="breadcrumb-item">경상</li>
							<li class="breadcrumb-item">광주/전라/제주</li>
						</ol>
						<div class="card mb-4" style="display: none;">
							<div class="card-body">
								<p class="mb-0">
									<code>Cinema Info</code>
									<br> <span>${cine.name}</span><br> <span>${cine.local}</span><br>
									<span>${cine.tel}</span><br> <span>${cine.totalTheater}</span><br>
									<span>${cine.totalSeat}</span><br> <span>${cine.trafficInfo}</span><br>
									<span>${cine.parkingInfo}</span><br> <span>${cine.intro}</span><br>
								</p>
							</div>
						</div>
						<table class="theaterList-bar">
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
									<th>CinemaNum</th>
									<th>Name</th>
									<th>seatCount</th>
									<th>filmType</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${theaterList}" var="vo">
									<tr class="theaterList-c">
										<td><a href="">${vo.num}</a></td>
										<td>${vo.cinemaNum}</td>
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
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

	</div>

	<!-- 스크립트 -->
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