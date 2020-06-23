<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/Admin/AdminNoticeList.css" rel="stylesheet"
	type="text/css">
<link href="../css/member/memberMyPage.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="root">

		<!-- 헤더 -->
		<c:import url="../template/header.jsp"></c:import>

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
							<div class="top-bar">회원 관리</div>

							<form action="" method="POST" class="member-info">
								<ul>
									<li>
										<p class="what">프로필사진</p> <img src="test.jpg" alt="프로필 사진"
										class="profile-pic"> <span class="del-pic">X</span>
										<div>
											<p class="con">jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
											<input type="file">
										</div>
									</li>
									<li>
										<p class="what">아이디uid</p> <input type="text"
										class="input-text" value="">
									</li>
									<li>
										<p class="what">pwd</p> <input type="text" class="input-text"
										value="">
									</li>
									<li>
										<p class="what">name</p> <input type="text" class="input-text"
										value="">
									</li>
									<li>
										<p class="what">nick</p> <input type="text" class="input-text"
										value="">
									</li>
									<li>
										<p class="what">phone</p> <input type="text"
										class="input-text" value="">
									</li>
									<li>
										<p class="what">email</p> <input type="text"
										class="input-text" value="">
									</li>
									<li>
										<p class="what">age</p> <input type="number"
										class="input-text" value="">
									</li>
									<li>
										<p class="what">birth</p> <input type="date"
										class="input-text" value="">
									</li>
									<li>
										<p class="what">gender</p> <label class="label"> <input
											type="radio" name="gender">남
									</label> <label class="label"> <input type="radio"
											name="gender">여
									</label>
									</li>
									<li>
										<p class="what">enabled</p> <label class="label"> <input
											type="radio" name="enabled">가능
									</label> <label class="label"> <input type="radio"
											name="enabled">불가능
									</label>
									</li>
								</ul>
							</form>

							<div>
								예매내역
								<table class="memberList-bar">
									<tr>
										<td>번호</td>
										<td>영화제목</td>
										<td>관람일시</td>
										<td>관람인수</td>
										<td>관람장소</td>
										<td>가격</td>
									</tr>
								</table>
								<!--반복-->
								<table>
									<tr>
										<td>번호</td>
										<td>영화제목</td>
										<td>관람일시</td>
										<td>관람인수</td>
										<td>관람장소</td>
										<td>가격</td>
									</tr>
								</table>
							</div>

							<div class="button-bar">
								<button type="button" class="cancle">취소</button>
								<button type="submit" class="del">회원삭제</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>


	<!-- 스크립트 -->
	<script type="text/javascript"></script>
</body>
</html>