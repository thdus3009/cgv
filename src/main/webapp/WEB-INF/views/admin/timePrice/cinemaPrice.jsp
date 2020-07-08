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
					<p id="title">극장별 관람가격 등록</p>
					<div id="selectDatetime" class="container tab-pane fade active show">
					
						<form action="./write" method="post">
							<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />	
						
							<div class="container">
								<div id="movieTimeInsert" style="width: 850px;">
									<!-- 상단부 -->
									<div style="display:flex!important;">
										<div class="form-group" style="width: 40%;">
											<label for="local">지역</label> 
											<input type="text" value="${cinemaVO.local}" class="form-control" readonly="readonly">
										</div>
										<div class="form-group" style="width: 40%;margin-left: 10px;">
											<label for="cinema">영화관</label> 
											<input type="text" value="${cinemaVO.name}" class="form-control" readonly="readonly">
											<input type="hidden" name="cinemaNum" value="${cinemaVO.num}">
										</div>
										<div class="form-group" style="width: 20%;margin-left: 10px;">
											<label for="screenType">종류</label> 
											
											<c:if test="${timePrice eq 'Update'}">
												<input type="text" id="filmType" class="form-control" name="filmType" value="" readonly="readonly">
											</c:if>
											<c:if test="${timePrice ne 'Update'}">
												<select id="screenType" class="form-control" name="filmType">
													<option value="1">2D</option>
													<option value="2">3D</option>
													<option value="4">4D</option>
												</select>
											</c:if>
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
										
										<c:if test="${timePrice eq 'Update'}">
											<c:forEach var="timePriceVO" items="${timePriceList}">
												<div class="underData" style="display:flex!important;">
													<div class="form-group" style="width: 45%;">
														<div style="display:flex!important;">
															<input type="text" name="sTime" value="${timePriceVO.getSTime()}" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
															 ~ 
															<input type="text" name="eTime" value="${timePriceVO.getETime()}" class="eTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
														</div>
													</div>
													
													<div class="form-group" style="width: 25%;">
														<input type="text" name="commonPrice" value="${timePriceVO.commonPrice}" class="commonPrice form-control inputbox" required="required"
															style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
													</div>
													
													<div class="form-group" style="width: 25%; margin-left: 10px;">
														<input type="text" name="teenagerPrice" value="${timePriceVO.teenagerPrice}" class="teenagerPrice form-control inputbox" required="required"
															style="IME-MODE:disabled;" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
													</div>
													<div><button class="btn delBtn" type="button" style="width: 5%;">&nbsp;X</button></div>
													
												</div>
											</c:forEach>										
										</c:if>
										<c:if test="${timePrice ne 'Update'}">
											<!-- 시작값 -->
											<div class="underData" style="display:flex!important;">
												<div class="form-group" style="width: 45%;">
													<div style="display:flex!important;">
														<input type="text" name="sTime" class="sTime form-control timeBox" value="06:00" readonly="readonly" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
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
											
											<!-- DEFAULT 값 -->
											<div class="underData" id="default" style="display:flex!important;">
												<div class="form-group" style="width: 45%;">
													<div style="display:flex!important;">
														<input type="text" name="sTime" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" style="width: 45%;  margin: 0 auto"/>
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
											
											<!-- 마감값 -->
											<div class="underData" style="display:flex!important;">
												<div class="form-group" style="width: 45%;">
													<div style="display:flex!important;">
														<input type="text" name="sTime" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
														 ~ 
														<input type="text" name="eTime" class="eTime form-control timeBox" value="02:00"  style="width: 45%;  margin: 0 auto" readonly="readonly"/>
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
										</c:if>
											
											
											
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

		var timePrice = `${timePrice}`;
		var filmType = `${timePriceList[0].filmType}`;
		console.log("a"+timePrice);

		if(timePrice == 'Update'){
			$("#title").text("극장별 관람가격 수정")
		}

		var filmTypeStr = "2D";
		switch(filmType){
		case 2:
			filmTypeStr = "3D";
			break;
		case 4:
			filmTypeStr = "4D";
			break;
		}
		console.log(filmTypeStr)
		$("#filmType").val(filmTypeStr);

		//Update End -------------------------------------------------

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
	            if(hours + minute > 2459) {
	                alert("시간은 24시를 넘길 수 없습니다.");
	                time.value = "24:59";
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

		var count = 3;
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
			+ '<div><button class="btn delBtn" type="button" style="width: 5%;">&nbsp;X</button></div>';
			
			count += 1;
			if(count <= 6){
				$("#default").after(html);
			}
			
		});

		//항목 삭제 버튼
		$("#underData").on("click",".delBtn",function(){
			$(this).parent().parent().remove();
			count += 1;
		});
		
		
	


		
		

         

	</script>
</body>
</html>
