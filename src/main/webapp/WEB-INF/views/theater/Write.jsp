<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<link href="../css/bbsForm.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">고겍센터</a>
					</li>
					<li class="last">
						글쓰기
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div>
				
				<div class="col_content">
					<!----------------------------------------------------------------------------------------------------- contents aside -->
					<div class="col_aside">
						<div class="snb">
							<ul>
								<li><a href="">고객센터 메인<i></i></a></li>
								<li><a href="">자주찾는 질문<i></i></a></li>
								<li><a href="/bbs/boardList">공지/뉴스<i></i></a></li>
								<li class="on"><a href="#">이메일 문의<i></i></a></li>
								<li><a href="">분실문 문의<i></i></a></li>
								<li><a href="">단체/대관 문의<i></i></a></li>
								<li><a href="">대학로 옥탑 예약<i></i></a></li>
							</ul>
						
						</div>
						<div class="ad_area">
							<div class="ad_panner_1">
								<a href="">
									<img alt="" src="../images/bbsList/200313_160x300.jpg">
								</a>
							</div>
							<div class="ad_panner_2">
								<a href="">
									<img alt="" src="../images/bbsList/0325_160x35.png">
								</a>
							</div>
						</div>
					</div>
					
					<!----------------------------------------------------------------------------------------------------- contents detail -->
					
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="customer_top">
							<h2 class="tit">글쓰기</h2>
							<p class="stit">CGV이용과 관련된 사항에 대하여서 작성가능합니다.</p>
						</div>
						
						<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
						<form action="${board}Write" method="post" enctype="multipart/form-data">
						
					
							
							
						
						
						<div class="form-group">
								  	<label for="cinemaNum">cinemaNum:</label>
								      <select class="form-control" id="cinemaNum" name="cinemaNum"  >
								      <c:forEach var="cine" items="${cine}">
												  <option value="${cine.num}" selected="selected" >${cine.num} / ${cine.name}</option>
												
									</c:forEach>
								  	  </select>
							</div> 
								  				
						
							  <div class="form-group">
							    <label for="name">Name:</label>
							    <input type="text" class="form-control" id="name" name="name" >
							  </div>
							  

							  
							  <div class="form-group">
							    <label for="filmType">FilmType:</label>
							     <input type="text" class="form-control" id="filmType" name="filmType" >

							  </div>
							  
							  
							  
							  
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
			   	 
			   	 
			   	 <div class="">
			   	 	<button type="button" onclick="changeGrade(0)">좌석 삭제</button>
			   	 	<button type="button" onclick="changeGrade(1)">Economy</button>
			   	 	<button type="button" onclick="changeGrade(2)">Standard</button>
			   	 	<button type="button" onclick="changeGrade(3)">Prime</button>
			   	 </div>
			  </div>
			  

				<div class="contents">
					<div class="seats" id="seats_list">
						<!-- <div class="seat_row">
							<div class="label">A</div>
							<div class="seat_group">
								<div class="seat">
									<a href="" onclick="">
										<span class="no">1</span>
									</a>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			  
							  
							  
							  
							  
							  
							  
							  
							  
							  
							  <div class="form-group">
							    <label for="seatCount">SeatCount:</label>
							    <input type="text" class="form-control" id="seatCount" name="seatCount" >
							  </div>
							  
							
							  <button type="submit" class="btn btn-default">Submit</button>
						</form>
						
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript" src="../js/bbsWrite.js"></script>


</body>
</html>