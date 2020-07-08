<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../../css/layout.css" rel="stylesheet" type="text/css">
<link href="../../css/Admin/AdminNoticeList.css" rel="stylesheet" type="text/css">
<link href="../../css/member/memberMyPage.css" rel="stylesheet" type="text/css">
<link href="../../css/admin/theater/theaterAddMod.css" rel="stylesheet" type="text/css">
<link href="../../css/admin/movie/movieAdd.css" rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>영화관등록</title>
</head>
<body>
	<div class="root">

		<!-- 헤더 -->
		<c:import url="../../template/header.jsp"></c:import>

		<!-- 컨테이너 -->
		<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="">MY CGV</a></li>
						<li class="last">ADMIN HOME</li>
					</ul>
				</div>
			</div>


			<div class="contents" style="background-color: #fdfcf0;">
				<div>
					<div class="col_content">

						<!-- 메뉴바 -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">ADMIN HOME<i></i></a></li>
									<li><a href="">회원 관리<i></i></a></li>
									<li><a href="">영화관 관리<i></i></a></li>
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
						<div class="col_detail">
							<form action="" method="post" class="theater-info">
								<ul>
									<li>
										<p class="what">극장사진</p> <img src="" alt=""
										class="theater-pic"> <span class="del-pic">X</span> <input
										type="file">
									</li>
									<li>
										<p class="what">극장명</p> <input type="text" class="input-text">
									</li>
									<li>
										<p class="what">지역명</p> <input type="text" class="input-text">
									</li>
									<li>
										<p class="what">주소</p> <input type="text" class="input-text">
									</li>
									<li>
										<p class="what">전화번호</p> <input type="tel" class="input-text">
									</li>
									<li>
										<p class="what">극장설명</p> <textarea class="input-textarea"></textarea>
									</li>
									<li>
										<p class="what">오시는길</p> <textarea class="input-textarea"></textarea>
									</li>
									<li>
										<p class="what">주차안내</p> <textarea class="input-textarea"></textarea>
									</li>
								</ul>
								<div class="button-bar">
									<button type="button" class="cancle">취소</button>
									<button type="submit" class="mod">수정</button>
									<button type="submit" class="del">삭제</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -->
		<c:import url="../../template/footer.jsp"></c:import>
	</div>


	<!-- 스크립트 -->
	<script type="text/javascript">
		//버튼 누를때마다 input추가
		$(".banner-add")
				.click(
						function() {
							var $banner = $('<div id="banner-label"><input type="file"><span class="del">삭제</span></div>');
							$(".banner-form").append($banner);
						});

		//배너 추가 라벨 삭제
		$(function() {
			$(".banner-form").on("click", "span", function() {
				$(this).parent().remove();
			});
		});
	</script>
</body>
</html>