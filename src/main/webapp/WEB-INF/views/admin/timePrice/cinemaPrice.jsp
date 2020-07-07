<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h1>Cinema Price</h1>
					<p>극장별 관람가격 등록</p>
					<div id="selectDatetime" class="container tab-pane fade active show">
					
						<form action="./write" method="post">
							<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />	
						
							<div class="container">
								<div id="movieTimeInsert" style="width: 850px;">
									<!-- 상단부 -->
									<div style="display:flex!important;">
										<div class="form-group" style="width: 40%;">
											<label for="local">지역</label> 
<!-- 											<select id="local" class="form-control"> -->
<!-- 												<option>서울</option> -->
<!-- 												<option>경기</option> -->
<!-- 												<option>인천</option> -->
<!-- 												<option>강원</option> -->
<!-- 												<option>대전/충청</option> -->
<!-- 												<option>대구</option> -->
<!-- 												<option>부산,울산</option> -->
<!-- 												<option>경상</option> -->
<!-- 												<option>광주,전라,제주</option> -->
<!-- 											</select> -->
												<input type="text" value="${cinemaVO.local}" class="form-control" readonly="readonly">

										</div>
										<div class="form-group" style="width: 40%;margin-left: 10px;">
											<label for="cinema">영화관</label> 
<!-- 											<select id="cinema" class="form-control" name="cinemaNum"> -->
<!-- 											</select> -->
											<input type="text" value="${cinemaVO.name}" class="form-control" readonly="readonly">
											<input type="hidden" name="cinemaNum" value="${cinemaVO.num}">
										</div>
										<div class="form-group" style="width: 20%;margin-left: 10px;">
											<label for="screenType">종류</label> 
											<select id="screenType" class="form-control" name="filmType">
												<option value="1">2D</option>
												<option value="2">3D</option>
												<option value="4">4D</option>
											</select>
										</div>
									</div>
									<hr>
								
									<!-- 하단부 -->
									
										<div><button id="addUnderDataBtn" type="button" class="btn" style="float: right;">+</button></div>
										<div style="display:flex!important; clear: both;">
											<label for="Time" style="width: 50%;">시간대</label>
											<label for="adult-price" style="width: 25%;">일반가격</label>
											<label for="youth-price" style="width: 25%;">청소년가격</label>
										</div>
										<div id="underData">
											<div class="underData" style="display:flex!important;">
												<div class="form-group" style="width: 45%;">
													<div style="display:flex!important;">
														<input type="text" name="sTime" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
														 ~ 
														<input type="text" name="eTime" class="eTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
													</div>
												</div>
												
												<div class="form-group" style="width: 25%;">
													<input type="text" name="commonPrice" class="commonPrice form-control inputbox" required="required"
														style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
												</div>
												
												<div class="form-group" style="width: 25%; margin-left: 10px;">
													<input type="text" name="teenagerPrice" class="teenagerPrice form-control inputbox" required="required"
														style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
												</div>
												<div style="width: 5%;">&nbsp;</div>
											</div>
										</div>
										
										<div class="text-center" style="float: right; margin: 20px 0;">
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

	

	<script type="text/javascript">

		//HH:MM 형식 생성
		function inputTimeColon(time) {
	        // replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
	        var replaceTime = time.value.replace(/\:/g, "");
	
	        // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
	        if(replaceTime.length >= 4 && replaceTime.length < 5) {
	            var hours = replaceTime.substring(0, 2);      // 선언한 변수 hours에 시간값을 담는다.
	            var minute = replaceTime.substring(2, 4);    // 선언한 변수 minute에 분을 담는다.
	
	            // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
	            if(isFinite(hours + minute) == false) {
	                alert("문자는 입력하실 수 없습니다.");
	                time.value = "00:00";
	                return false;
	            }
	
	            // 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
	            if(hours + minute > 2400) {
	                alert("시간은 24시를 넘길 수 없습니다.");
	                time.value = "24:00";
	                return false;
	            }
	
	            // 입력한 분의 값이 60분을 넘는지 체크한다.
	            if(minute > 60) {
	                alert("분은 60분을 넘길 수 없습니다.");
	                time.value = hours + ":00";
	                return false;
	            }
	            time.value = hours + ":" + minute;
	        }
	    }
	
	
		//지역에 따른 영화관 목록 갱신
		$("#local").click(function(){
			var local = $("#local option:selected").val();
			//console.log(local);

			$.ajax({
				url : '../../../cinema/selectedLocal',
				type : 'GET',
				data : {
					local : local
				},
				success : function(result){
					var html ="";
					for(i=0;i<result.length;i++){
						html += '<option value="'+ result[i].num +'">'+result[i].name+'</option>'
					}
					$("#cinema").html(html);
					
				}
			});
		});

		var count = 1;
		//하단부 정보 추가 버튼 클릭
		$("#addUnderDataBtn").click(function(){
			//var copyHTML = $(".underData:first").clone();
			var html = '<div class="underData" style="display:flex!important;">'
			+ '<div class="form-group" style="width: 45%;">'
			+ '<div style="display:flex!important;">'
			+ '<input type="text" name="sTime" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>'
			+ ' ~ ' 
			+ '<input type="text" name="eTime" class="eTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>'
			+ '</div>'
			+ '</div>'
			+ '<div class="form-group" style="width: 25%;">'
			+ '<input type="text" name="commonPrice" class="commonPrice form-control inputbox" required="required"'
			+ 'style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">'
			+ '</div>'
			+ '<div class="form-group" style="width: 25%; margin-left: 10px;">'
			+ '<input type="text" name="teenagerPrice" class="teenagerPrice form-control inputbox" required="required"'
			+ 'style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">'
			+ '</div>'
			+ '<div><button class="btn delBtn" type="button" style="width: 5%;">&nbsp;X</button>'
			+ '</div>';
			
			count += 1;
			if(count <= 5){
				$("#underData").append(html);
			}
			
		});

		//항목 삭제 버튼
		$("#underData").on("click",".delBtn",function(){
			$(this).parent().parent().remove();
			count += 1;
		});
		
		
		//등록 버튼 클릭
// 		$("#submitBtn").click(function(){

// 			var timeAndPriceList = [];
// 			var cinemaNum = $("#cinema option:selected").val();
// 			var filmType = $("#screenType option:selected").val();  //1, 2, 4

// 			console.log("영화관 : "+cinema);
// 			console.log("스크린 타입 : "+filmType);
			
// 			//하단부에 등록되어있는 정보 리스트로 생성
// 			$(".underData").each(function(){
// 				var sTime = $(this).find(".sTime").val();
// 				var eTime = $(this).find(".eTime").val();
// 				var commonPrice = $(this).find(".commonPrice").val();
// 				var teenagerPrice = $(this).find(".teenagerPrice").val();

// 				console.log("sTime : "+sTime);
// 				console.log("eTime : "+eTime);
// 				console.log("commonPrice : "+commonPrice);
// 				console.log("teenagerPrice : "+teenagerPrice);

// 				var str = {
// 					sTime : sTime,
// 					eTime : eTime,
// 					commonPrice : commonPrice,
// 					teenagerPrice : teenagerPrice
// 				}
// 				timeAndPriceList.push(str)
// 			});
// 			console.log(timeAndPriceList)

// 			var data = {
// 				cinemaNum : cinemaNum,
// 				filmType : filmType,
// 				timeAndPriceList : timeAndPriceList
// 			}

// 			$.ajax({


// 				})
			
// 		});


		
		

         

	</script>
</body>
</html>
