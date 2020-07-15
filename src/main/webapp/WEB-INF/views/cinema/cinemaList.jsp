<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/cinema/cinemaList.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="./cinemaList">극장</a></li>
						<li class="last">극장별 관람가격</li>
					</ul>
				</div>
			</div>

			<div class="contents">
				<h3>관람가격 안내</h3>

				<!-- 검색 -->
				<div class="search-div">
					<form action="./" method="get" enctype="">
						<!-- 지역 -->
						<select id="search-local">
							<option value="서울" selected="selected">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="강원">강원</option>
						</select>
						<!-- 영화관 -->
						<select id="search-cinema">

						</select>
						<button id="btnSearch" type="button" class="search-btn"></button>
					</form>
				</div>

				<!-- 극장별 영화 관람가격 -->
				<div class="timetable">
				
					<!-- for문 반복 -->
					<!-- 2D -->
					<div class="time-table" style="border-left: 1px solid #ab9c8f;" >
						<strong>&nbsp;&nbsp;&nbsp;■ 2D</strong>
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col style="width: 75px;">
								<col style="width: 75px;">
							</colgroup>
							<tr class="time-tr">
								<th scope="row">시간대</th>
								<th scope="row">일반</th>
								<th scope="row">청소년</th>
							</tr>
							<!-- 반복 -->
							<tr class="time-tr">
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					
					<!-- for문 반복  END -->
					
			</div>
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>


	<script type="text/javascript" src="../js/movie/movieList.js"></script>

	<script type="text/javascript">

		//초기 selectBox의 값 설정
		localSearchAjax('서울');

		console.log($("#search-local option:selected").val());
		
		//지역 클릭시 ajax호출
		$("#search-local").change(function(){
			var local = $(this).val();
			localSearchAjax(local);
			
		});
		
		//지역선택시 해당 지역의 영화관들 출력
		function localSearchAjax(local){
			$("#search-cinema").empty();
			$.ajax({
				url: './selectLocalCinemaNameList',
				type: 'get',
				data : {
					local : local
				},
				success : function(result){
					console.log(result);
					for(i=0;i<result.length;i++){
						
						$("#search-cinema").append('<option value="'+ result[i] +'">'+ result[i] +'</option>');
					}
				} 
			});
		}

		

	</script>


</body>
</html>












