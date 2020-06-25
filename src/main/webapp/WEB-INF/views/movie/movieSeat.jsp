<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			
			

			<div class="contents">
					<div class="section section-seat three_line">   <!-- dimmed -->
						<div class="col-head">
						</div>	
						<div class="col-body">
							<div class="person-screen">
								<div class="section section-numberofpeople">
									<div class="col-body">
										<div class="numberofpeople-select">
											<div class="group adult common" style="display: block;">
												<span class="title">일반</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li data-index="${i}"><a href="#" onclick="return false;">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											<div class="group adult teenager" style="display: block;">
												<span class="title">청소년</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li data-index="${i}"><a href="#" onclick="return false;">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											<div class="group adult preference" style="display: block;">
												<span class="title">우대</span>
												<ul class="person-num">
													<c:forEach begin="0" end="8" var="i">
														<li data-index="${i}"><a href="#" onclick="return false;">${i}</a></li>	
													</c:forEach>
												</ul>
											</div>
											
										</div>
									
									</div>
									
									
									
								</div>
								<div class="section section-screen-select">
									<div id="user-select-info">
										<p class="theater-info">
											<span class="site">CGV ${reservationVO.cinemaName}</span>
											<span class="screen">${reservationVO.theaterName}</span>
											<span class="seatNum">
												남은좌석
												<b class="restNum">${movieTimeVO.remainSeat}</b>
												/
												<b class="totalNum">${seatCount}</b>	
											</span>
										</p>
										<p class="playYMD-info">
											<b>${movieTimeVO.screenDate}</b>
											<b class="exe">(화)</b>
											<b>${movieTimeVO.screenTime} ~ ${endTime}</b>
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
											<c:forEach begin="0" end="${maxRow-1}" var="t">
												<div class="row" style="top:${t+(t*16)}px;">
													<div class="label">${t+1}</div>
													<div class="seat_group" data-seat-group="">
														<div class="group"> 
															<c:forEach begin="1" end="${maxCol}" var="i" >
																<!--blocked(선택불가)  reserved(이미 예매)  -->
																<!-- rating_economy(노랑) rating_comfort(초록) rating_prime(빨강)  -->
																
																<div class="seat" style="left:${48+(i*16)}px" data-row="${t+1}" data-col="${i}"> 
																	<a href="#" onclick="return false;"> 
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
	
	<script type="text/javascript" src="/js/movie/movieSeatReservation.js"></script>

	
	
	
<script type="text/javascript">

	var list = [];


	<c:forEach items="${seatList}" var="vo">
	var seatVO = {
	      num: `${vo.num}`,
	      theaterNum:	`${vo.theaterNum}`,
	      rowIdx :	`${vo.rowIdx}`,
	      colIdx :	`${vo.colIdx}`,
	      grade:	`${vo.grade}`,
	      bNum : 	`${vo.seatBookingVO.num}`,
	      movieNum : 	`${vo.seatBookingVO.movieNum}`,
	      reservationNum : 	`${vo.seatBookingVO.reservationNum}`
	      
	};
	
	list.push(seatVO);   
	</c:forEach>

	console.log(list);


// 	var str = 'ABCD';
// 	console.log(str);
// 	console.log(str.charCodeAt(0));
// 	console.log(str.charCodeAt(0)-64);

	var seatNumList = [];

	for(i=0;i<list.length;i++){
		var row = list[i].rowIdx;
		row = row.charCodeAt(0)-64;
		var col = list[i].colIdx;

// 		console.log("seat["+i+"] : "+row+col);
// 		console.log(row+col);
		seatNumList.push(row+col);
		
	}



	$(".seat").each(function(){
		var checkNum = $(this).data("row")+""+$(this).data("col");
		console.log(checkNum);

// 		console.log(seatNumList.indexOf(checkNum));
		if(seatNumList.indexOf(checkNum) == -1){
			$(this).remove();
		}
		
	
	});
	




</script>
	
	
	
	
	
	
	
	
	
	
	
	
