<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbsLayout.css" rel="stylesheet"
	type="text/css">
<link href="../css/layout.css" rel="stylesheet"
	type="text/css">

<link href="../css/myPage.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -------------------------------------------------------------------------------------->
		<c:import url="../template/header.jsp"></c:import>

		<!-- 컨테이너 -------------------------------------------------------------------------------------->

		<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="">MY CGV</a></li>
						<li class="last">MY CGV HOME</li>
					</ul>
				</div>
			</div>
			

			<div class="contents">
				<div class="sect-common">
				<div class="mycgv-info-wrap">
					<div class="sect-person-info">
						<div class="box-image">
							<span class="thumb-image"> 
							<img alt="" src="../images/myPage/default_profile.gif"> <span class="profile-mask"></span>
							</span>
						</div>
						<div class="box-contents">
							<div class="person-info1">
								<strong>${memberVO.name } 님</strong> <em>(${memberVO.id })</em>
							</div>
							<div class="person-info2">
								<p>전화번호 : ${memberVO.phone }</p>
								<p>생년월일 : ${memberVO.birth }</p>
								<p>E-mail : ${memberVO.email }</p>
							</div>
						</div>
					</div>
					

					<div class="sect-movie-info">
						<div class="col-my-coupon">
							<h3>MY COUPON</h3>
							<ul>
								<li>
									<strong>CGV VIP도전</strong>
									<span></span>
								</li>
								<li>
									<strong>CGV 할인쿠폰</strong>
									<span><em>4</em>개</span>
								</li>
								<li>
									<strong>영화관람권</strong>
									<span><em>0</em>개</span>
								</li>
							</ul>
						</div>
						<div class="col-my-movie">
							<!-- 										내가 설정 해야하는 부분 -->
						</div>
						<div class="col-favorite-theater">
							<div class="sect-favorite">
								<ul>
									<li>
										<a href=""><span>1</span>CGV불광</a>
									</li>
									<li>
										<a href=""><span>2</span>CGV상봉</a>
									</li>
									<li>
										<a href=""><span>3</span>CGV홍대</a>
									</li>
									<li>
										<a href=""><span>4</span></a>
									</li>
									<li>
										<a href=""><span>5</span></a>
									</li>
								</ul>
<!-- 								<button class="setting"></button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
				<div>
					<div class="col_content">
						<!----------------- contents aside -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">MY CGV HOME<i></i></a></li>
									<li><a href="./memberUpdate?id=${sessionScope.memberVO.id}">회원정보 수정<i></i></a></li>
									<li><a href="">회원 탈퇴<i></i></a></li>
									<li><a href="">예매 영화 관리<i></i></a></li>
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

						<!------contents detail -->
						<div class="col_detail"></div>

					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>


</body>
</html>