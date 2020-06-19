<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieReservation.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
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
						<li>
							<a href="">빠른예매</a>
						</li>
						<li class="last">
							무비차트
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
				
				
				
				
				<!-- container selector -->
				<div class="steps">
					<div class="step step1">
					
						<!-- 영화선택 -->
						<div class="section section-movie">
							<div class="col-head">
								<h3 class="sreader">영화</h3>
							</div>
							<div class="col-body">
								<div class="movie-select">
									
									<!-- 탭 메뉴 -->
									<div class="tabmenu">
										<span class="side on"></span>
										<a href="#" class="button menu1 selected">전체</a>
										<span class="side on"></span>
										<div class="button menu2">
											<div class="underline"></div>
										</div>
									</div>
									
									<!-- 메뉴 (정렬방법 선택) -->
									<div class="sortmenu">
										<a class="button btn-rank selected">예매율순</a>
										<a class="button btn-abc">가나다순</a>
									</div>
									
									
									<!-- 리스트 출력부분 -->
									<div class="movie-list nano">
										<ul id="movie-list-content" class="content scroll-y" style="right: -21px;">
											<c:forEach var="list" items="${list}">
												<li class="rating-${list.ageLimit}" data-index="0" data-age_limit="${list.ageLimit}" data-title="${list.title}">
													<a title="제목" >
														<span class="icon">&nbsp;</span>
														<span class="text">${list.title}</span>
														<span class="sreader"></span>
													</a>
												</li>
											</c:forEach>
											
										</ul>
										
										<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
				<!-- 극장선택 -->
						<div class="section section-theater">
							<div class="col-head">
								<h3 class="sreader">극장</h3>
							</div>
							<div class="col-body">
								<div class="theater-select">
									<div class="tabmenu">
										<span class="side on"></span>
										<a href="#" class="button menu1 selected">전체</a>
										<span class="side on"></span>
										<div class="button menu2">
											<div class="underline"></div>
										</div>
									</div>
									<div class="theater-list nano has-scrollbar has-scrollbar-y">
										<div class="theater-area-list">
											<ul>
												<c:forEach var="cinemaVO" items="${cinemaLocalList}">
													<li class="" data-index="0" data-local="${cinemaVO.local}">
														<a >
															<span class="name">${cinemaVO.local}</span>
															<span class="count">(30)</span>
														</a>
														
													</li>
												</c:forEach>
											</ul>
											<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
												<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
											</div>
										</div>
										<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						
						<!-- 날짜선택 -->
						<div class="section section-date">
							<div class="col-head"></div>
							<div class="col-body" style="height: 560px;">
								<div class="date-list nano has-scrollbar has-scrollbar-y" id="date_list">
									<ul class="content scroll-y" tabindex="-1" style="right: -21px;">
										<li class="month dimmed ">
											<span class="year">${calendarList[0].year}</span>
											<span class="month" data-month="">${calendarList[0].month}</span>
										</li>
										
										<c:forEach var="calendarVO" items="${calendarList}" varStatus="i">
											<c:if test="${calendarVO.date eq 1}">
												<li class="month dimmed">
													<span class="year">${calendarVO.year}</span>
													<span class="month" data-month="${calendarVO.month}">${calendarVO.month}</span>
												</li>
											</c:if>
																						
											<li data-index="0" class="day" data-index="0" data-week="${calendarVO.week}" data-date="${calendarVO.date}" data-month="${calendarVO.month}" data-year="${calendarVO.year}">
												<a href="#">
													<span class="dayweek">${calendarVO.week}</span>
													<span class="day">${calendarVO.date}</span>
													<span class="sreader"></span>
												</a>
											</li>
											
										</c:forEach>
										
									</ul>
									<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 시간선택 -->
						<div class="section section-time">
							<div class="col-head"></div>
							<div class="col-body" style="height: 560px;">
								<div class="time-option">
									<span class="morning">조조</span>
									<span class="night">심야</span>
								</div>
								<!-- 영화,극장,날짜선택 안했을때 -->
								<div class="placeholder">영화, 극장, 날짜를 선택해주세요.</div>
								
								<!-- 영화,극장,날짜선택 되었을때 -->
								<div class="time-list nano has-scrollbar">
									<div class="content scroll-y" tabindex="-1" style="right: -21px;">
										<div class="theater">
											<span class="title">
												<span class="name">2D</span>
												<span class="floor">2관 3층</span>
												<span class="seatcount">(총153석)</span>
											</span>
											<ul>
												<li>
													<a class="button" href="#" title="">
														<span class="time"><span>12:00</span></span>
														<span class="count">92석</span>
														<span class="sreader mod"> 선택불가</span>
													</a>
												</li>
												<li class="disabled">
													<a class="button" href="#" title="">
														<span class="time"><span>12:00</span></span>
														<span class="count">예매종료</span>
														<span class="sreader mod"> 선택불가</span>
													</a>
												</li>
											</ul>
										</div>
										<div class="theater">
											<span class="title">
												<span class="name">2D</span>
												<span class="floor">2관 3층</span>
												<span class="seatcount">(총153석)</span>
											</span>
											<ul>
												<c:forEach begin="1" end="5">
													<li>
													<a class="button" href="#" title="">
														<span class="time"><span>12:00</span></span>
														<span class="count">92석</span>
														<span class="sreader mod"> 선택불가</span>
													</a>
												</li>
												</c:forEach>
												
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>			
			</div>
		
		</div>
		
		
		
		
		<!-- 선택내용 출력,좌선선택 페이지로 이동버튼 출력부분 -->
		<div class="ticket_tnb">
			<div id="ticket_tnb" class="tnb_container ">
				<div class="tnb step1">
					<div class="info movie">
						<span class="movie_poster">
							<img id="select_image" src="" alt="포스터" style="display: none;"> 			<!-- display: inline; -->
						</span>
						<div class="row movie_title colspan2" style="display: none;">		 <!-- style="display: block;" -->
							<span class="data letter-spacing-min ellipsis-line2">
								<a id="select_title" href="#" target="_blank" title=""></a>
							</span>
						</div>
						<div class="row movie_type" style="display: none;"> 						<!-- style="display: block;" -->
							<span class="data ellipsis-line1" title="2D">2D(히어로즈 기획전)</span>
						</div>
						<div class="row movie_rating" style="display: none;"> 					<!-- style="display: block;" -->
							<span id="select_ageLimit" class="data" title="12세 관람가">12세 관람가</span>
						</div>
						<div class="placeholder" title="영화선택"></div> <!-- style="display: none;" -->
					</div>
					
					
					
					<div class="info theater">
						<div class="row name" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">극장</span>
							<span class="data letter-spacing-min ellipsis-line1"><a id="select_cinema" href="#" target="_blank" title=""> </a></span>
						</div>
						<div class="row date" style="display: none;" > <!-- style="display: block;" -->
 							<span class="header">일시</span>
							<span id="select_day" class="data" title=""></span>
						</div>
						<div class="row screen" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">상영관</span>
							<span class="data" title="8관  8층">8관 8층</span>
						</div>
						<div class="row number" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
						<div class="placeholder" title="극장선택" ></div> <!-- style="display: none;" -->
					</div>
					<div class="info path">
						<div class="row colspan4">
							<span class="path-step2" title="좌석선택">&nbsp;</span>
							<span class="path-step3" title="결제">&nbsp;</span>
						</div>
					</div>
					<a class="btn-right on" id="tnb_step_btn_right" href="#" title="좌석선택"></a>
				</div>
			</div>
		</div>






		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>

<script type="text/javascript" src="../js/movie/movieReservation.js"></script>




</body>
</html>





















