<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/head.jsp"></c:import> 
	<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
	<link href="/css/admin/cinema/theaterInsert.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import> 
    <div id="layoutSidenav">
	<c:import url="../template/sidenav.jsp"></c:import>
		<div id="layoutSidenav_content">
		<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<main>
				<div class="container-fluid">
					<h1>Theater Insert</h1>
	                <form id="frm" action="./${board}${path}" method="post" enctype="multipart/form-data">
						<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<c:if test="${path eq 'Update'}">
							<input type="hidden" name="num" id="num" value="${vo.num}">
						</c:if>
						<div class="form-group">
							<label class="theaterLebel" for="cinemaNum">CinemaNum:</label>
							<select class="cinemaNum selectcinenum" name="cinemaNum">
								<c:forEach items="${cine}" var="cnt">
								<option value="${cnt.num}">${cnt.num} / ${cnt.name}</option>
								</c:forEach>
 							</select>
							<br>
							<label class="theaterLebel lebelname" for="name">Name:</label>
							<input type="text" class="form-control" id="name" name="name" value="${vo.name}">
							<br>
							<label class="theaterLebel" for="filmType">FilmType:</label>
							<label class="ckfm">
								<input type="checkbox" name="filmType" value="1"> 2D
								<span class="checkmark"></span>
							</label>

							<label class="ckfm">
								<input type="checkbox" name="filmType" value="2"> 3D
								<span class="checkmark"></span>
							</label>

							<label class="ckfm">
								<input type="checkbox" name="filmType" value="4"> 4D
								<span class="checkmark"></span>
							</label>
							<br>
							<label class="theaterLebel" for="seat">seat:</label>
							
							<div class="seat_box">
								<div class="seat_header">
									<div class="header_btn">
							   	 		<select class="seat_row" id="seat_row">
									   	 	<option value="1">A</option>
									   	 	<option value="2">B</option>
									   	 	<option value="3">C</option>
									   	 	<option value="4">D</option>
									   	 	<option value="5">E</option>
									   	 	<option value="6">F</option>
									   	 	<option value="7">G</option>
									   	 	<option value="8">H</option>
									   	 	<option value="9">I</option>
									   	 	<option value="10">J</option>
									   	 	<option value="11">K</option>
									   	 	<option value="12">L</option>
									   	 	<option value="13">M</option>
									   	 	<option value="14">N</option>
									   	 </select>
									   	 
									   	 <select class="seat_col" id="seat_col" onchange="">
									   	 	<option value="1">1</option>
									   	 	<option value="2">2</option>
									   	 	<option value="3">3</option>
									   	 	<option value="4">4</option>
									   	 	<option value="5">5</option>
									   	 	<option value="6">6</option>
									   	 	<option value="7">7</option>
									   	 	<option value="8">8</option>
									   	 	<option value="9">9</option>
									   	 	<option value="10">10</option>
									   	 	<option value="11">11</option>
									   	 	<option value="12">12</option>
									   	 	<option value="13">13</option>
									   	 	<option value="14">14</option>
									   	 	<option value="15">15</option>
									   	 	<option value="16">16</option>
									   	 	<option value="17">17</option>
									   	 	<option value="18">18</option>
									   	 	<option value="19">19</option>
									   	 	<option value="20">20</option>
									   	 </select>
									   	 
									   	 <!-- 아니면 select 할 때마다  script 처리 해서 바로 생성 -->
										<button type="button" onclick="changeSelect()">좌석 생성</button>
									</div><!-- end header_btn -->
								</div><!-- end seat header -->
								<div class="seat_section">
									<div class="section_btn">
										<button class="btn_del" type="button" onclick="changeGrade(0)">좌석 삭제</button>
										<button class="btn_economy" type="button" onclick="changeGrade(1)">Economy</button>
										<button class="btn_standard" type="button" onclick="changeGrade(2)">Standard</button>
										<button class="btn_prime" type="button" onclick="changeGrade(3)">Prime</button>
								 	</div><!-- end section_btn -->
							 		<div class="contents">
							 			<div class="seats" id="seats_list">
								
										</div>
							 		</div>
								</div><!-- end seat section -->
							</div><!-- end seat box -->
							<br>
							<label for="seatCount">SeatCount:</label>
	 						<input type="text" class="form-control" id="seatCount" name="seatCount" value="${vo.seatCount}">
							<br>
							<br>
							<br>
							<br>
							<br>
						<input type="button" id="btn_insert" class="btn btn-default" value="submit">
						</div>
					</form>
					<c:if test="${path eq 'Update'}">
						<button type="button" id="btn_delete" value="${vo.num}">Delete</button>
					</c:if>	 
				</div>
			</main>
		<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
	<script src="/js/theater/theaterInsert.js"></script>
</body>
</html>