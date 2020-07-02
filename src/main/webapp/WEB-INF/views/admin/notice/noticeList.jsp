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
					<h1>Notice List</h1>
					<p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
					<div class="contents">
						<div class="col_detail">
							<!----------------------------------------------------------------------------------------------------- contents detail search_area-->
							<div class="search_area">
								<form action="./bbsList">
									<select style="width: 100px;" name="kind">
										<option selected="selected" value="title">제목</option>
										<option value="contents">내용</option>
									</select> <input type="text" name="search" placeholder="검색어를 입력해 주세요"
										style="width: 185px;">
									<button type="submit" class="round inblack">
										<span>검색하기</span>
									</button>
								<a href="./bbsWrite"><button id="btn-submit" type="button" class="round inred">글쓰기</button></a>
								</form>
							</div>

							<!----------------------------------------------------------------------------------------------------- contents detail tab-->
							<div class="wrap_tab">
								<ul class="cinema-ol">
									<li><a class="lo" href="./bbsList">전체</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">시스템 점검</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">극장</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">기타</a></li>
								</ul>
							</div>
							<!----------------------------------------------------------------------------------------------------- contents detail search_result-->
							<div class="search_result">
								<%-- 총<span class="num">${fn:length(bbsList)}</span>건이 검색되었습니다. --%>
								총<span class="num">${pager.totalCount}</span>건이 검색되었습니다.
							</div>


							<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
							<div class="box_bbsList">
								<table class="tbl_list">
									<colgroup>
										<col style="width: 50px;">
										<col style="width: 570px;">
										<col style="width: 80px;">
										<col style="width: 75px;">
										<col style="width: 60px;">
									</colgroup>
									<thead>
										<tr class="top-tr">
											<th scope="col">번호</th>
											<th scope="col" class="tit">제목</th>
											<th scope="col">등록자</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody id="list_body">
										<c:forEach var="list" items="${bbsList}">
											<tr class="first">
												<td>${list.num}</td>
												<td class="txt"><a href="./bbsSelect?num=${list.num}">${list.title}</a></td>
												<td>${list.writer}</td>
												<td>${list.hireDate}</td>
												<td class="num">${list.hit}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

							<!----------------------------------------------------------------------------------------------------- contents detail paging-->
							<div class="paging">

								<c:if test="${pager.curBlock gt 1}">
									<button id="btn-first" type="button" class="btn_page first"></button>
									<button id="btn-pre" type="button" class="btn_page pre">이전</button>
								</c:if>

								<ul>
									<!-- 							<li class="on"><a href="#">1</a></li> -->
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">

										<li><a
											href="./bbsList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>

									</c:forEach>

								</ul>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<button id="btn-next" type="button" class="btn_page next">다음</button>
									<button id="btn-end" type="button" class="btn_page end">끝</button>
								</c:if>
							</div>
						</div>

					</div>

				</div>
			</main>
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