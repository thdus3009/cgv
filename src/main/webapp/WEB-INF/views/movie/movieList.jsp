<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieList.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
						<a href="./movieList">영화</a>
					</li>
					<li>
						<a href="./movieList">무비차트</a>
					</li>
					<li class="last">
						무비차트
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div class="movie-chart">
<!-- 			헤더 제목부분+ 차트종류(서브) -->
				<div class="sect-movie-title">
					<h3>무비 차트</h3>
					<div class="submenu">
						<ul>
							<li class="on"><a href="">무비 차트</a></li>
							<li><a href="">상영예정작</a></li>
						</ul>
					</div>
				</div>
				
<!-- 			정렬부분 -->
				<div class="sect-sorting">
					<select id="select" name="kind">
						<option title="1" value="rate" selected="selected">예매율순</option>
						<option title="2" value="date" >최신순</option>
						<option title="3" value="title" >제목순</option>
					</select>
					<button id="btn-sort" type="button" class="round gray">
						<span>GO</span>
					</button>
				</div>
				
				<input type="hidden" value="${pager.startRow}" id="startRow">
				
				
<!-- 			리스트 출력부분 -->
				<div class="sect-movie-chart" id="list_total">
					<ol>
					<c:forEach var="list" items="${list}" varStatus="i">
						<li>
							<!-- 윗 부분 -->
							<div class="box-image">
							 
								<strong class="rank">No.${i.index+1}</strong> 
								<a href="./movieSelect?num=${list.num}"> 
									<span class="thumb-image"> 
										<img alt="이미지"	src="../images/movie/movieList/filmCover/${list.movieImageVOs['0'].fileName}">
										<span class="icon-grade grade-${list.ageLimit}">${list.ageLimit}</span>
									</span>
								</a>
								<span class="screentype"></span>
							</div> <!-- 아래 부분 -->
							<div class="box-contents">
								<a href="./movieSelect?num=${list.num}"><strong class="title">${list.title}</strong> </a>
								<div class="score">
									<strong class="percent">예매율<span>${list.rate}%</span></strong>
									<div class="egg-gage small">
										<span class="egg great"></span> <span class="percent">${list.errRate}%</span>
									</div>
								</div>
								<span class="text-info"> 
									<strong>${list.openDate}<span>개봉</span></strong>
								</span> 
								<span class="like"> 
<%-- 									<a href="./movieReservation?mNum=${list.mNum}" class="link-reservation">예매</a> --%>
									<a href="./movieReservation" class="link-reservation">예매</a>
								</span>
							</div>
						</li>
								
						<c:if test="${i.index == 2}">
							</ol><ol>
						</c:if>
						
						
						
						
						</c:forEach>
					
					</ol>
					
					<div class="sect-movie-chart" id="list-more"></div>
					
					
					<div class="chart-ad">
						<div class="box-com">
							<a href=""><img alt="adImage" src="../images/movie/movieList/200313_160x300.jpg"></a>
						</div>
						<div class="chart-ad-desc">
							<dl>
								<dt>
									<img alt="ad1" src="../images/movie/movieList/ico_ad1.png">
									<span>CGV 기프트 카드</span>
								</dt>
								<dd>
									<span>센스있는 선물의 정석</span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			
			<div class="btn-more" id="btn-more">더보기
				<i class="link-more"></i>
			</div>
			
			</div>
			
		</div>
	</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>


<script type="text/javascript" src="../js/movie/movieList.js"></script>

	


</body>
</html>
















