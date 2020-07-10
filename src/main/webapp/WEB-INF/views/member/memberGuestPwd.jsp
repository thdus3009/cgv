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
	href="${pageContext.request.contextPath}/css/member/memberGuest.css"
	rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 비회원 예매확인 -->
<title>비회원 비밀번호찾기 &lt;  비회원예매 | 영화 그 이상의 감동. CGV</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -------------------------------------------------------------------------------------->
		<c:import url="../template/header.jsp"></c:import>
		<!-- 컨테이너 -------------------------------------------------------------------------------------->
		<div class="container" style="height: 900px;">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="./login">회원 서비스</a></li>
						<li class="last">로그인</li>
					</ul>
				</div>
			</div>

			<div class="contents">
				<div class="wrap_login">
					<ul class="tab_menu_round">
						<li><a class="lo" href="./login">비밀번호 찾기</a></li>
					</ul>


					<div class="guest_guide">
						<div class="guest_guide-box">
							<h3>비회원 비밀번호 찾기</h3>
							<p>비회원 예매 시 입력한 개인정보 입력 후, [인증번호 받기]를 눌러 휴대폰으로 전송 받으신 인증번호를 입력해주세요.</p>
							<div class="guest-box">
								<div class="guest-chk">
									<strong class="g-title">개인정보입력</strong>
									<form action="" method="post" enctype="" class="guest-form" style="width: 858px;">
										<table style="width: 100%;">
											<caption>모든 항목이 필수 입력사항입니다.</caption>
											<tr class="tr-box">
												<th>법정생년월일<br>(6자리)
												</th>
												<td><input type="text" class="input-box birthday"
													maxlength="6"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<span style="font-size: 20px;">- ******</span></td>
											</tr>
											<tr class="tr-box phone">
												<th>휴대폰번호</th>
												<td><select class="input-box">
														<option>010</option>
														<option>011</option>
														<option>016</option>
														<option>017</option>
														<option>018</option>
														<option>019</option>
												</select> - <input type="text" class="input-box phone-front"
													style="width: 75px;" maxlength="4"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													- <input type="text"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
													class="input-box phone-back" style="width: 75px;"
													maxlength="4">
													<button class="num-chk">인증번호 받기</button>
													</td>
											</tr>
											<tr class="tr-box">
												<th>인증번호(4자리)</th>
												<td><input type="text" class="input-box pwd"
													maxlength="4"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
											</tr>
										</table>
										<div style="display: flex; justify-content: center;">
											<button type="reset" class="again">개인정보 다시입력</button>
											<button type="button" class="red-btn">비밀번호 찾기</button>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="coupon-notice">
							<div style="background-color: #f9f7ec;">
								<em class="coupon-em">이용안내</em>
								<div>
									<ul class="coupon-notice-ul">
										<li>CGV 고객센터 : 1544-1122</li>
										<li>상담 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동 응답 안내 가능)</li>
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

	<!-- 스크립트 -->
	<script type="text/javascript">
		//유효성 검사
		$(".red-btn").click(function() {
			if ($(".birthday").val() == '') {
				alert("법정생년월일(6자리)를 입력해주세요!");
			} else if ($(".phone-front").val() == '') {
				alert("핸드폰번호 앞자리를 입력해주세요!");

			} else if ($(".phone-back").val() == '') {
				alert("핸드폰번호 뒷자리를 입력해주세요!");

			} else if ($(".pwd").val() == '') {
				alert("비밀번호를 입력해주세요!");

			} else {
				//ajax
				$.ajax({
					url : '',
					type : 'post',
					data : {},
					dataType : '',
					done : function(response) {
						//정보 alert창으로..?
						alert("비밀번호");
					},
					fail : function(error) {
						//입력하신 정보와 일치하는내용 X
						alert("입력하신 정보와 일치하는 예매내역이 없습니다.");
					}
				});
			}
		});
	</script>

</body>
</html>