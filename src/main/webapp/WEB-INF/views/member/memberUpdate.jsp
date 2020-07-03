<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/member/memberJoin.css"
	rel="stylesheet" type="text/css">
<link href="../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/member/memberMyPage.css" rel="stylesheet"
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
				<div>
					<div class="col_content">
						<!----------------- contents aside -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">MY CGV HOME<i></i></a></li>
									<li><a
										href="./memberUpdate?id=${sessionScope.memberVO.id}">회원정보
											수정<i></i>
									</a></li>
									<li><a href="#" id="memberDelete">회원 탈퇴<i></i></a></li>
									<li><a href="">예매 영화 관리<i></i></a></li>
									<li><a href="../review/reviewList"
										style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
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
						<div class="col_detail">
							<div class="wrap_login" style="padding: 0;">
								<ul class="tab_menu_round">
									<li><a class="lo" href="#">회원정보 수정</a></li>
								</ul>
								<div class="box_login" style="padding-left: 250px;">
									<form class="box_form" action="./memberUpdate" id="frm"
										method="post">
										<fieldset>
											<div class="login_input">
												<h2>아이디</h2>
												<input id="userID" class="id check" type="text"
													style="display: inline-block;" name="id" readonly="true"
													value="${memberVO.id}">
												<!-- <button id="idCheck" type="button" style="display: inline-block; color:#ffffff; height:38px; width: 85px; margin-top: 0px;margin-right: 200px;">중복체크</button> -->
												<p id="idc"></p>

												<h2>비밀번호</h2>
												<input id="userPWD" class="check" type="password"
													required="required">
												<p id="pwd1c"></p>

												<h2>비밀번호 재확인</h2>
												<input id="userPWD2" class="check" type="password"
													style="display: inline-block;" name="pwd"
													required="required">
												<!-- 								<button type="button" style="display: inline-block; color:#ffffff; height:38px; width: 85px; margin-top: 0px;margin-right: 200px;">확인</button> -->
												<p id="pwd2c"></p>


												<h2>이름</h2>
												<input id="name" class="text check" type="text" name="name"
													value="${memberVO.name}" style="background-color: #fdfcf0;">

												<h2>생년월일</h2>
												<div class="ymd">
													<input id="ch_year" class="text year check" type="text"
														placeholder="년(4자리)" maxlength="4" name="year"
														style="background-color: #fdfcf0;"> <select
														id="ch_month" class="month check" name="month" style="background-color: #fdfcf0;">

													</select> <input id="ch_date" class="text day check" type="text"
														placeholder="일" maxlength="2" name="day"
														style="background-color: #fdfcf0;">
												</div>
												<p id="birthc"></p>

												<h2>전화번호</h2>
												<input id="phone" class="text check" type="text"
													placeholder="' - ' 없이 입력해 주세요" maxlength="11" name="phone"
													value="${memberVO.phone}"
													style="background-color: #fdfcf0;">

												<h2>이메일</h2>
												<input id="email" class="check" type="email"
													placeholder="선택입력" name="email" value="${memberVO.email}"
													style="background-color: #fdfcf0;">
											</div>

										</fieldset>
										<button id="btn" type="submit" style="top: 10px;">
											<span>수정</span>
										</button>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 푸터 -------------------------------------------------------------------------------------->
			<c:import url="../template/footer.jsp"></c:import>

			<!-- 사이드바 ---------------------------------------------------------------------------------------------->
			<c:import url="../template/sidebar.jsp"></c:import>
		</div>

		<script type="text/javascript">
			//회원 탈퇴 알림창
			$("#memberDelete").click(function() {
				var check = confirm("회원 탈퇴하시겠습니까?");

				if (check) {
					location.href = "./memberDelete?id=${memberVO.id}";
				}
			});

			//정보 수정 팝업창
			$("#go_edit_page")
					.click(
							function() {
								window
										.open("memberPopUpEdit.jsp",
												"마이페이지 - 정보수정",
												"width = 700, height = 565, top=100, left 200, locations = no");
							});

			//자주가는 CGV 팝업창
			$("#go_edit_page")
					.click(
							function() {
								window
										.open("memberPopUpEdit.jsp",
												"마이페이지 - 정보수정",
												"width = 700, height = 565, top=100, left 200, locations = no");
							});

			//안됨빡친다
			$(".cancle-reserve")
					.click(
							function(e) {
								e.preventdefault();
								alert("e.preventdefault()");
								e.preventdefault();
								if (confirm("예매를 취소하시겠습니까? \n\n※인터넷 예매 취소는 상영시간 20분 전까지 가능하며, \n예매 가능은 상영시간 30분 전까지 가능합니다.")) {

								}
							});
		</script>
</body>
</html>