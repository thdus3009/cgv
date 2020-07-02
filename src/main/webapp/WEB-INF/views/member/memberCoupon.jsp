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

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
								<li><a href="../review/reviewList" style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
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
						<div class="tit-mycgv">CGV 할인쿠폰 내역</div>
						<div class="set-btn">
							<button class="message-reserve" onClick="location.href='../member/memberCouponAdd'">
								<span>CGV 할인쿠폰 등록</span>
							</button>
						</div>
						<div>
							<h4 class="coupon-h4">CGV 할인쿠폰 보유(등록) 내역</h4>
							<table class="member-table">
								<thead class="member-thead">
									<tr class="member-tr">
										<th>쿠폰이름</th>
										<th>사용기간</th>
										<th>쿠폰 번호</th>
										<th>쿠폰정보</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반복 -->
									<tr class="member-tr">
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
								<strong>조회기간</strong> <span> 
								<label class="coupon-term" id="2w"><input type="radio" name="term">2주일</label> 
								<label class="coupon-term" id="1m"><input type="radio" name="term">1개월</label> 
								<label class="coupon-term" id="3m"><input type="radio" name="term">3개월</label> 
								<span class="coupon-3m">3개월 이전의 내역은 자동 삭제됩니다.</span>
								</span>
								<p class="data-p">
									<input type="text" id="datepicker1" readonly="readonly"> ~ 
									<input type="text" id="datepicker2" readonly="readonly">
									<button class="message-reserve" type="submit">
										<span>조회하기</span>
									</button>
								</p>
							</form>
						</div>
						<div>
							<table class="member-table">
								<thead class="member-thead">
									<tr class="member-tr">
										<th>쿠폰이름</th>
										<th>쿠폰번호</th>
										<th>사용일</th>
										<th>관람극장</th>
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
						<div class="coupon-notice">
							<div>
								<em class="coupon-em">이용안내</em>
								<div>
									<ul class="coupon-notice-ul">
										<li>등록하신 쿠폰은 홈페이지 예매 시, 결제수단 &gt; 할인/무료/ 포인트 &gt; 할인쿠폰에서
											사용 가능합니다.</li>
										<li>특정 영화/극장 전용 쿠폰일 경우, 지정 영화 및 극장에서 명시된 사용기간 내에만 사용이
											가능합니다.</li>
										<li>온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.</li>
										<li>영화 예매 시에는 다른 결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이
											가능합니다.</li>
										<li>CGV홈페이지 예매 후 예매취소는 CGV홈페이지에서 상영시간 20분 전까지 가능합니다.</li>
										<li>취소 시 현금 환불은 되지 않으며,기존 쿠폰으로 유효기간 중에서 재 사용하실 수 있습니다.</li>
										<li>유효기간이 경과한 미사용 쿠폰(관람권)의 경우, 지난 3개월 내역만 보유(등록)내역에서 확인하실
											수 있습니다.</li>
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

		//datepicker 지정
		$.datepicker.setDefaults({
       		dateFormat: 'yy-mm-dd' //Input Display Format 변경
       		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트             
        });
		
		//datepicker 지정
		$("#datepicker1").datepicker();                    
        $("#datepicker2").datepicker();
        
		//datepicker 초기값 설정
		$('#datepicker2').datepicker('setDate', 'today');
        $('#datepicker1').datepicker('setDate', '-3M'); 

		//기간 버튼 선택시 input data값 변경
		$("#2w").click(function(){
	        $('#datepicker1').datepicker('setDate', '-2W'); 
		});

		$("#1m").click(function(){
	        $('#datepicker1').datepicker('setDate', '-1M'); 
		});

		$("#3m").click(function(){
	        $('#datepicker1').datepicker('setDate', '-3M'); 
		});
	</script>



</body>
</html>