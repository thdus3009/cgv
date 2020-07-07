<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/notice/notice.css" />
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
					<h1>Banner Manage</h1>
					<p>배너 사진 설정</p>
					<div class="col_detail">
						<!-- 배너사진 설정 -->
						<div class="banner-list">
							<p class="notice-ul2">
								<span class="title-ul">배너 목록</span> <span class="banner-add">
									배너 추가</span>
							</p>
							<form action="" method="post" id="banner-form" class="banner-form">
							<!-- 배너 목록 -->
							</form>
							<div class="btn_s">
								<button id="cancle" type="reset">취소</button>
								<button id="btn" type="submit">등록하기</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<script type="text/javascript">
		var count = 0;

		//버튼 누를때마다 input추가
		$(".banner-add").click(
			function() {
				var $banner = $('<div class="banner-label"><input type="file"><span class="del" id="btn" style="cursor:pointer;">삭제</span></div>');
				var bannerForm = document.getElementById("banner-form");
				var bannerCount = bannerForm.childElementCount+1;

				if( bannerCount <= 10){
					$("#banner-form").append($banner);
				}else{
					alert("배너는 10개까지만 가능합니다!");
					}
			});

		$(function() {
			//배너 추가 라벨 삭제
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