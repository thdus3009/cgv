<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/head.jsp"></c:import> 
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<link rel="stylesheet" href="/css/admin/cinema/timetablejs.css">
<link rel="stylesheet" href="/css/admin/cinema/demo.css">
<style type="text/css">

</style>
</head>
<body class="sb-nav-fixed">
		<c:import url="../template/header.jsp"></c:import> 
        <div id="layoutSidenav">
            <c:import url="../template/sidenav.jsp"></c:import>
            <div id="layoutSidenav_content">
             			<main>
				<div class="container-fluid">
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
							</p>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
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
										<td><a href="../theater/theaterSelect">${vo.num}</a></td>
										<%-- <td>${vo.cinemaNum}</td> --%>
										<td>${vo.name}</td>
										<td>${vo.seatCount}</td>
										<c:if test="${vo.filmType eq 0}">
											<td>2D</td>
										</c:if>
										<c:if test="${vo.filmType eq 1}">
											<td>3D</td>
										</c:if>
										<c:if test="${vo.filmType eq 2}">
											<td>4D</td>
										</c:if>
										<%-- <td><input class="time_block" name="tb${i.index}" type="button" value="▼"></td> --%>
										<td>
											<a class="collapsed card-link" data-toggle="collapse" href="#tb${i.index}">▼</a>
										</td>
									</tr>
									<tr id="tb${i.index}"  class="collapse" data-parent="#accordion">
										<td colspan="5">
										  <div class="timetable"></div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						 <div class="timetable"></div>
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

			
			//update submit
			$("#up").click(function(){		
				location.href="./cinemaUpdate?num="+${cine.num};
			});


			//time block 스르륵

        </script>
        
         <script src="/js/theater/timetable.js"></script>

    <script>
      var timetable = new Timetable();

      timetable.setScope(9,3)

      timetable.addLocations(['월', '화', '수', '목', '금', '토', '일']);

      timetable.addEvent('Sightseeing', '월', new Date(2015,7,17,9,00), new Date(2015,7,17,11,30), { url: '#' });
      timetable.addEvent('test', '월', new Date(2015,7,17,9,30), new Date(2015,7,17,130,30), { url: '#' });
      timetable.addEvent('Zumba', '화', new Date(2015,7,17,12), new Date(2015,7,17,13), { url: '#' });
      timetable.addEvent('Zumbu', '화', new Date(2015,7,17,13,30), new Date(2015,7,17,15), { url: '#' });
      timetable.addEvent('Lasergaming', '목', new Date(2015,7,17,17,45), new Date(2015,7,17,19,30), { class: 'vip-only', data: { maxPlayers: 14, gameType: 'Capture the flag' } });
      timetable.addEvent('All-you-can-eat grill', '금', new Date(2015,7,17,21), new Date(2015,7,18,1,30), { url: '#' });
      timetable.addEvent('Hackathon', '일', new Date(2015,7,17,11,30), new Date(2015,7,17,20)); // options attribute is not used for this event
      timetable.addEvent('Hackathon Livestream', '수', new Date(2015,7,17,12,30), new Date(2015,7,17,16,15)); // options attribute is not used for this event
      timetable.addEvent('Lunch', '토', new Date(2015,7,17,9,30), new Date(2015,7,17,11,45), { onClick: function(event) {
        window.alert('You clicked on the ' + event.name + ' event in ' + event.location + '. This is an example of a click handler');
      }});
      timetable.addEvent('Cocktails', '월', new Date(2015,7,18,00,00), new Date(2015,7,18,02,00), { class: 'vip-only' });

      var renderer = new Timetable.Renderer(timetable);
      renderer.draw('.timetable');
    </script>

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-37417680-5');ga('send','pageview');

      $(".room-timeline").css("width","100%");
      
    </script>
    </body>
</html>