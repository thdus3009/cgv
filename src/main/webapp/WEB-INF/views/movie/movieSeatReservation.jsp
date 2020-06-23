<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieReservation.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieSeatReservation.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	
	<div class="root">
		<c:import url="../template/header.jsp"></c:import>
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">예매</a>
					</li>
					<li class="last">
						<a href="">빠른 예매</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="container">
			<div id="ticket">
				<!-- navigation -->
				<div class="navi">
					<span class="right">
						<a href="#" class="button btn-guide">
							<span>예매가이드</span>
						</a>
						<a href="#" class="button btn-reservation-restart">
							<span>예매 다시하기</span>
						</a>
					</span>
				</div>
				
				<div class="contents">
					<div class="section section-seat three_line">   <!-- dimmed -->
						<div class="col-head">
						</div>	
						<div class="col-body">
							<div class="person-screen">
								<div class="section section-numberofpeople">
									<div class="col-body">
										<div class="numberofpeople-select">
											<div class="group adult" style="display: block;">
												<span class="title">일반</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li><a href="#">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											<div class="group adult" style="display: block;">
												<span class="title">청소년</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li><a href="#">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											<div class="group adult" style="display: block;">
												<span class="title">우대</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li><a href="#">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											
										</div>
									
									</div>
									
									
									
								</div>
								<div class="section section-screen-select">
									<div id="user-select-info">
										<p class="theater-info">
											<span class="site">CGV 홍대</span>
											<span class="screen">1관</span>
											<span class="seatNum">
												남은좌석
												<b class="restNum">86</b>
												/
												<b class="totalNum">153</b>	
											</span>
										</p>
										<p class="playYMD-info">
											<b>2020.06.23</b>
											<b class="exe">(화)</b>
											<b>11:00 ~ 13:01</b>
										</p>
									</div>
								</div>
							</div>
							<div class="theater_minimap">
								<div class="theater nano has-scrollbar">
									<div class="seat-content" style="right: -17px; bottom: -17px;">
										<div class="screen" style="width: 652px;">
											<span class="text"></span>
										</div>
										<div class="seats" style="width: 272px; height: 192px;">
											<c:forEach begin="0" end="11" var="t">
												<div class="row" style="top:${t+(t*16)}px;">
													<div class="label">A</div>
													<div class="seat_group">
														<div class="group"> 
															<c:forEach begin="1" end="10" var="i">
																<div class="seat" style="left:${48+(i*16)}px"> <!--blocked  reserved -->
																	<a href="#">
																		<span class="no">${i}</span>
																		<span class="sreader"></span>
																		<span class="sreader mod"></span>
																	</a>
																</div>
															</c:forEach>
															
														</div>
													</div>
												</div>
												<br>
											</c:forEach>
											
										</div>
									</div>								
								</div>
								<div class="legend" style="width: 110px;">
									<div class="buttons">
										<a class="btn-zoom" href="#" onclick="return false;">크게보기</a>
									</div>
									<div class="seat-icon-desc">
										<span class="icon selected"><span class="icon"></span>선택</span>
										<span class="icon reserved"><span class="icon"></span>예매완료</span>
										<span class="icon notavail"><span class="icon"></span>선택불가</span>
									</div>
									<div class="seat-type">
										<span class="radiobutton type-rating_economy" title="Economy 석" style="">Economy Zone<span class="icon"></span></span>
										<span class="radiobutton type-rating_comfort" title="Standard 석" style="">Standard Zone<span class="icon"></span></span>
										<span class="radiobutton type-rating_prime" title="Prime 석" style="">Prime Zone<span class="icon"></span></span>
									</div>
									
								</div>
							</div>							
							
							
							
						</div>
					</div>
					<a class="btn-refresh" href="#" onclick="return false;"><span>다시하기</span></a>
			
				</div>
				
			</div>
			
		</div>
		
		
		<!--콘텐츠-->
	
		
		
		
		
		<!-- 선택내용 출력,좌선선택 페이지로 이동버튼 출력부분 -->
		<div class="ticket_tnb">
			<div id="ticket_tnb" class="tnb_container ">
				<div class="tnb step1">
					<a class="btn-left" href="#" onclick="return false;" title="영화선택">이전단계로 이동</a>
					
					<div class="info movie">
						<span class="movie_poster">
							<img id="select_image" src="" alt="포스터" style="display: block;"> 			<!-- display: inline; -->
						</span>
						<div class="row movie_title colspan2" style="display: block;">		 <!-- style="display: block;" -->
							<span class="data letter-spacing-min ellipsis-line2">
								<a id="select_title" href="#" target="_blank" title="">라라랜드</a>
							</span>
						</div>
						<div class="row movie_type" style="display: block;"> 						<!-- style="display: block;" -->
							<span id="select_movieType" class="data ellipsis-line1" title="2D">2D</span>
						</div>
						<div class="row movie_rating" style="display: none;"> 					<!-- style="display: block;" -->
							<span id="select_ageLimit" class="data" title="12세 관람가">12세 관람가</span>
						</div>
<!-- 						<div class="placeholder" title="영화선택"></div> style="display: none;" -->
					</div>
					
					<div class="info theater">
						<div class="row name" style="display: block;"> <!-- style="display: block;" -->
							<span class="header">극장</span>
							<span class="data letter-spacing-min ellipsis-line1"><a id="select_cinema" href="#" target="_blank" title="">CGV>홍대</a></span>
						</div>
						<div class="row date" style="display: block;" > <!-- style="display: block;" -->
 							<span class="header">일시</span>
							<span id="select_day" class="data" title="">2020.06.20(수) 11:30</span>
						</div>
						<div class="row screen" style="display: block;"> <!-- style="display: block;" -->
							<span class="header">상영관</span>
							<span id="select_theater" class="data" title="">1관</span>
						</div>
						<div class="row number" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
<!-- 						<div class="placeholder" title="극장선택" ></div> style="display: none;" -->
					</div>
					
					
					<div class="info seat">
						<div class="row seat_name" style="height: 20px;">
							<span class="header">좌석명</span>
							<span class="data" title="Prime석">Prime석</span>
						</div>
						<div class="row seat_no colspan3">
							<span class="header">좌석번호</span>
							<span class="data ellipsis-line3" title="G10,G11">G10,G11</span>
						</div>
						<div class="placeholder" title="좌석선택" style="display: none;"></div>
					</div>
					
					
					<div class="info payment-ticket" style="width: 155px;">
						<div class="row payment-adult" style="display: block;">
							<span class="header">일반</span>
							<span class="data"><span class="price">20,000 원</span></span>
						</div>
						<div class="row payment-youth" style="display: none;">
							<span class="header">청소년</span>
							<span class="data"><span class="price">0 원</span></span>
						</div>
						<div class="row payment-child" style="display: none;">
							<span class="header">어린이</span>
							<span class="data"><span class="price">0 원</span></span>
						</div>						
						<div class="row payment-special" style="display: none;">
							<span class="header">우대</span>
							<span class="data"><span class="price">0 원</span></span>
						</div>
						<div class="row payment-final" style="display: block;">
							<span class="header">총금액</span>
							<span class="data"><span class="price">20,000</span><span class="won">원</span></span>
						<span id="priceMapInfoIco" style="position: absolute; right: -17px; margin-top: 3px; cursor: pointer;"><img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/ico_circle_14.png" height="14" width="14" alt="mappingIco"></span><div id="priceMappingContainer" style="display: none; position: absolute; right: -80px; z-index: 100; width: 150px; height: auto; padding: 10px; background: rgb(51, 51, 51); bottom: 115px;"><span class="typeNm" style="display:inline-block; width:40px;">일반</span> : PRIME X 2<br></div></div>
					</div>
					
					
					
					
					
					<div class="info path">
						<div class="row colspan4">
							<span class="path-step2" title="좌석선택">&nbsp;</span>
							<span class="path-step3" title="결제">&nbsp;</span>
						</div>
					</div>
					
					<a class="btn-right" id="tnb_step_btn_right" title="좌석선택"></a>
				</div>
			</div>
		</div>
		
		
		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/sidebar.jsp"></c:import>
		
		
	</div>
	
	
	
</body>
</html>