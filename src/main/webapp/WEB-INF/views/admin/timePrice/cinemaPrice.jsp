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
					
						<form action="./${timePrice}" method="post">
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
											
											<c:if test="${timePrice eq 'update'}">
												<input type="text" id="filmType" class="form-control" name="filmType" value="" readonly="readonly">
											</c:if>
											<c:if test="${timePrice ne 'update'}">
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
										
										<c:if test="${timePrice eq 'update'}">
											<c:forEach var="timePriceVO" items="${timePriceList}" varStatus="i">
												<div class="underData" style="display:flex!important;">
													<input type="hidden" name="num" value="${timePriceVO.num}">										
													<div class="form-group" style="width: 45%;">
														<div style="display:flex!important;">
															<input type="text" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>
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
													<div class="button_del"><button class="btn delBtn" type="button" style="width: 5%;">&nbsp;X</button></div>
													
												</div>
											</c:forEach>										
										</c:if>
										<c:if test="${timePrice ne 'update'}">
											<c:forEach begin="1" end="4">
												<div class="underData" id="default" style="display:flex!important;">
													<div class="form-group" style="width: 45%;">
														<div style="display:flex!important;">
															<input type="text" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" style="width: 45%;  margin: 0 auto"/>
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
											</c:forEach>
										
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

	//insert , update고용
	var timePrice = `${timePrice}`;
	var filmType = `${timePriceList[0].filmType}`;

	var count = 4;

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

	//update ======================================================
	//default값 설정
	$(".sTime:first").val("06:00");
	$(".sTime:first").attr("readonly",true);
	$(".eTime:last").val("02:00")
	$(".eTime:last").attr("readonly",true);
	
	//시간 form변형
	$(".eTime").each(function(){
		var eTime = $(this).val();
		eTime = eTime.substr(0,5);
		$(this).val(eTime);
	})	


	if(timePrice == 'write'){

		
		
	}
	

	
	if(timePrice == 'update'){

		//sTime 값 생성 및 글자 출려값 변경
		$(".eTime").each(function(){
			var sTime = $(this).val();
			sTime = sTime.split(":");

			var t1 = new Date(0,0,0,sTime[0],sTime[1]);
			t1.setMinutes(t1.getMinutes()+1);

			var minute = t1.getMinutes()+"";
			var hour = t1.getHours()+"";
			if(sTime[0] > 24){
				sTime[0] = "0"+(endTime[0]-24);
			}
			if(minute.length < 2){
				minute = "0"+minute;
			}
			if(hour.length < 2){
				if(hour == 0){
					hour = '24';
				}else{
					hour = "0"+hour;
				}
			}

			sTime = hour+":"+minute;

			//맨앞 2개 맨뒤 2개 x버튼 지우기 (최소 4개는 입력해야됨)
			$(".underData:first").find(".button_del").remove();
			$(".underData:first").next().find(".button_del").remove();
			$(".underData:first").next().next().find(".button_del").remove();
			$(".underData:last").find(".button_del").remove();

			//console.log(":"+$(".underData").length)
			count = $(".underData").length;
			$(this).parent().parent().parent().next().find(".sTime").val(sTime);
		});


		//제목 변경
		$("#title").text("극장별 관람가격 수정")

	}
	
	

	//공용
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


		
	//insert  ======================================================
		

		
		//하단부 정보 추가 버튼 클릭
		$("#addUnderDataBtn").click(function(){
			//var copyHTML = $(".underData:first").clone();
			var html = '<div class="underData" style="display:flex!important;">'
			+ '<div class="form-group" style="width: 45%;">'
			+ '<div style="display:flex!important;">'
			+ '<input type="text" class="sTime form-control timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM" maxlength="5"  style="width: 45%;  margin: 0 auto"/>'
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
			+ '<div class="button_del"><button class="btn delBtn" type="button" style="width: 5%;">&nbsp;X</button></div>';
			
			
			if(count < 6){
				count += 1;
				$(".underData:last").before(html);
			}else{
				alert("최대 6개까지 가능합니다.")
			}
			
		});



		
		//항목 삭제 버튼
		$("#underData").on("click",".delBtn",function(){
			//update면, DB에서 값 날리기 
			if(timePrice == 'update'){
				//console.log($(this).parent().parent().find('input[name="num"]').val())
				var timePriceNum = $(this).parent().parent().find('input[name="num"]').val();

				if(typeof timePriceNum != 'undefined' || timePriceNum != null || timePriceNum != ""){
					$.get("./deleteSelect?num="+timePriceNum,function(result){
						if(result > 0){
							alert("삭제되었습니다.");
						}
					});
				}

			}
			count -= 1;
			$(this).parent().parent().remove();
		});
		
		
	


		
		

         

	</script>
</body>
</html>
