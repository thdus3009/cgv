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
						<div>
							<h4 class="coupon-h4">CGV 이용 / CJ ONE 포인트 적립 및 사용내역</h4>
							<table class="member-table">
								<thead class="member-thead">
									<tr class="member-tr">
										<th>구분</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반복 -->
									<tr class="member-tr">
										<td>CJ ONE 사용가능 포인트</td>
										<td>점</td>
									</tr>
								</tbody>
							</table>
							<p>※ CGV VIP 선정은 이벤트 포인트를 제외한 매표/매점/씨네샵 구매 포인트 합산 기준으로 적용됩니다.</p>
							<p>※ 매표/매점 구매 누적 포인트는 관람 후 2-3일 후에 반영됩니다.</p>
							<p>※ 포인트 조회 시 표시되는 적립일은 VIP 선정기준 적립일이며 CJ ONE 가용일자와 상이할 수 있습니다.</p>
							<p>※ 자세한 포인트 적립 및 사용내역은 CJ ONE에서 확인하시기 바랍니다.[CJ ONE 포인트 조회]</p>
						</div>
						<div>
							<h4 class="coupon-h4">CGV 영화관람권 사용내역</h4>
							<form action="" method="get" class="coupon-form">
								<strong>조회기간</strong> <span> 
								<input type="radio" name="term" class="coupon-term" id="2w">
								<label for="2w" class="term-label2">2주일</label> 
								<input type="radio" name="term" class="coupon-term" id="1m">
								<label for="1m" class="term-label1">1개월</label> 
								<input type="radio" name="term" class="coupon-term" id="3m">
								<label for="3m" class="term-label3">3개월</label> 
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
										<th>구매 구분</th>
										<th>구매 극장</th>
										<th>적립일</th>
										<th>적립</th>
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
										<li>CJ ONE 카드 등록 및 분실신고, 비밀번호 변경 등 자세한 사항은 CJ ONE 홈페이지에서 하실 수 있습니다.</li>
										<li>전체 CJ ONE 포인트 적립 및 사용내역, 보너스 포인트, 선물포인트, 소멸포인트 정보는 CJ ONE 홈페이지에서 조회하실 수 있습니다.</li>
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