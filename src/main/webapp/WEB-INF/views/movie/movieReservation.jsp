<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieReservation.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/movie/movieSeatReservation.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/moviePayment.css" rel="stylesheet" type="text/css">

<!-- payment -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
					<div class="step step1" style="height: 595px; display: block;">
					
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
												<li class="rating-${list.ageLimit}" data-index="${list.num}" data-age_limit="${list.ageLimit}" data-title="${list.title}">
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
												<li class="selected" data-index="0" data-local="서울">
													<a>
														<span class="name">서울</span>
														<span class="count">(30)</span>
													</a>
													
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>
													</div>		
												</li>
												<li class="" data-index="0" data-local="경기">
													<a>
														<span class="name">경기</span>
														<span class="count">(46)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="인천">
													<a>
														<span class="name">인천</span>
														<span class="count">(9)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>
													</div>		
												</li>
												<li class="" data-index="0" data-local="강원">
													<a>
														<span class="name">강원</span>
														<span class="count">(4)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>
													</div>		
												</li>
												<li class="" data-index="0" data-local="대전/충청">
													<a>
														<span class="name">대전/충청</span>
														<span class="count">(19)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="대구">
													<a>
														<span class="name">대구</span>
														<span class="count">(9)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="부산/울산">
													<a>
														<span class="name">부산/울산</span>
														<span class="count">(14)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="경상">
													<a>
														<span class="name">경상</span>
														<span class="count">(15)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="광주/전라/제주">
													<a>
														<span class="name">광주/전라/제주</span>
														<span class="count">(22)</span>
													</a>
													<div id="cinema_ajax" class="area_theater_list nano has-scrollbar has-scrollbar-y" style="width: 109px">
														<ul class="content scroll-y" >
																
																<!-- 여기에 극장값 추가 li append -->
																
														</ul>
														<div class="pane pane-y">
															<div class="slider slider-y"></div>
														</div>	
													</div>		
												</li>
												<li class="" data-index="0" data-local="">
													<a>
														<span class="name"></span>
														<span class="count">&nbsp;</span>
													</a>
												</li>
												<li class="" data-index="0" data-local="">
													<a>
														<span class="name"></span>
														<span class="count">&nbsp;</span>
													</a>
												</li>
											</ul>
											<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
												<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
											</div>
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
												<a href="#" onclick="return false;">
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
									
										<!-- js로 추가 -->
										
									</div>
								</div>
							</div>
						</div>
						
					</div>
					
					<div class="step step2" style="display: none;">
					</div>
					
					<div class="step step3" style="display: none;">
					</div>
					
					<div class="step step4" style="display: none;">
					</div>
					
					
					
					
				</div>			
			</div>
		
		</div>
		
		<!-- url : ../reservation/seatReservation -->
		<form action="" id="data-from" method="post">
			<input type="hidden" id="movieNum" name="movieNum" value="">
			<input type="hidden" id="movieTimeNum" name="movieTimeNum" value="">
			<input type="hidden" id="cinemaName" name="cinemaName" value="">
			<input type="hidden" id="theaterName" name="theaterName" value="">
			<input type="hidden" id="filmType" name="filmType" value="">
			
			<input type="hidden" id="seatCount" name="seatCount" value="">
			
			<input type="hidden" id="sDate" value="">
		</form>
		
		
		
		<!-- 선택내용 출력,좌선선택 페이지로 이동버튼 출력부분 -->
		<div class="ticket_tnb">
			<div id="ticket_tnb" class="tnb_container ">    
				<div class="tnb step1">  
					<a class="btn-left" href="#" onclick="return false;" title="영화선택" style="display: none;">이전단계로 이동</a>
				
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
							<span id="select_movieType" class="data ellipsis-line1" title="2D"></span>
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
							<span id="select_theater" class="data" title=""></span>
						</div>
						<div class="row number" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
						<div class="placeholder" title="극장선택" ></div> <!-- style="display: none;" -->
					</div>
					
					
					<div class="info seat" style="display: none;">
						<div class="row seat_name" style="height: 20px;">
							<span class="header">좌석명</span>
							<span id="select_seat_grade" class="data" title=""></span>
						</div>
						<div class="row seat_no colspan3">
							<span class="header">좌석번호</span>
							<span id="select_Seat" class="data ellipsis-line3" title=""></span>
						</div>
						<div class="placeholder" title="좌석선택" style="display: none;"></div>
					</div>
					
					
					<div class="info payment-ticket" style="width: 155px; display: none;">
						<div class="row payment-adult" style="display: none;">
							<span class="header">일반</span>
							<span class="data"><span class="price"></span></span>
						</div>
						<div class="row payment-youth" style="display: none;">
							<span class="header">청소년</span>
							<span class="data"><span class="price"></span></span>
						</div>
						<div class="row payment-special" style="display: none;">
							<span class="header">우대</span>
							<span class="data"><span class="price"></span></span>
						</div>
						<div class="row payment-final" style="display: none;">
							<span class="header">총금액</span>
							<span class="data"><span class="price" title=""></span><span class="won">원</span></span>
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

<script type="text/javascript" src="../js/movie/movieReservation.js"></script>

<script type="text/javascript">
    var list = [];
    
    <c:forEach items="${cinemaList}" var="vo">
       var cinemaVO = {
             name: `${vo.name}`,
             local:	`${vo.local}`
       };
       
       list.push(cinemaVO);   
    </c:forEach>

// 	console.log("size: "+list.length);
// 	console.log("a : "+list[0].name);
	
	for(i=0;i<list.length;i++){
// 		console.log(list[i].name+" "+list[i].local);
		$(".theater-area-list > ul > li").each(function(){

// 			console.log("읽어온값 : "+i+" "+ list[i].local);
// 			console.log("폼 값 : "+$(this).data("local"));
			
			if(list[i].local == $(this).data("local")){
				console.log(list[i].name+" "+list[i].local);
				$(this).find(".content").append('<li class="" data-theater="'+ list[i].name+'"><a href="#" onclick="return false;">'+list[i].name+'<span class="sreader"></span></a></li>');
			}
			
// 			console.log("==================================");
			
		});
	}




</script>




</body>
</html>





















