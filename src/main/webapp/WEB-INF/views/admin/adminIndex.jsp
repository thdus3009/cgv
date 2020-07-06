<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="./template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/admin.css" />
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

		<c:import url="./template/sidenav.jsp"></c:import>


		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>AdminPage</h1>
					<p class="pp">관리자 정보 수정 페이지</p>
					<div>
						<form action="" method="get">
							<table>
								<tr>
									<th>이름</th>
									<td><input type="text" required="required" value=""></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" required="required" value=""></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="text" class="pwd" value=""
										required="required"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="text" class="pwd_chk" required="required"></td>
								</tr>
							</table>
							<div class="btn_s">
								<button id="cancle" type="submit">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$("#cancle").click(function(){
		if($(".pwd").val() != $(".pwd_chk").val()){
			alert("비밀번호가 일치하지 않습니다!");
		}
	});

	</script>
	<c:import url="./template/scripts.jsp"></c:import>
</body>
</html>