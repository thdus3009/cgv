<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<div class="col_content">
					<!-- 사이드바 -->
					<div class="col_aside">
						<!-- 메뉴 -->
						<div class="snb">
							<ul>
								<li class="on"><a href="">MY CGV HOME<i></i></a></li>
								<li><a href="#" id="memberDelete">CGV 할인 쿠폰<i></i></a></li>
								<li><a href="./memberUpdate?id=${sessionScope.memberVO.id}">회원정보
										수정<i></i>
								</a></li>
								<li><a href="#" id="memberDelete">회원 탈퇴<i></i></a></li>
								<li><a href="">예매 영화 관리<i></i></a></li>
								<li><a href="../review/reviewList"
									style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
							</ul>
						</div>
						<!-- 광고 -->
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

					<!--contents detail -->
					<div class="col_detail">
						<div class="tit-mycgv">관람권/할인쿠폰 관리</div>
						<div class="set-btn">
							<button class="message-reserve"><span>CGV 영화관람권/할인쿠폰 등록</span></button>
						</div>
						<div>
							<h4 class="coupon-h4">CGV 영화관람권 보유(등록) 내역</h4>
							<table class="member-table">
								<thead class="member-thead">
									<tr class="member-tr">
										<th>관람권(번호)</th>
										<th>분류</th>
										<th>유효기간</th>
										<th>설명</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반복 -->
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div>
							<h4 class="coupon-h4">CGV 영화관람권 사용내역</h4>
							<form action="" method="get" class="coupon-form">
								<strong>조회기간</strong> 
								<span>
									<button class="coupon-term">2주일</button>
									<button class="coupon-term">1개월</button>
									<button class="coupon-term">3개월</button> 
									<span class="coupon-3m">3개월 이전의 내역은 자동 삭제됩니다.</span>
								</span>
								<p class="data-p">
									<input type="date">
									~ <input type="date">
									<button class="message-reserve"><span>조회하기</span></button>
								</p>
							</form>
						</div>
						<div>
							<table class="member-table">
								<thead class="member-thead">
									<tr class="member-tr">
										<th>관람권 이름</th>
										<th>영화관람권 번호</th>
										<th>분류</th>
										<th>기타</th>
										<th>상태</th>
										<th>사용일</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반복 -->
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="coupon-notice">
							<div>
								<em class="coupon-em">이용안내</em>
								<div>
									<ul class="coupon-notice-ul">
										<li>CGV 영화관람권은 금액권이 아닙니다. (조조영화/청소년 관람 시 차액환급 불가)</li>
										<li>CGV 영화관람권 이용 시 추가금액 결제 후 특별관 영화 관람은 불가합니다.</li>
										<li>특정영화 관람권일 경우, 지정영화 상영기간 또는 사용기간 중에만 사용이 가능 합니다.</li>
										<li>CGV극장 현장 매표소와 CGV홈페이지 인터넷 예매 시 사용 가능하며, 스크래치 부분을 개봉
											또는 훼손 시 현장 사용이<br>불가능합니다.
										</li>
									</ul>
									<p></p>
									<ul class="coupon-notice-ul">
										<li>영화 예매 시에는 다른 결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이
											가능합니다.<br>(단, 2매 이상 구매하실 경우에 한합니다. 2장 예매 시 1매는 영화예매권으로
											결제, 다른 1장은 타 결제수단으로 결제)
										</li>
										<li>CGV홈페이지 예매 후 예매취소는 CGV홈페이지에서 상영시간 20분 전까지 가능합니다.</li>
										<li>취소 시 현금 환불은 되지 않으며, 기존 CGV 영화관람권으로 사용기간 중에 재사용 하실 수
											있습니다.<br>(단, 현장취소 시 기존의 CGV 영화관람권으로 재사용이 가능하며, 현장 구매 티켓은
											환불이 불가능하며 현장 교환만 가능합니다.)
										</li>
									</ul>
									<p></p>
									<ul class="coupon-notice-ul">
										<li><strong>CGV 영화관람권은 현금으로 환불이 되지 않습니다.</strong></li>
										<li>CGV 일반관에서 상영하는 영화의 입장권 1매로 교환하실 수 있습니다.<br>(Gold
											Class, Euro Class, Sweet Box, STARIUM, Kidsplex, CINE de
											CHEF, IMAX , V-seat 상영관 이용관 이용불가 및 3D, 4D 영화 제외)
										</li>
										<li>CGV 영화관람권으로 예매 시, 포인트 적립은 되지 않습니다.</li>
										<li><strong>CGV 영화관람권 앞면에 기재된 사용기한까지(관람일 기준)
												사용하실 수 있습니다.</strong></li>
										<li>유효기간이 경과한 미사용 쿠폰(관람권)의 경우, 지난 3개월 내역만 보유(등록)내역에서 확인하실
											수 있습니다.</li>
										<li>기타 문의사항이 있으실 경우, 1544-1122 또는 홈페이지 고객의 말씀을 통해 문의하여
											주시기 바랍니다.</li>
									</ul>

								</div>
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
	</script>



</body>
</html>