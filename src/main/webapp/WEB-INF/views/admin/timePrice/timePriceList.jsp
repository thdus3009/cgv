<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movieTime/insert.css">

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

							<c:forEach var="vo" items="${cinemaList}">
								${vo.name}
								${vo.local}

								<c:forEach var="timePriceVO" items="${vo.timePriceVOs}">
									<tr>
										<td>${timePriceVO.getSTime()}</td>
										<td>${timePriceVO.commonPrice}</td>s
										<td>${timePriceVO.teenagerPrice}</td>
										<td>${timePriceVO.filmType}</td>
									</tr>
								</c:forEach>
							</c:forEach>

							<c:forEach var="timePriceVO" items="timePriceList">
								
							</c:forEach>
						</div>
					</div>
				</div>
			</main>
			
			
			
		</div>
	</div>

<script type="text/javascript">
	console.log(`${cinemaList}`);

</script>

	

	
</body>
</html>
