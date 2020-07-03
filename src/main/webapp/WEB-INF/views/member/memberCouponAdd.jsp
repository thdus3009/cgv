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
								<li><a href="../member/memberCoupon">CGV 할인 쿠폰<i></i></a></li>
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
							<button class="message-reserve" onClick="location.href='../member/memberCoupon'">
								<span>CGV 할인쿠폰 내역조회</span>
							</button>
						</div>
						<div>
							<h4 class="coupon-h4">CGV 할인쿠폰 등록</h4>
							<div>
								<p class="coupon-num-bar">
									<strong>소지하신 CGV 할인쿠폰 등록하기</strong> <span>CGV 할인쿠폰 번호를
										입력해 주세요.</span>
								</p>
								<form action="" method="get" class="coupon-pwd-form">
									<label> <span>CGV 할인쿠폰 번호</span> <input type="text"
										class="coupon-num-input">
									</label>
									<button class="red-btn">
										<span>등록하기</span>
									</button>
								</form>
							</div>
							<div class="coupon-notice">
								<div>
									<em class="coupon-em">이용안내</em>
									<div>
										<ul class="coupon-notice-ul">
											<li>등록하신 쿠폰은 홈페이지 예매 시, 결제수단 &gt; 할인/무료/포인트 &gt;
												CGV할인쿠폰에서 사용 가능합니다.</li>
											<li>특정 영화/극장 전용 쿠폰일 경우, 지정 영화 및 극장에서 명시된 사용기간 내에만 사용이 가능
												합니다.</li>
											<li>온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.</li>
											<li>영화 예매 시에는 다른 결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이
												가능합니다.</li>
											<li>CGV홈페이지 예매 후 예매취소는 CGV홈페이지에서 상영시간 20분 전까지 가능합니다.</li>
											<li>취소 시 현금 환불은 되지 않으며, 기존 쿠폰으로 유효기간 중에 재사용 하실 수 있습니다.</li>
											<li>기타 할인쿠폰에 대한 문의사항이 있으실 경우, 1544-1122 또는 홈페이지를 이용해 주시기
												바랍니다.</li>
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

			//할인쿠폰 등록
			$(".red-btn").click(function(e){
				// 쿠폰번호를 입력하지 않았을 때
				if($(".coupon-num-input").val() == ""){
					alert("CGV 할인쿠폰 번호를 정상적으로 입력해 주세요.");
					e.preventDefault();
				// 지정된 쿠폰 자릿수보다 적을때
				}else if($(".coupon-num-input").val().length <= 14){
					alert("쿠폰 번호 자리수를 확인해주세요.");
					e.preventDefault();
				// 자릿수는 맞지만 정보가 존재하지 않을 때, 존재할 경우
				}else{
					//ajax
					$.ajax({
						url:"./",
						type:"post",
						data: "num"+$(".coupon-num-input").val(),
						success:function(result){
							alert("등록되었습니다!");
						},
						error:function(){
							alert("입력하신 정보는 존재하지 않는 CGV 할인쿠폰 정보입니다. 확인 후 다시 등록해 주세요.");
						}
					}
				});
				}
			});
			
			
		</script>
</body>
</html>