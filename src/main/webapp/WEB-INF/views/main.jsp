<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/layout.css" rel="stylesheet" type="text/css">
<link href="./css/main_container.css" rel="stylesheet" type="text/css">
<link href="./css/animate.css" rel="stylesheet" type="text/css">
<style type="text/css">
span{
	color: red;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	
	<c:import url="template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	<div class="container container_bg">
		<div class="contents">
			<div class="section_slider">
				<div class="slide">
					<input type="radio" name="pos" id="pos1" checked>
				    <input type="radio" name="pos" id="pos2">
				    <input type="radio" name="pos" id="pos3">
				    <input type="radio" name="pos" id="pos4">
					<ul>
				      <li><img alt="" src="./images/container/slider/slider_img_1.jpg"></li>
				      <li><img alt="" src="./images/container/slider/slider_img_2.jpg"></li>
				      <li><img alt="" src="./images/container/slider/slider_img_3.jpg"></li>
				      <li><img alt="" src="./images/container/slider/slider_img_4.jpg"></li>
<!-- 				      <li></li> -->
<!-- 				      <li></li> -->
<!-- 				      <li></li> -->
<!-- 				      <li></li> -->
 				   </ul>
 				   <p class="bullet">
				      <label for="pos1">1</label>
				      <label for="pos2">2</label>
				      <label for="pos3">3</label>
				      <label for="pos4">4</label>
				   </p>
				</div>
		
			</div>
			<h3>
				<img src="./images/container/movie/h3_movie_selection.gif">
			</h3>
			<div class="section_movie">
				<div class="section_L">
					<div>
<!-- 					<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Selection_L" width="733" height="388"></iframe>  -->
					</div>
				</div>
				<div class="section_R">
					<a href="#">
						<img src="./images/container/movie/240x388.jpg">
					</a>
					
				</div>
			</div>
			<h3>
				<img src="./images/container/event/h3_event.gif">
			</h3>
			<ul class="tab_menu">
				<li>
					<a href="#" data-filter-type="08">
						CGV스페셜
					</a>
				</li>
				<li><a href="#">영화/예매</a></li>
				<li><a href="#">CGV아트하우스</a></li>
				<li><a href="#">제휴/할인</a></li>
				<li class="last"><a href="#">멤버쉽</a></li>
			</ul>
			<div class="section_event">
			
				<ul>
					<li><a href="#"><img alt="" src="./images/container/event/event_img_1.jpg"></a></li>
					<li><a href="#"><img alt="" src="./images/container/event/event_img_2.jpg"></a></li>
					<li><a href="#"><img alt="" src="./images/container/event/event_img_3.jpg"></a></li>
					<li><a href="#"><img alt="" src="./images/container/event/event_img_4.jpg"></a></li>
				</ul>
			</div>
			<div class="section_banner">
				<div class="banner_1">
					<div class="box_over">
						<div class="box_inner">
							<a href="#"><img alt="" src="./images/container/banner/banner_img_1.jpg"> </a>
						</div>
					</div>
				</div>
				<div class="banner_2">
					<div class="box_over">
						<div class="box_inner">
							<a href="#"><img alt="" src="./images/container/banner/banner_img_2.jpg"> </a>
						</div>
					</div>
				</div>
				<div class="banner_3">
					<div class="box_over">
						<div class="box_inner">
							<a href="#"><img alt="" src="./images/container/banner/banner_img_3.jpg"> </a>
						</div>
					</div>
				</div>
			</div>
			<div class="section_notice">
				<h3>공지사항</h3>
				<div class="notice_list">
					<div class="notice_list_content">
						[극장][CGV아시아드] 4DX/스크린X 도입 및 전관 리뉴얼공사로 인한 일시영업중단 안내
					</div>
					<div class="notice_list_date">
						2020.03.13
					</div>					
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="template/footer.jsp"></c:import>
	
	
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="template/sidebar.jsp"></c:import>
</div>

</body>
</html>