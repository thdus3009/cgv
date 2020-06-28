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
										
										
											<c:forEach var="row" items="${rowList}" varStatus="t" >
												<div class="row" style="top:${t.index+(t.index*16)}px;" data-row="${row.rowIdx}">
													<div class="label">${row.rowIdx}</div>
													<div class="seat_group" data-seat-group="">
														<div class="group"> 
														
														
															<c:forEach begin="1" end="${maxCol}" var="i" >
																<!--blocked(선택불가)  reserved(이미 예매)  -->
																<!-- rating_economy(노랑) rating_comfort(초록) rating_prime(빨강)  -->
																
																<div class="seat" style="left:${48+(i*16)}px" data-row="${t.index+1}" data-col="${i}" data-grade="${row.grade}" > 
																	<a href="#" onclick="return false;"> 
																		<span class="no">${i}</span>
																		<span class="sreader"></span>
																		<span class="sreader mod"></span>
																		<span class="sreader seatNum"></span>
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
	
<script type="text/javascript">

	var seatList = [];



	<c:forEach items="${seatList}" var="vo">
		var seatVO = {
		      num: `${vo.num}`,
		      theaterNum:	`${vo.theaterNum}`,
		      rowIdx :	`${vo.rowIdx}`,
		      colIdx :	`${vo.colIdx}`,
		      grade:	`${vo.grade}`,
		      bNum : 	`${vo.seatBookingVO.num}`,
		      movieTimeNum : `${vo.seatBookingVO.movieTimeNum}`,
		      reservationNum : 	`${vo.seatBookingVO.reservationNum}`
		};

		seatList.push(seatVO);   
	</c:forEach>


	var seatNumList = [];

	for(i=0;i<seatList.length;i++){
		var row = seatList[i].rowIdx;
		row = row.charCodeAt(0)-64;
		var col = seatList[i].colIdx;
		
		seatNumList.push(row+col);

	}

	
	//좌석 띄우는 값 리스트
	var seatSpaceList = [];
	<c:forEach items="${seatSpaceList}" var="seatSpaceVO">
		var seatSpaceVO = {
		      type : `${seatSpaceVO.rowOrCol}`,
		      index : `${seatSpaceVO.index}`
		};
		seatSpaceList.push(seatSpaceVO);
	</c:forEach>
	

	//reservationNum 값에 따라 CSS적용 - 0이면 좌석예매 불가 / 0이 아닌 값이면 예매된 좌석
	$(".seats .seat").each(function(){
		var checkNum = $(this).data("row")+""+$(this).data("col");
// 		console.log("this의 자리값 : "+checkNum);
		
		for(i=0;i<seatList.length;i++){
			var row = seatList[i].rowIdx;
			row = row.charCodeAt(0)-64;
			var col = seatList[i].colIdx;
			
			var str = row+""+col;	
			

			
			if(checkNum == str){
// 				console.log(seatList[i].reservationNum);
				//해당 좌석에 좌석 번호 부여
				$(this).find(".sreader.seatNum").text(seatList[i].num);
				
				if(seatList[i].reservationNum == '0'){
					$(this).addClass("blocked");
					$(this).find(".mod").text("0");
				}else if(seatList[i].reservationNum > 0){
					//예매좌석
					$(this).addClass("reserved");
					$(this).find(".mod").text(seatList[i].reservationNum);
				}
				
				seatList.shift();
				break;
			}
		}

		
	});
	

	$(".seats .seat").each(function(){
		//없는 좌석 삭제
		var checkNum = $(this).data("row")+""+$(this).data("col");
// 		console.log(checkNum);

// 		console.log(seatNumList.indexOf(checkNum));
		if(seatNumList.indexOf(checkNum) == -1){
			$(this).remove();
		}

		if($(this).find(".mod").text() == ""){
			//좌석 등급 css 등록
			<!-- rating_economy(노랑) rating_comfort(초록) rating_prime(빨강)  -->
			if($(this).data("grade")==1){
				//economy
				$(this).addClass("rating_economy");
			}else if($(this).data("grade")==2){
				//standard
				$(this).addClass("rating_comfort");
			}else if($(this).data("grade")==3){
				//prime
				$(this).addClass("rating_prime");
			}
		}
		
	});


	//좌석 빈칸 띄우기
	for(i=0;i<seatSpaceList.length;i++){
		var type = seatSpaceList[i].type;
		var index = seatSpaceList[i].index;

		//행띄우기
		if(type == 0){
			$(".seats .row").each(function(){
				var charAt = $(this).data("row");
				charAt = charAt.charCodeAt(0)-64;
				
				if(charAt > index){
					console.log(charAt + " "+index);
					var top = ($(this).css('top').replace('px', ''))*1;
					top = top+16;

					$(this).css('top',top+"px");
				}
				
			});
		}else if(type == 1){
			//열 띄우기
			$(".seats .seat").each(function(){
				var charAt = $(this).data("col");
				if(charAt == index){
					$(this).before('</div>');
				}
				
				
				if(charAt > index){
// 					console.log(charAt + " "+index);
					var top = ($(this).css('left').replace('px', ''))*1;
// 					console.log("left : "+top);
					top = top+16;
// 					console.log("left : "+top);

					$(this).css('left',top+"px");
				}
			});
		}
	}

	var maxCol = `${maxCol}`;


	
	
	
</script>
<script type="text/javascript" src="/js/movie/movieSeatReservation.js"></script>
	
	
	
	
	
	
	
	
	
	
	
	
