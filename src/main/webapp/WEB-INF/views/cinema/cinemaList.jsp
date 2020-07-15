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
				
					
			</div>
		</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>


	<script type="text/javascript" src="../js/movie/movieList.js"></script>
	<script type="text/javascript" src="/js/template/common.js"></script>
	<script type="text/javascript">

		//초기 selectBox의 값 설정
		localSearchAjax('서울');
		
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
					//console.log(result);
					for(i=0;i<result.length;i++){
						$("#search-cinema").append('<option class="cinemaOpt" value="'+ result[i].num +'">'+ result[i].name +'</option>');
					}
					//영화관에 맞는 TimePrice리스트 자동 설정
					var cinema = $("#search-cinema option:selected").val();
					cinemaTimePrieListAjax(cinema);
				} 
			});
		}

		//선택된 영화관에따른 TimePrice리스트 호출
		$("#search-cinema").change(function(){
			var cinema = $(this).val();
			cinemaTimePrieListAjax(cinema);
		});

		//TimePrice리스트 호출
		function cinemaTimePrieListAjax(cinema){
			//기존 리스트 초기화
			$(".timetable").empty();
			checkFilmType = 0;
			
			$.ajax({
				url: '../timePrice/timePriceCinemaList',
				type: 'get',
				data: {
					cinemaNum : cinema
				},
				success : function(result){
					makeTimePriceTable(result);
				}
				
			});

			
		}

		var checkFilmType = 0;
		function makeTimePriceTable(result){

			for(i=0;i<result.length;i++){
				var filmType = result[i].filmType;
				var time = result[i].etime;
				var commonPrice = addComma(result[i].commonPrice);
				var teenagerPrice = addComma(result[i].teenagerPrice);

				if(checkFilmType != filmType){
					checkFilmType = filmType;
					var trHTML = makeTr(time,commonPrice,teenagerPrice);
					
					var str = filmTypeForm(filmType);
					var tableHTML = makeTable(str,trHTML);
					
					$(".timetable").append(tableHTML);
				}else{
					var trHTML = makeTr(time,commonPrice,teenagerPrice);
					$(".timePriceTable:last").append(trHTML);
				}

				//맨처음 table CSS삭제
				$(".time-table:first").css("border","none");
			}
			
		}

		//필름 타입 폼 변경
		function filmTypeForm(filmType){
			var filmTypeForm = "";
			switch(filmType){
			case 1 :
				filmTypeForm = '2D';
				break;
			case 2 :
				filmTypeForm = '3D'; 
				break;
			case 4 : 
				filmTypeForm = '4D';
				break;
			}

			return filmTypeForm;
		}

		function makeTr(time,commonPrice,teenagerPrice){
			var sTime = sTimeMake(time)
			
			var trHTML = '	<tr class="time-tr">'
			+'		<td>'+ sTime + '~' + time +'</td>'
			+'		<td>'+ commonPrice +'</td>'		
			+'		<td>'+ teenagerPrice +'</td>';
			+'	</tr>'
			return trHTML;
		}
		
		function makeTable(str,trHTML){
			var tableHTML = '<div class="time-table" style="border-left: 1px solid #ab9c8f;" >' 
				+'<strong>&nbsp;&nbsp;&nbsp;■ 일반('+ str +')</strong>'
				+'<table class="timePriceTable">'
				+'	<colgroup>'
				+'		<col style="width: 200px;">'
				+'		<col style="width: 75px;">'
				+'		<col style="width: 75px;">'
				+'	</colgroup>'
				+'	<tr class="time-tr">'
				+'		<th scope="row">시간대</th>'
				+'		<th scope="row">일반</th>'
				+'		<th scope="row">청소년</th>'
				+'	</tr>'	
				+ trHTML		
				+'</table>'
				+'</div>';

			return tableHTML;
		}
		

	</script>


</body>
</html>












