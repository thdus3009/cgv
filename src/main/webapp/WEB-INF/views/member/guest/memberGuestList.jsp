<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../../css/layout.css" rel="stylesheet" type="text/css">
<link href="../../css/member/memberGuest.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/template/common.js"></script>
	<!--  -->

<!-- 비회원 예매내역 확인 -->

<title>나의 예매내역 | 영화 그 이상의 감동. CGV</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -------------------------------------------------------------------------------------->
		<c:import url="../../template/header.jsp"></c:import>

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
									<li class="on"><a href="">예매확인/취소<i></i></a></li>
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
							<div class="top-bar">
								<h4>MY(비회원) 예매내역</h4>
								<p>비회원으로 예매시 상영일 기준 2일 간의 예매 내역만 조회하실 수 있습니다.</p>
							</div>

							<!-- 반복 -->
							<div class="lst-item">

								<!-- 예매번호 -->
								<!-- 고객님의 최근 예매내역이 존재하지 않습니다 -->
								<div class="reserve-num">
									<span>예매번호</span><strong id="reservationNum">${reservationVO.num}</strong>
								</div>

								<div class="reserve-info">

									<!-- 영화 정보 -->
									<div class="movie-info">
										<img alt="영화 포스터" src="" onclick="location.href=''">
										<ul class="movie-info-ul">
											<li><a href="">${reservationVO.movieInfoVO.title}</a></li>
											<li><p>관람극장</p> <strong>CGV ${reservationVO.cinemaName}</strong></li>
											<li><p>관람일시</p> <strong style="color: #e71a0f;" class="dateForm">${reservationVO.movieTimeVO.screenDate}</strong></li>
											<li><p>상영관</p> <strong>${reservationVO.theaterName}</strong></li>
											<li><p>관람인원</p> <strong id="person"></strong></li>
											<li><p>관람좌석</p> <strong>${reservationVO.seats}</strong></li>
											<li><p>매수</p> <strong>1매</strong></li>
										</ul>
									</div>

									<!-- 결제 정보 -->
									<div class="payment-info">
										<ul class="payment-info-ul">
											<li><span>결제 날짜</span><strong class="dateForm">${reservationVO.createAt}</strong></li>
											<li><span>신용카드</span><strong class="price">${reservationVO.totalPrice} 원</strong></li>
											<li><span>총 결제금액</span><strong class="price">${reservationVO.totalPrice} 원</strong></li>
										</ul>
									</div>

									<!-- 버튼 -->
									<button class="cancle-btn" type="submit">
										<span>예매취소</span>
									</button>

								</div>

							</div>

							<!-- 취소 내역 -->
							<!-- 고객님의 최근 취소내역이 존재하지 않습니다 -->
							<div class="cancle-table">
								<div class="top-bar">
									<h4>MY 취소내역</h4>
									<span>상영일 기준 지난 7일 동안의 취소내역입니다.</span>
								</div>
								<table class="member-table">
									<thead class="member-thead">
										<tr class="member-tr">
											<th>관람 영화</th>
											<th>관람 CGV</th>
											<th>관람 일시</th>
											<th>취소 일시</th>
											<th>결제취소 금액</th>
										</tr>
									</thead>
									<tbody>
										<!-- 반복  -->
										<tr class="member-td">
											<td>어쩌고</td>
											<td>어쩌고</td>
											<td>어쩌고</td>
											<td>어쩌고</td>
											<td>어쩌고 원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../../template/sidebar.jsp"></c:import>
	</div>

	<script type="text/javascript">

		//관람 인원 데이터 폼 변경
		var common = ${reservationVO.common};
		var teenager = ${reservationVO.teenager};
		var preference = ${reservationVO.preference};
		var personList = [];
		
		if(common>0){
			personList.push("일반 "+ common);
		}else if(teenager>0){
			personList.push("청소년 "+teenager);
		}else if(preference>0){
			personList.push("우대 " +preference);
		}

		$("#person").text(personList.join(","));
		
		
	
		//날짜 데이터 폼 변경
		$(".dateForm").each(function(){
			var str = $(this).text().replace(/-/gi,".");
			$(this).text(str);
		});
		
		
		//금액 콤마 적용
		$(".price").each(function(){
			$(this).text(addComma($(this).text()));
		});
	
		//예매 취소 
		$(".cancle-btn").click(function() {
			var reservationNum = $("#reservationNum").text();
			if (confirm("예매를 취소하시겠습니까?\n\n인터넷 예매 취소는 상영시간 20분 전까지 가능하며,\n예매가능은 상영시간 30분 전까지 가능합니다.")) {

				$.ajax({
					url:'../reservation/reservationCancle',
					type:'get',
					data :{
						num : reservationNum
					},
					success : function(result){
						alert("예매 취소가 완료되었습니다.");
						location.href="../";
					}
				});
				
			}
		});
	</script>

</body>
</html>