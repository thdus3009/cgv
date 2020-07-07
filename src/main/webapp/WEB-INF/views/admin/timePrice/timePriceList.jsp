<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movieTime/insert.css">


<style type="text/css">

table{
	margin-bottom: 100px!important;	
	
}

button{
	float : right;
	margin-left: 10px!important;
	margin-bottom: 10px!important;
	font-size: 13px!important;
}

</style>

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

<script type="text/javascript">

	var timePriceList = []; 
	var filmType = 0;
	
	<c:forEach var="timePriceVO" items="${timePriceList}">
		var timePriceVO = {
			cinemaNum : `${timePriceVO.cinemaNum}`,
			sTime : `${timePriceVO.getSTime()}`,
			eTime : `${timePriceVO.getETime()}`,
			filmType : `${timePriceVO.filmType}`,
			commonPrice : `${timePriceVO.commonPrice}`,
			teenagerPrice : `${timePriceVO.teenagerPrice}`
		}
		timePriceList.push(timePriceVO);
	</c:forEach>


	//테이블 생성
	for(i=0;i<timePriceList.length;i++){
		
		var type = "2D";
		switch(timePriceList[i].filmType){
			case '2':
				type = "3D";
				break;	
			case '4':
				type = "4D";
				break;
		}

		
		var tdHTML = '<tr>'
			+'<td>'+ timePriceList[i].sTime +'</td>'
			+'<td>'+ timePriceList[i].commonPrice +'</td>'
			+'<td>'+ timePriceList[i].teenagerPrice +'</td>'
			+'</tr>'

		var tableHTML = '<div class="filmTypeTable" data-filmType="'+ timePriceList[i].filmType +'">' 
			+ '<h3>' + type + '</h3>'
			+ '<button class="btn btn-primary">삭제</button>'
			+ '<button class="btn btn-primary">수정</button>' 
			+ '<table class="table">'
			+ '<thead>'
			+ '<tr>'
			+ '<th>시간대~</th>'
			+ '<th>일반</th>'
			+ '<th>청소년</th>'
			+ '</tr>'
			+ '</thead>'
			+ '<tbody></tbody>'
			+ '</table></div>';

		if(filmType != timePriceList[i].filmType){
			$("#timePriceTable").append(tableHTML);
			filmType = timePriceList[i].filmType;
		}
		$(".table:last tbody").append(tdHTML);


	}



	
</script>

	

	
</body>
</html>
