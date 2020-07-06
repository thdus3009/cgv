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
<link rel="stylesheet" href="/css/admin/reservation/reservation.css" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				<input class="form-control" type="text" placeholder="검색어를 입력" aria-label="Search" aria-describedby="basic-addon2" />
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
					<a class="dropdown-item" href="/">메인 페이지로</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
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
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/notice/noticeList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공지사항
						</a>
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/member/memberList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/movie/movieList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/cinema/cinemaList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 극장 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/reservation/reservationList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 예매 관리
						</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/reservation/selectList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 리뷰 관리
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/notice/bannerManage">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 배너 관리
						</a>
					</div>
				</div>
			</nav>
		</div>



		<!-- 내용 -->
		<div id="layoutSidenav_content" >
			<main style="min-width: 1590px;">
				<div class="container-fluid" >
					<h1 style="float: left">Reservation List</h1>

					<form action="../reservation/selectList" id="form-Data" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="float: right; padding-bottom: 20px;">
						<div class="input-group">
							<input class="form-control" name="search" value="${pager.search}" type="text" placeholder="검색어를 입력" aria-label="Search" aria-describedby="basic-addon2" />
							<input type="hidden" id="curPage" name="curPage" value="">
							<input type="hidden" id="sDate" name="sDate" value="">
							<input type="hidden" id="eDate" name="eDate" value="">
							 
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>

						<div class="form-group "
							style="float: right; padding-right: 10px; text-align: right;">
							<select class="form-control col-md-12" name="kind">
								<option class="type" id="title" value="title" selected="selected">제목</option>
								<option class="type" id="username" value="username">아이디</option>
								<option class="type" id="all" value="all">제목+아이디</option>
							</select>
						</div>
					</form>

					<!-- 목록 -->
					<div class="table-responsive" style="clear: both;">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr class="admin-tr">
									<th style="width: 48px;">No.</th>
									<th>영화제목</th>
									<th style="width: 80px;">시작 시간</th>
									<th style="width: 78px;">결제 번호</th>
									<th style="width: 78px;">필름 타입</th>
									<th style="width: 78px;">영화관</th>
									<th style="width: 73px;">상영관</th>
									<th style="width: 83px;">예매 좌석</th>
									<th style="width: 62px;">일반</th>
									<th style="width: 62px;">청소년</th>
									<th style="width: 62px;">우대</th>
									<th style="width: 105px;">ID</th>
									<th style="width: 98px;">결제 금액</th>
									<th style="width: 142px;">생성일</th>
									<th style="width: 50px;">삭제</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="admin-tr">
									<th>No.</th>
									<th>영화제목</th>
									<th>시작 시간</th>
									<th>결제 번호</th>
									<th>필름 타입</th>
									<th>영화관</th>
									<th>상영관</th>
									<th>예매 좌석</th>
									<th>일반</th>
									<th>청소년</th>
									<th>우대</th>
									<th>ID</th>
									<th>결제 금액</th>
									<th>생성일</th>
									<th>삭제</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${reservationList}" var="vo">
									<tr class="admin-tr-each">
										<td class="ate-center">${vo.num}</td>
										<td class="" style="text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">${vo.movieInfoVO.title}</td>
										<td class="ate-center">${vo.movieTimeVO.screenTime}</td>
										<td class="ate-center" data-payment_num="${vo.paymentNum}" >
											<a href="#" onclick="show(${vo.paymentNum})" style="color: #333;">${vo.paymentNum}</a>
										</td>
										<td class="flimType ate-center">${vo.filmType}</td>
										<td class="ate-center">${vo.cinemaName}</td>
										<td class="ate-center">${vo.theaterName}</td>
										<td class="ate-center" style="text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">${vo.seats}</td>
										<td class="ate-center">${vo.common}</td>
										<td class="ate-center">${vo.teenager}</td>
										<td class="ate-center">${vo.preference}</td>
										<td class="ate-center">${vo.uid}</td>
										<td class="totalPrice" style="text-align:right;">${vo.totalPrice}</td>
										<td class="ate-center">${vo.createAt}</td>
										<td class="del-td" data-reservation_num="${vo.num}">X</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						


						<!-- 페이저 -->
						<div class="pager" style="display: flex; justify-content: center;">
							<ul class="pagination">
							
								<c:if test="${pager.curBlock>1}">
									<li class="page-item"><a href="#" class="page-link custompager" title="${pager.startNum-1}">이전</a></li>
								</c:if>
								
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
									<li class="page-item"><a href="#" class="page-link custompager" title="${p}">${p}</a></li>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li class="page-item"><a href="#" class="page-link custompager" title="${pager.lastNum+1}">다음</a></li>
								</c:if>
								
							</ul>
						</div>

					</div>
					
					
					
					<div class="payment-List">
					
					</div>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" style="width: 850px;">
								<div class="modal-header">
									<h4 class="modal-title" style="float: left">결제 정보</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<!-- 목록 -->
										<div class="table-responsive">
											<table class="table table-bordered" id="dataTable" style="width: 100%;">
												<thead>
													<tr class="admin-tr">
														<th style="width: 48px;">No.</th>
														<th style="width: 80px;">imp_uid</th>
														<th style="width: 78px;">merchant_uid</th>
														<th style="width: 78px;">pg</th>
														<th style="width: 78px;">pay_method</th>
														<th style="width: 73px;">apply_num</th>
													</tr>
												</thead>
												
												<tbody>
													<tr class="admin-tr-each">
														<td id="paymentNum" class="ate-center">${vo.num}</td>
														<td id="imp_uid" class="ate-center">${vo.imp_uid}</td>
														<td id="merchant_uid" class="ate-center">${vo.merchant_uid}</td>
														<td id="pg" class="ate-center">${vo.pg}</td>
														<td id="pay_method" class="ate-center">${vo.pay_method}</td>
														<td id="apply_num" class="ate-center">${vo.apply_num}</td>
													</tr>
												</tbody>
											</table>


										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal"></button>
								</div>
							</div>

						</div>
					</div>

				</div>
			</main>
		</div>
	</div>
	
	<script type="text/javascript" src="/js/admin/reservation/reservation.js"></script>
	<script type="text/javascript">

		var kind = '${pager.kind}';
		if(kind == ''){
			$("#title").prop("selected", true);
		}else{
			$("#"+kind).prop("selected",true);
		}
		
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
