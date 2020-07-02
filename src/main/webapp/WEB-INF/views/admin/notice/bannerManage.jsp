<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />


<title>관리자 페이지</title>

<link rel="stylesheet" href="/css/styles.css" />
<link rel="stylesheet" href="/css/admin/notice/notice.css" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- 로고 -->
		<a href="/admin"><img src="/images/header/h1_cgv.png"
			class="admin-logo" /></a>
		<!-- 검색 바-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색어를 입력"
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- 로그인-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/">메인 페이지로</a> <a
						class="dropdown-item" href="#">관리자 설정</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">로그아웃</a>
				</div></li>
		</ul>
	</nav>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공지사항
						</a>
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="./admin/movie/movieWrite">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> <a class="nav-link" href="./admin/cinema/cinemaList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 극장 관리
						</a> <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 예매 관리
						</a> <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 리뷰 관리
						</a> <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 배너 관리
						</a>
					</div>
				</div>
			</nav>
		</div>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Banner Manage</h1>
					<div class="col_detail">
						<!-- 배너사진 설정 -->
						<div class="banner-list">
							<p class="notice-ul2">
								<span class="title-ul">배너 목록</span> <span class="banner-add">+
									배너 추가</span>
							</p>
							<form action="" method="post" class="banner-form">
							<!-- 배너 목록 -->
							</form>
							<div class="btn_s">
								<button id="cancle" type="button">취소</button>
								<button id="btn" type="submit">등록하기</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<!-- 스크립트 -->
	<script type="text/javascript">
		var count = 0;

		//버튼 누를때마다 input추가
		$(".banner-add")
				.click(
						function() {
							var $banner = $('<div class="banner-label"><input type="file"><span class="del">삭제</span></div>');
							$(".banner-form").append($banner);
						});

		//배너 추가 라벨 삭제
		$(function() {
			$(".banner-form").on("click", "span", function() {
				$(this).parent().remove();
			});
		});
	</script>
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