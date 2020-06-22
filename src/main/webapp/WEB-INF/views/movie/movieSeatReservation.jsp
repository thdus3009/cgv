<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/movie/movieSeatReservation.css" rel="stylesheet" type="text/css">


<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieReservation.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	
	<div class="root">
		<c:import url="../template/header.jsp"></c:import>
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">예매</a>
					</li>
					<li>
						<a href="">빠른예매</a>
					</li>
					<li class="last">
						무비차트
					</li>
				</ul>
			</div>
		</div>
		<div id="container">
			<div id="ticket">
		
			<!-- navigation -->
				<div class="navi">
					<span class="right">
						<a href="#" class="button btn-guide">
							<span>예매가이드</span>
						</a>
						<a href="#" class="button btn-reservation-restart">
							<span>예매 다시하기</span>
						</a>
					</span>
				</div>
			</div>
		</div>
		
		
		<!--콘텐츠-->
	<div class="contents">
		<div>
			<span>
				<a href="" class="reset"></a>
			</span>
			<div class="col-head">
				<a href="">다시하기</a>
			</div>
			<div class="col-body">
				<div class="person-screen">
				
					<div class="num-person">
						<ul class="person-num">
							<span>일반</span>
							<li>0</li>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
							<li>7</li>
							<li>8</li>
						</ul>
						<ul class="person-num">
							<span>청소년</span>
							<li>0</li>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
							<li>7</li>
							<li>8</li>
						</ul>
						<ul class="person-num">
							<span>우대</span>
							<li>0</li>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
							<li>7</li>
							<li>8</li>
						</ul>
					</div>
					<div class="screen-select">
						<p>
							<span>영화관</span>
							<span>몇관</span>
							<span>남은좌석 100/100</span>
						</p>
						<p class="date">
							<b>날짜</b>
							<b>요일</b>
							<b>시간</b>
						</p>
						<span>상영시간 변경하기</span>
					</div>
				</div>
				<div class="content-box">
					<div class="content">
						<img alt="스크린" src="">
						<div>좌석</div>
					</div>
					<div class="legend">
						<button>크게보기</button>
						<div class="legend-box">
							<span><span></span>선택</span>
							<span><span></span>예매완료</span>
							<span><span></span>선택불가</span>
						</div>
						<div class="legend-box">
							<span><span></span>Economy Zone</span>
							<span><span></span>Standarad Zone</span>
							<span><span></span>Prime Zone</span>
							<span><span></span>장애인석</span>
						</div>
					</div>
				</div>
				
			</div>
		</div>

	</div>
		
		
		
		
		<!-- 선택내용 출력,좌선선택 페이지로 이동버튼 출력부분 -->
		<div class="ticket_tnb">
			<div id="ticket_tnb" class="tnb_container ">
				<div class="tnb step1">
					<div class="info movie">
						<span class="movie_poster">
							<img id="select_image" src="" alt="포스터" style="display: none;"> 			<!-- display: inline; -->
						</span>
						<div class="row movie_title colspan2" style="display: none;">		 <!-- style="display: block;" -->
							<span class="data letter-spacing-min ellipsis-line2">
								<a id="select_title" href="#" target="_blank" title=""></a>
							</span>
						</div>
						<div class="row movie_type" style="display: none;"> 						<!-- style="display: block;" -->
							<span id="select_movieType" class="data ellipsis-line1" title="2D"></span>
						</div>
						<div class="row movie_rating" style="display: none;"> 					<!-- style="display: block;" -->
							<span id="select_ageLimit" class="data" title="12세 관람가">12세 관람가</span>
						</div>
						<div class="placeholder" title="영화선택"></div> <!-- style="display: none;" -->
					</div>
					
					
					
					<div class="info theater">
						<div class="row name" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">극장</span>
							<span class="data letter-spacing-min ellipsis-line1"><a id="select_cinema" href="#" target="_blank" title=""> </a></span>
						</div>
						<div class="row date" style="display: none;" > <!-- style="display: block;" -->
 							<span class="header">일시</span>
							<span id="select_day" class="data" title=""></span>
						</div>
						<div class="row screen" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">상영관</span>
							<span id="select_theater" class="data" title=""></span>
						</div>
						<div class="row number" style="display: none;"> <!-- style="display: block;" -->
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
						<div class="placeholder" title="극장선택" ></div> <!-- style="display: none;" -->
					</div>
					<div class="info path">
						<div class="row colspan4">
							<span class="path-step2" title="좌석선택">&nbsp;</span>
							<span class="path-step3" title="결제">&nbsp;</span>
						</div>
					</div>
					<a class="btn-right" id="tnb_step_btn_right" title="좌석선택"></a>
				</div>
			</div>
		</div>
		
		
		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/sidebar.jsp"></c:import>
		
		
	</div>
	
	
	
</body>
</html>