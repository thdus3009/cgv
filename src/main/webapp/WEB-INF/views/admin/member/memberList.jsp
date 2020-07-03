<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<c:import url="../template/head.jsp"></c:import>
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>
		
		<div id="layoutSidenav_content">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<main>
				<br>
				<!-- main contents -->
				<!-- 검색창 -->
				<div class="input-group">
					<select id="searchTag" name="searchTag">
					    <option value="">검색 태그</option>
					    <option value="id">아이디</option>
					    <option value="name">이름</option>
					    <option value="phone">핸드폰</option>
					    <option value="email"></option>
					</select>
					
					<input id="searchTxt" class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
					<div class="input-group-append">
						<button id="searchBtn" class="btn btn-primary" type="button">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				
				<!-- 테이블 -->
				<div style="margin: 10px;">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>핸드폰</th>
								<th>이메일</th>
								<th>성별</th>
								<th>나이</th>
								<th>닉네임</th>
								<th>계정상태(활성/탈퇴)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<th>${vo.username}</th>
									<th>${vo.name}</th>
									<th>${vo.birth}</th>
									<th>${vo.phone}</th>
									<th>${vo.email}</th>
									<th>
										<c:if test="${vo.gender eq true}">남</c:if>
										<c:if test="${vo.gender eq false}">여</c:if>
									</th>
									<th>${vo.age}</th>
									<th>${vo.nick}</th>
									<th>
										<div id="username" class="btns">
										<c:if test="${vo.enabled eq 1}">
											<%-- <a class="btn btn-info updateBtn" href="./memberUpdate?username=${vo.username}">수정</a>
											<button id="${vo.username}" class="btn btn-danger deleteBtn" type="button">탈퇴</button> --%>
											활성
										</c:if>
										<c:if test="${vo.enabled eq 0}">
											탈퇴
										</c:if>
										</div>
									</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- pager -->
					<div>
						<ul class="pagination">
							<c:if test="${pager.curBlock gt 1}">
								<li class="page-item"><a class="page-link" href="./memberList?curPage=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<li class="page-item"><a class="page-link" href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							</c:forEach>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<li class="page-item"><a class="page-link" href="./memberList?curPage=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript" src="/js/admin/member/memberList.js"></script>
</body>
</html>

<!-- 

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />


<title>관리자 페이지</title>

<link rel="stylesheet" href="/css/styles.css" />
<link rel="stylesheet" href="/css/admin/member/member.css" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- 로고  
		<a href="/"><img src="/images/header/h1_cgv.png"
			class="admin-logo" /></a>
		<!-- 검색 바 
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
		<!-- 로그인 
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/">메인 페이지로</a> 
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
				</div></li>
		</ul>
	</nav>

	<!-- 사이드바  
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu"><div class="nav">
						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/notice/noticeList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공지사항
						</a>
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/member/bannerList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/movie/movieList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/cinema/cinemaList">
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
						</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/notice/bannerManage">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 배너 관리
						</a>
					</div>
				</div>
			</nav>
		</div>

		<!-- 내용  
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>member List</h1>
					<!-- 내용  
					<div class="col_detail">

						<!-- 멤버 목록  
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr class="admin-tr">
								<td>번호</td>
								<td>아이디</td>
								<td>패스워드</td>
								<td>이름</td>
								<td>생년월일</td>
								<td>전화번호</td>
								<td>이메일</td>
								<td>성별</td>
								<td>나이</td>
								<td>닉네임</td>
								<td>상태</td>
							</tr>
							<!-- 반복  
							<!-- 이름 누르면 회원 상세 페이지로 이동  
							<c:forEach items="" var="vo">
								<tr class="memberList-c">
									<td>num</td>
									<td>uid</td>
									<td>pwd</td>
									<td><a href="#">name</a></td>
									<td>birth</td>
									<td>phone</td>
									<td>email</td>
									<td>gender</td>
									<td>age</td>
									<td>nick</td>
									<td>enabled</td>
								</tr>
							</c:forEach>
						</table>

						<!-- 페이저  
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
			</main>
		</div>
	</div>

	<!-- 스크립트  
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

 -->