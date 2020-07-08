<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movie/stylesMovieAdmin.css" />
<link rel="stylesheet" href="/css/admin/movie/movie.css" />
<link href="${pageContext.request.contextPath}/css/movie/movieSelect.css" rel="stylesheet" type="text/css">

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
					<h1>movie Select</h1>
					<input type="hidden" value="${vo.num}">
					<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
				<div class="sect-base-movie">
					<div class="box-image"  >
					<a href="">
						<span class="thumb-image">
							<img  class="box-image" alt="" src="../../images/movie/movieList/filmCover/${vo.movieImageVOs[0].fileName}">
							<span class="icon-grade grade-${list.ageLimit}">${list.ageLimit}</span>
						</span>
					</a>
					</div>
					<div class="box-contents">
						<div class="title2">
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
								<a href="./movieDelete?num=${vo.num}"><button type="button" class="round inred" id="btn-delete"><span>삭제하기</span></button></a>
								<a href="./movieUpdate?num=${vo.num}"><button type="button" class="round inred" id="btn-update"><span>수정하기</span></button></a>
							</c:if>
									
					</div>	
				</div>
			
			</main>
			<c:import url="../template/footer.jsp"></c:import>
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