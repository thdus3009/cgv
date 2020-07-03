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

<link rel="stylesheet" href="/css/admin/movie/stylesMovieAdmin.css" />
<link rel="stylesheet" href="/css/admin/movie/movie.css" />
<link href="${pageContext.request.contextPath}/css/movie/movieSelect.css" rel="stylesheet" type="text/css">

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
					<a class="dropdown-item" href="/">메인 페이지로</a>
					<a class="dropdown-item" href="#">관리자 설정</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">로그아웃</a>
				</div>
			</li>
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
						</a> <a class="nav-link" href="../movie/movieList?kind=date">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> <a class="nav-link" href="../cinema/cinemaList">
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
					<h1>movie Select</h1>
				
					
				<div class="sect-base-movie">
					<div class="box-image"  >
					<a href="">
						<span class="thumb-image">
							<img  class="box-image" alt="" src="../../images/movie/movieList/filmCover/${vo.movieImageVOs.fileName}">
							<span class="icon-grade grade-${list.ageLimit}">${list.ageLimit}</span>
						</span>
					</a>
					</div>
					<div class="box-contents">
						<div class="title">
							<strong id="title">${vo.title}</strong>
							<em class="round lightblue">
								<span>현재 상영중</span>
							</em>
							<p>${vo.titleEng}</p>
						</div>
						
						<div class="score" >
							<strong class="percent">
								예매율&nbsp;
								<span>${vo.rate}</span>
							</strong>
						
						
							<div class="egg-gage small" style="background: url('../../images/movie/movieList/bg_writeinfo.gif') 0 12px no-repeat;">
									<!--   <img alt="" src="../images/movie/movieList/sprite_egg.png">-->
									
									<!-- <div class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png')" ></div> -->
									<c:if test="${vo.errRate lt 50 }">
									<!-- 터진  계란  -->
									<span class="egg great" id="this" style="background:url('../../images/movie/movieList/sprite_egg.png') no-repeat -0px -47px"></span>
									</c:if>
									
									<c:if test="${vo.errRate lt 70 && vo.errRate ge 50 }">
									<!-- 왕관없는 계란  -->
									<span class="egg great" id="this" style="background:url('../../images/movie/movieList/sprite_egg.png') no-repeat -18px -47px"></span>
									</c:if>
									
									<c:if test="${vo.errRate ge 70 }">
									<!-- 왕관있는 계란 -->
									 <span class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png') no-repeat -38px -47px"></span> 
									</c:if>
								<span class="percent">${vo.errRate}</span>
							</div>
						</div>
						
						
						<div class="spec">
							<dl>
								<dt>감독 :&nbsp;</dt>
								<dd><a href="">${vo.director}</a></dd>
								<dd></dd>
								<dt>&nbsp;/ 배우 :&nbsp;</dt>
								<dd class="on">
									<a href="">${vo.actor}</a>
								</dd>
								<dt>장르 :&nbsp;${vo.ganre}</dt>
								<dd></dd>
								<dt>&nbsp;/ 기본 : &nbsp;</dt>
								<dd class="">${vo.ageLimit}세 이상,&nbsp;${vo.runtime}분,&nbsp;${vo.country}</dd>
								<br>
								<dt>개봉 : &nbsp;</dt>
								<dd class="on">${vo.openDate}</dd>
							</dl>
						</div>
						<span class="screentype">
						
						</span>
						
						<div class="sect-story-movie" >
						<strong>${vo.contents}</strong>
					</div>
							
					</div>
					</div>
					<div class="bbs_btn">
						
									
							<c:if test="${bbsVO.writer eq memberVO.id }">
								<a href="./moiveDelete?num=${vo.num}"><button type="button" class="round inred" id="btn-delete"><span>삭제하기</span></button></a>
								<a href="./movieUpdate?num=${vo.num}"><button type="button" class="round inred" id="btn-update"><span>수정하기</span></button></a>
							</c:if>
									
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
	<script type="text/javascript" src="../../js/movie/adminList.js"></script>
	
	<!-- <script type="text/javascript">
	
	$("#admin_sort").click(function(){
		var kind = $("#selectA").val();
		console.log(kind+"관리자 정렬");
		location.href = "./movieList?kind="+kind;
	});

	$(document).ready(function() {
		//url로 들어오는 파라미터값 읽어들이기
		function getParam(sname) {

		    var params = location.search.substr(location.search.indexOf("?") + 1);
		    var sval = "";
		    params = params.split("&");
		    for (var i = 0; i < params.length; i++) {
		        temp = params[i].split("=");
		        if ([temp[0]] == sname) { sval = temp[1]; }
		    }
		    return sval;
		}
		
		
		//읽어들인 파라미터값으로 selected값 변경
		$("select option[value='"+getParam("kind") +"']").attr("selected", true);
	});
	
	</script> -->
</body>
</html>