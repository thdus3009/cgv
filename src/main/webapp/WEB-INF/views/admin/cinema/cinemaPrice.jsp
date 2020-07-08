<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1>Theater Price</h1>
					<p>시간대별 관람가격 등록</p>
					<div id="selectDatetime"
						class="container tab-pane fade active show">
						<form action="" method="post">
							<div class="container">

								<div id="movieTimeInsert">
									<div class="form-group">
										<label for="local">지역</label> <select id="local" class="form-control">
											<option>서울</option>
											<option>경기</option>
											<option>인천</option>
											<option>강원</option>
											<option>대전/충청</option>
											<option>대구</option>
											<option>부산,울산</option>
											<option>경상</option>
											<option>광주,전라,제주</option>
										</select>
									</div>
									<div class="form-group">
										<label for="cinema">영화관</label> <select id="cinema" class="form-control">
											<option></option>
										</select>
									</div>
									<div class="form-group">
										<label for="screenType">종류</label> <select id="screenType" class="form-control">
											<option>2D</option>
											<option>3D</option>
											<option>4D</option>
										</select>
									</div>
									<div class="form-group">
										<label for="Time">시간대</label> <select id="Time" class="form-control">
											<option>모닝( 06:00~ )</option>
											<option>브런치( 10:01~ )</option>
											<option>데이라이트( 13:01~ )</option>
											<option>프라임( 16:01~ )</option>
											<option>문라이트( 22:01~ )</option>
											<option>나이트( 24:01~ )</option>
										</select>
									</div>
									<div class="form-group">
										<label for="adult-price">일반가격</label> <input type="text"
											id="adult-price" class="form-control inputbox" required="required"
											style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
									</div>
									<div class="form-group">
										<label for="youth-price">청소년가격</label> <input type="text"
											id="youth-price" class="form-control inputbox" required="required"
											style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
									</div>
									<div class="text-center">
										<button id="submitBtn" type="submit" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	
	<!-- 스크립트 -->
	<c:import url="../template/scripts.jsp"></c:import>
	
</body>
</html>