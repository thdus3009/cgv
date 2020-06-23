<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieList.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/seat/seatInsert.css" rel="stylesheet" type="text/css">

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
					<h3>SeatInsert</h3>
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

			  <div class="form-group">
			   	 <label for="name">TheaterNum:</label>
			   	 <input type="text" class="form-control" id="name" name="name" value="${vo.theaterNum}">
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
									<a href="#" onclick="">
										<span class="no">1</span>
									</a>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			  


			  <button type="button" id="btn_insert" class="btn btn-default">Submit</button>

		</form>
		  <c:if test="${path eq 'Update'}">
				<button type="button" id="btn_delete" value="${vo.num}">Delete</button>
		  </c:if>



					
					<div class="sect-movie-chart" id="list-more"></div>
					
					

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

	// 0 : 검은색(자리 없음)
	// 1 : 테두리 노랑 = 주황
	// 2 : 테두리 빨강
	// 3 : 테두리 초록
	
	
	var seatColor = 1;
	
	function changeGrade(grade){
		seatColor = grade;
	}

	var list = [];

	
	function makeVo(row, col, grade){
		var vo = {
			"row":row,
			"col":col,
			"grade":1
		}
		list.push(vo);
	}
	
/* 	var vo = {
		"row":0,
		"col":0,
		"grade":1
	} */

	
	//col select하면 row와 col의 값을 읽고
	//숫자만큼의  .seats .seat_row  / .seats .seat_row .seat_group .seat 생성
	//test부터

	function changeSelect(){
		$("#seats_list").empty();
		//list = [];
		
		var row = $("#seat_row").val();
		var col = $("#seat_col").val();
		console.log("생성한 row : " +row);
		console.log("생성한 col : " +col);
		//1 2 3 4 5 6 7 8 
		//1 -> 65  
		for(i=0; i<row; i++){
			var ch = String.fromCharCode(i+65);
	
			console.log("ch : " + ch);
			
			$("#seats_list").append('<div class="seat_row"><div class="label">'+ch+'</div><div class="seat_group" id="r'+i+'">');
				for(j=1; j<=col; j++){

					// row, col 에 값넣기
					// vo.row = asd vo.set("row", 10)
					// list.push(vo)
					
					makeVo(ch, j, 1);
	
					//list.push(vo);
					
					$("#r"+i).append('<div class="seat"><a href="#" onclick="checkSeat('+ch+j+')"  name="'+ch+j+'" id="'+ch+j+'"><span class="no">'+j+'</span></a></div>')	
		
				}
			$("#seats_list").append('</div></div>');				
		
		}

		console.log($("#A1").attr("class"));

		console.log(list.length);
		console.log(list[0]);
		console.log(list[1]);
		console.log(list[2]);
		console.log(list[3]);
		console.log(list[4]);
		console.log(list[5]);
		console.log(list[6]);
		console.log(list[7]);
		console.log(list[8]);
		console.log(list[9]);
		console.log(list[10]);
		
		console.log("--------------------------")
		
	}
	
	
	function checkSeat(name){
		
		//seat 번호 가져오기 //A5, C18
 		name = $(name).attr('name'); 
		console.log(name);
		console.log(typeof name);

		//파싱해서 row와 col로 나누기
		var rw = name.substring(0,1);
		var cl = name.substring(1,2); 
		console.log("rw : " +rw);
		console.log("cl : " + cl);

		
		var grade=1; 

		var ck = $(name).attr("name");

		
		switch(seatColor) {

		//좌석 삭제
		case 0:
			
			//클릭시 name값에 'del' 삽입
			if(ck=='del'){
				$(name).attr("name","h");
				$(name).css('background-color','orange');
			}else{
				$(name).css('background-color','black');
				//vo의 row가 A, col이 B인 것을 찾아 grade 값 바꾸기
				$(name).attr("name","del");
				
				grade=0;
			}
			
			break;

		//Economy
		case 1:
			// 테두리 색 맞게 바꾸기
			// vo.grade = 1
			if(ck!='del'){
			$(name).find("span").css('border','2px solid #ed8c00');
			$(name).css('background','#666')
			grade=1;
			}
			
			
			
			break;

		//Standard
		case 2:
			// 테두리 색 맞게 바꾸기
			// vo.grade = 2 
			if(ck!='del'){
			$(name).find("span").css('border','2px solid #01c73c');
			$(name).css('background','#666')
			
			grade=2;
			}
			
			break;

		//Prime
		case 3:
			// 테두리 색 맞게 바꾸기
			// vo.grade = 3
			$(name).find("span").css('border','2px solid #f71708');
			$(name).css('background','#666')
			grade=3;
			
			
			break;
		}

/* 		var index = list.findIndex(i => i.row==rw &&i.col==cl);
		vo['row']=rw;
		vo['col']=cl;
		vo['grade']=grade;
		list[index] = vo; */
		
		//바꾼 후 list 교체

		
	}





	

	$("#btn_insert").click(function(){
	
		var row = $("#seat_row").val();
		var col = $("#seat_col").val();
		for(i=0; i<row; i++){
			var ch = String.fromCharCode(i+65);
			//console.log(typeof ch);
				for(j=1; j<=col; j++){
					var sId = ch+j;
					console.log($(sId).attr("class"));

					if(!$(sId).attr("class")=="col"){
						console.log(sId);
						list.push(sId);
					}

				}
		}



		
		$.post("./seatInsert",{list:list},function(data){
			if(data>0){
		 		alert("전송 성공");
			}
		})


		
	});
	
	
</script>


</body>
</html>
















