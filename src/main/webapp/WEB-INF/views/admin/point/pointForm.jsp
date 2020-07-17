<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<link rel="stylesheet" href="/css/admin/point/pointForm.css" />

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
					<h1>CJ One포인트 적립 관리</h1>
					<p>포인트 적립 관리</p>

						<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="form-group" style="width: 600px;margin-top: 50px;">
							<h2>CJ 포인트 적립률</h2>
							<input type="text" class="form-control" id="discountRate" name="rate" placeholder="2(%)" required="required" value="${rate}">
							<span style="vertical-align: top;font-weight: bold;font-size: 26px;">(%)</span>
							<button type="button" id="btnSubmit" class="btn" style="background-color: #dc3545; color: #fff;">변경</button>
						</div>
					
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	
	<c:import url="../template/scripts.jsp"></c:import>
	
	
<script type="text/javascript" src="/js/template/common.js"></script>
<script type="text/javascript" src="/js/admin/point/pointForm.js"></script>

</body>
</html>


