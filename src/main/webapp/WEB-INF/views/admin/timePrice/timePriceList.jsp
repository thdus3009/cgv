<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movieTime/insert.css">
<link rel="stylesheet" href="/css/admin/timePrice/timePriceList.css">

</head>


<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Time Price</h1>
					<p>극장별 관람가격 조회</p>
					
					<div id="selectDatetime" class="container tab-pane fade active show">
						<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />	
						<div class="container">
						<button id="btn-add" class="btn btn-info" onclick="">추가</button>
							<h2>${cinemaVO.local} - ${cinemaVO.name}</h2>
							<hr>
							<div id="timePriceTable">
							
							</div>
						</div>
						
					</div>
				</div>
			</main>
			
			
			
		</div>
	</div>

<script type="text/javascript" src="/js/template/common.js"></script>
<script type="text/javascript">
	var timePriceList = []; 
	var filmType = 0;
	var filmTypeList = 0;
	var cinemaNum = `${cinemaVO.num}`
	var list = [];
		
	<c:forEach var="timePriceVO" items="${timePriceList}">
		var endTime = `${timePriceVO.getETime()}`;
		endTime = endTime.split(":");

		var t1 = new Date(0,0,0,endTime[0],endTime[1]); 
		t1.setMinutes(t1.getMinutes()+1);

		if(endTime[0] > 24){
			endTime[0] = "0"+(endTime[0]-24);
		}
		
		var timePriceVO = {
			cinemaNum : `${timePriceVO.cinemaNum}`,
			eTime : endTime[0]+":"+endTime[1],
			filmType : `${timePriceVO.filmType}`,
			commonPrice : `${timePriceVO.commonPrice}`,
			teenagerPrice : `${timePriceVO.teenagerPrice}`
		}
		
		timePriceList.push(timePriceVO);

		var minute = t1.getMinutes()+"";
		var hour = t1.getHours()+"";

		if(minute.length < 2){
			minute = "0"+minute;
		}
		if(hour.length < 2){
			if(hour == 0){
				hour = '24';
			}else{
				hour = "0"+hour;
			}
		}
		if(filmTypeList != timePriceVO.filmType){
			list.push("06:00")
			filmTypeList = timePriceVO.filmType;
		}
		if(hour > 6){
			list.push(hour+":"+minute);
		}
		
		console.log(list)
	</c:forEach>

</script>
<script type="text/javascript" src="/js/admin/timePrice/timePriceList.js"></script>
	

	
</body>
</html>
