<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<c:import url="../template/head.jsp"></c:import>


<link rel="stylesheet" href="/css/template/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<script src="/js/template/bootstrap-datepicker.js"></script>
<script src="/js/template/bootstrap-datepicker.ko.min.js"></script>

<!-- timepicker로 wickedpicker api 사용, 비슷한걸로 timepicki api 가 있음-->
<link rel="stylesheet" href="http://ericjgagnon.github.io/wickedpicker/wickedpicker/wickedpicker.min.css">
<script type="text/javascript" src="http://ericjgagnon.github.io/wickedpicker/javascript/smooth_scroll.js"></script>
<script type="text/javascript" src="http://ericjgagnon.github.io/wickedpicker/wickedpicker/wickedpicker.min.js"></script>



<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<link rel="stylesheet" href="/css/admin/cinema/timetablejs.css">
<link rel="stylesheet" href="/css/admin/cinema/demo.css">
<style type="text/css">

</style>
</head>
<body class="sb-nav-fixed">
		<c:import url="../template/header.jsp"></c:import> 
        <div id="layoutSidenav">
        <input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <c:import url="../template/sidenav.jsp"></c:import>
            <div id="layoutSidenav_content">
             			<main>
				<div class="container-fluid">
					<h1>${test}</h1>
					<h1>${cine.name}</h1>
					<div class="card mb-4">
						<div class="card-body">
							<p class="mb-0">
								<code>Cinema Info</code>
								<br> 
								<span>영화관 이름: ${cine.name} CGV</span><br> 
								<span>지역: ${cine.local}</span><br>
								<span>번호: ${cine.tel}</span><br> 
								<span>총 관수: ${cine.totalTheater}개</span><br>
								<span>총 좌석: ${cine.totalSeat}개</span><br> 
								<span>교톻안내: ${cine.trafficInfo}</span><br>
								<span>주차안내: ${cine.parkingInfo}</span><br> 
								<span>영화관 소개: ${cine.intro}</span><br>
								<input id="" class="form-control timepicker" type="text" name="screenTime" />
							</p>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>Num</th>
									<!-- <th>CinemaNum</th> -->
									<th>Name</th>
									<th>seatCount</th>
									<th>filmType</th>
									<th>Button</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<!-- <th>CinemaNum</th> -->
									<th>Name</th>
									<th>seatCount</th>
									<th>filmType</th>
									<th>Button</th>
								</tr>
							</tfoot>
							<tbody id="accordion">
								<c:forEach items="${theaterList}" var="vo" varStatus="i">
									<tr class="theaterList-c">
										<td><a href="./theaterSelect?num=${vo.num}" id="td${i.index}">${vo.num}</a></td>
										<%-- <td>${vo.cinemaNum}</td> --%>
										<td>${vo.name}</td>
										<td>${vo.seatCount}</td>
						
										<td>
										
									 	<c:forEach items="${filmType}" begin="${i.index}" end="${i.index}" var="f">
											
											<c:forEach items="${f}" var="m">
												<c:if test="${m eq 1}">
													2D
												</c:if>
												<c:if test="${m eq 2}">
													3D
												</c:if>
												<c:if test="${m eq 4}">
													4D
												</c:if>
											</c:forEach>
											
										</c:forEach>
										
										</td>
										
										
										
										<%-- <td><input class="time_block" name="tb${i.index}" type="button" value="▼"></td> --%>
										<td>
											<a class="collapsed card-link" id="table${i.index}" data-toggle="collapse" href="#tb${i.index}">▼</a>
										</td>
									</tr>
									<tr id="tb${i.index}"  class="collapse" data-parent="#accordion">
										<td colspan="5">
											<div class="filmInfo">
										  		<span class="film_title">2D</span><span class="film_color film_2d"></span>
										  		<span class="film_title">3D</span><span class="film_color film_3d"></span>
										  		<span class="film_title">4D</span><span class="film_color film_4d"></span>
										  	</div>
										  	
										  <div class="timetable" id="timetable${i.index}" name="${i.index}">
										  	
										  </div>
											<div class="test123"></div>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="">
                    	<span id="de" class="btn btn-danger">Delete</span>
                    	<a href="./cinemaUpdate?num=${cine.num}" id="up" class="btn btn-primary">Update</a>
                    </div>
				</div>
			</main>
                <c:import url="../template/footer.jsp"></c:import>
            </div>
        </div>
        <c:import url="../template/scripts.jsp"></c:import>
        <script type="text/javascript">
			//delete submit
			$("#de").click(function(){
				//정말 삭제할 거냐고 묻는 alert창
				var check = confirm("삭제하시겠습니까?");
				if(check){
					location.href="./cinemaDelete?num="+${cine.num};
				}
			});



        </script>
        
         <script src="/js/theater/timetable.js"></script>

   		 <script>
/*     	$("#table0").click(function(){
    		  var timetable = new Timetable();

    	      timetable.setScope(9,3)

    	      timetable.addLocations(['월', '화', '수', '목', '금', '토', '일']);

    	      timetable.addEvent('Sightseeing', '월', new Date(2015,7,17,9,00), new Date(2015,7,17,11,30), { url: '#' });
    	      timetable.addEvent('test', '월', new Date(2015,7,17,9,30), new Date(2015,7,17,13,30), { url: '#' });
    	      timetable.addEvent('Zumba', '화', new Date(2015,7,17,12), new Date(2015,7,17,13), { url: '#' });
    	      timetable.addEvent('Zumbu', '화', new Date(2015,7,17,13,30), new Date(2015,7,17,15), { url: '#' });
    	      timetable.addEvent('Lasergaming', '목', new Date(2015,7,17,17,45), new Date(2015,7,17,19,30), { class: 'vip-only', data: { maxPlayers: 14, gameType: 'Capture the flag' } });
    	      timetable.addEvent('All-you-can-eat grill', '금', new Date(2015,7,17,21), new Date(2015,7,18,1,30), { url: '#' });
    	      timetable.addEvent('Hackathon', '일', new Date(2015,7,17,11,30), new Date(2015,7,17,20)); // options attribute is not used for this event
    	      timetable.addEvent('Hackathon Livestream', '수', new Date(2015,7,17,12,30), new Date(2015,7,17,16,15)); // options attribute is not used for this event
    	      timetable.addEvent('Lunch', '토', new Date(2015,7,17,9,30), new Date(2015,7,17,11,45), { onClick: function(event) {
    	        window.alert('You clicked on the ' + event.name + ' event in ' + event.location + '. This is an example of a click handler');
    	      }});
    	      

    	      var renderer = new Timetable.Renderer(timetable);
    	      renderer.draw('#timetable0');
    	      $(".room-timeline").css("width","100%");
	
        });
*/


		$("#timetable").each(function(){

			var tid = $(this).attr("id");
			var name = $(this).attr("name");

		   	$("#table"+name).click(function(){

				var theaterNum = $("#td"+name).html();
				console.log(theaterNum);
			 	$.get("./theaterTime",{"theaterNum":theaterNum, "_csrf": $("#_csrf").val()},function(data){
			 		$(".test123").html(data);
					
			  		  var timetable = new Timetable();

			  	      timetable.setScope(7,3)

			  	      timetable.addLocations(['월', '화', '수', '목', '금', '토', '일']);

			  	      $(data).each(function(){
				  	      alert($(this)[0]);
			  	    	timetable.addEvent($(this)[0], $(this)[1], new Date($(this)[2],$(this)[3],$(this)[4],$(this)[5],$(this)[6]), new Date($(this)[7],$(this)[8],$(this)[9],$(this)[10],$(this)[11])/* , { class: 'vip-only', data: { maxPlayers: 14, gameType: 'Capture the flag' } } */);
				  	  });

			  	   /*    timetable.addEvent('Lasergaming', '목', new Date(2015,7,17,17,45), new Date(2015,7,17,19,30), { class: 'vip-only', data: { maxPlayers: 14, gameType: 'Capture the flag' } });
			  	      timetable.addEvent('All-you-can-eat grill', '금', new Date(2015,7,17,21), new Date(2015,7,18,1,30), { url: '#' });
			  	      timetable.addEvent('Hackathon', '일', new Date(2015,7,17,11,30), new Date(2015,7,17,20)); // options attribute is not used for this event
			  	      timetable.addEvent('Hackathon Livestream', '수', new Date(2015,7,17,12,30), new Date(2015,7,17,16,15)); // options attribute is not used for this event
			  	      timetable.addEvent('Lunch', '토', new Date(2015,7,17,9,30), new Date(2015,7,17,11,45), { onClick: function(event) {
			  	        window.alert('You clicked on the ' + event.name + ' event in ' + event.location + '. This is an example of a click handler');
			  	      }}); */
			  	      

			  	      var renderer = new Timetable.Renderer(timetable);
			  	      renderer.draw('#'+tid);
			  	      $(".room-timeline").css("width","100%");
			  	      $(".time-entry").css("width","11.8%");
			  	    $(".time-entry").css("left","38.9%");
					
				}); 


			   	
	/* 	  		  var timetable = new Timetable();

		  	      timetable.setScope(7,3)

		  	      timetable.addLocations(['월', '화', '수', '목', '금', '토', '일']);

		  	      timetable.addEvent('Lasergaming', '목', new Date(2015,7,17,17,45), new Date(2015,7,17,19,30), { class: 'vip-only', data: { maxPlayers: 14, gameType: 'Capture the flag' } });
		  	      timetable.addEvent('All-you-can-eat grill', '금', new Date(2015,7,17,21), new Date(2015,7,18,1,30), { url: '#' });
		  	      timetable.addEvent('Hackathon', '일', new Date(2015,7,17,11,30), new Date(2015,7,17,20)); // options attribute is not used for this event
		  	      timetable.addEvent('Hackathon Livestream', '수', new Date(2015,7,17,12,30), new Date(2015,7,17,16,15)); // options attribute is not used for this event
		  	      timetable.addEvent('Lunch', '토', new Date(2015,7,17,9,30), new Date(2015,7,17,11,45), { onClick: function(event) {
		  	        window.alert('You clicked on the ' + event.name + ' event in ' + event.location + '. This is an example of a click handler');
		  	      }});
		  	      

		  	      var renderer = new Timetable.Renderer(timetable);
		  	      renderer.draw('#'+tid);
		  	      $(".room-timeline").css("width","100%"); */
			
		      });
			
		
		});
    

	// datepicker 초기화
	function initDatePicker() {

		var today = new Date();
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜

		if(month < 10) {
			month = "0" + month;
		}
		
		if(date < 10) {
			date = "0" + date;
		}

		<!-- 시작시 기본 날짜 설정은 value를 이용 -->
		$('#datepicker').val(year + '-' + month + '-' + date);
		
		$('#datepicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+45d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    //datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    //daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    //daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "영화 상영 날짜",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
	}

	// timepicker
	function initTimePicker() {
		$('.timepicker').wickedpicker({
	        now: "12:00", //hh:mm 24 hour format only, defaults to current time
	        twentyFour: true,  //Display 24 hour format, defaults to false
	        upArrow: 'wickedpicker__controls__control-up',  //The up arrow class selector to use, for custom CSS
	        downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS
	        close: 'wickedpicker__close', //The close class selector to use, for custom CSS
	        hoverState: 'hover-state', //The hover state class to use, for custom CSS
	        title: '영화 상영 시작 시간', //The Wickedpicker's title,
	        showSeconds: false, //Whether or not to show seconds,
	        timeSeparator: ':', // The string to put in between hours and minutes (and seconds)
	        secondsInterval: 1, //Change interval for seconds, defaults to 1,
	        minutesInterval: 5, //Change interval for minutes, defaults to 1
	        beforeShow: null, //A function to be called before the Wickedpicker is shown
	        afterShow: null, //A function to be called after the Wickedpicker is closed/hidden
	        show: null, //A function to be called when the Wickedpicker is shown
	        clearable: false, //Make the picker's input clearable (has clickable "x")
	    });
	}
      
    </script>
    </body>
</html>