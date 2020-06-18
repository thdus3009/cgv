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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



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
					<h3>CinemaList</h3>
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
						<option title="2" value="date">최신순</option>
						<option title="3" value="title">제목순</option>
					</select>
					<button id="btn-sort" type="button" class="round gray">
						<span>GO</span>
					</button>
				</div>
				
				
				
<!-- 			리스트 출력부분 -->
				<div class="sect-movie-chart">

		<form action="${board}${path}" method="post" enctype="multipart/form-data">
				<c:if test="${path eq 'Update'}">
					<input type="hidden" name="num" id="num" value="${vo.num}">
				</c:if>
				
				<c:if test="${path eq 'Reply'}">
					<input type="hidden" name="num" id="num" value="${vo.num}">
				</c:if>
				
			  <div class="form-group">
			   	 <label for="name">Name:</label>
			   	 <input type="text" class="form-control" id="name" name="name" value="${vo.name}">
			  </div>
			  
			  <div class="form-group">
			   	 <label for="local">Local:</label>
			   	 <input type="text" class="form-control" id="local" name="local" value="${vo.local}">
			  </div>
			  
			  <div class="form-group">
			   	 <label for="address">Address:</label>
			   	 <input type="text" class="form-control" id="address" name="address" value="${vo.address}">
			  </div>
			  
			  <div class="form-group">
			   	 <label for="tel">Tel:</label>
			   	 <input type="text" class="form-control" id="tel" name="tel" value="${vo.tel}">
			  </div>
			  
			  <div class="form-group">
			   		<label for="totalTheater">TotalTheater:</label>
			   	 <input type="text" class="form-control" id="totalTheater" name="totalTheater" value="${vo.totalTheater}">
			  </div>
			  
			  <div class="form-group">
			   		<label for="totalSeat">TotalSeat:</label>
			   	 <input type="text" class="form-control" id="totalSeat" name="totalSeat" value="${vo.totalSeat}">
			  </div>
			  
			  
			  <div class="form-group">
			   		<label for="trafficInfo">TrafficInfo:</label>
			   	 <input type="text" class="form-control" id="trafficInfo" name="trafficInfo" value="${vo.trafficInfo}">
			  </div>
			  
			  
			  <div class="form-group">
			   		<label for="parkingInfo">ParkingInfo:</label>
			   	 <input type="text" class="form-control" id="parkingInfo" name="parkingInfo" value="${vo.parkingInfo}">
			  </div>
			  
			  <div class="form-group">
			   		<label for="intro">Intro:</label>
			   	 <input type="text" class="form-control" id="intro" name="intro" value="${vo.intro}">
			  </div>

			  

			  <button type="submit" class="btn btn-default">Submit</button>

		</form>
		  <c:if test="${path eq 'Update'}">
				<button type="button" id="btn_delete" value="${vo.num}">Delete</button>
		  </c:if>



					
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

<script type="text/javascript">
	$("#btn_delete").click(function(){
		alert("확인");
		var con = confirm("정말 삭제하시겠습니까?");
		if(con){
			var n = $("#btn_delete").val();
			$.post("./cinemaDelete",{num:n},function(data){
				
			
				 	location.href='./cinemaList';
				
				
			})

		}else{
			alert("취소되었습니다.");
		}

	})
	
</script>


</body>
</html>
















