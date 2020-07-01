
	
		var title ="";
		var theater = "";
		var date = "";
	
	
		//class selected값 변경
		$(".sortmenu a").click(function() {
			$(".sortmenu a").removeClass("selected");
			$(this).addClass("selected");
		});
		
		
		
		//영화제목 선택  =영화 이미지, 제목, 연령제한
		$(".movie-list").on("click","#movie-list-content li",function() {
			if($(this).hasClass("dimmed") === true){
				alert("선택할수 없습니다.");
			}else{
				
					$("#movie-list-content li").removeClass("selected");
					$(this).addClass("selected");
					
					$("#select_title").text($(this).data("title"));
					$("#select_image").attr("src","../images/movie/movieList/filmCover/"+$(this).data("image"));
					$("#select_ageLimit").text($(this).data("age_limit"));
					$("#movieNum").val($(this).data("index"));
					title = $(this).data("title");
					
					$(".movie_poster img").css("display","inline");
					$(".movie_title").css("display","block");
					$(".movie .placeholder").css("display","none");
				
				//ajax
				ajaxLoad();
			}
		});
		
		
		//지역선택
		$(".theater-area-list > ul > li").click(function(){
			$(".theater-area-list > ul > li").removeClass("selected");
			$(this).addClass("selected");
			
			console.log($(this).data("local"));
		});
		
		
		
		
		
	 	//극장 선택
		$(".theater-list").on("click",".area_theater_list > ul > li",function(){
			
			if($(this).hasClass("dimmed") === true){
				alert("선택할수 없습니다.");
			}else{
					$(".area_theater_list li").removeClass("selected");
					$(this).addClass("selected");
					theater = $(this).data("theater");
					$("#cinemaName").val(theater);
					
					$("#select_cinema").text($(this).data("theater"));
					$(".row.name").css("display","block");
					$(".row.date").css("display","block");
					$(".row.screen").css("display","block");
					$(".row.number").css("display","block");
					$(".info.theater .placeholder").css("display","none");
					
				
				//ajax
				ajaxLoad();
			
			}
		});
		
	
		// 날짜 토,일 CSS 적용
		$(".dayweek").each(function(){
			if($(this).data("week") == '토'){
				$(this).parent().parent().addClass("day-sat");
			}
		});
		
		$(".dayweek").each(function(){
			if($(this).data("week") == '일'){
				$(this).parent().parent().addClass("day-sun");
			}
		});
		
		
		//날짜 선택
		$(".date-list ul li.day").click(function(){
			if($(this).hasClass("dimmed") === true){
				alert("선택할수 없습니다.");
			}else{
					$(".date-list ul li.day").removeClass("selected");
					$(this).addClass("selected");
					var str = $(this).data("year")+"."+$(this).data("month")+"."+$(this).data("date")+"("+$(this).data("week")+")";
					
					$("#sDate").val(str)
					$("#select_day").text(str);
					var sYear = $(this).data("year");
					var sMonth = $(this).data("month")+"";
					var sDate = $(this).data("date")+"";
					
					if(sMonth.length == 1){
						sMonth = "0"+sMonth;
					}
					if(sDate.length == 1){
						sDate = "0"+sDate;
					}
					
					date = sYear+"-"+sMonth+"-"+sDate;
					
					$(".row.name").css("display","block");
					$(".row.date").css("display","block");
					$(".row.screen").css("display","block");
					$(".row.number").css("display","block");
					$(".info.theater .placeholder").css("display","none");
					
				//ajax
				ajaxLoad();
			
			}
		});
		
		
		
function ajaxLoad(){
	//영화관 값 출력
	$.ajax({
		type:'GET',
		url:'../reserveCheck/reserve',
		data:{
			theater:theater,
			date:date
		},
		success:function(result){
			//영화
			$("#movie-list-content li").addClass("dimmed");
			
			for(i=0;i<result.length;i++){
				console.log(result[i].movieInfoVOs[0].title)// 영화제목 
				
				$("#movie-list-content li").each(function(){
					if($(this).data("title") == result[i].movieInfoVOs[0].title){
						$(this).removeClass("dimmed");
					}
					
				});
			}
			
		}
	});
	
	//극장 값 출력
	$.ajax({
		type:'GET',
		url:'../reserveCheck/reserve',
		data:{
			title:title,
			date:date
		},
		success:function(result){
			//극장
			$(".theater-list li").addClass("dimmed");
			//극장, 날짜
			for(i=0;i<result.length;i++){
				//극장
				$(".theater-list li").each(function(){
					if($(this).data("theater") == result[i].cinemaVOs[0].name){
						$(this).removeClass("dimmed");
					}
					
				});
			}
		}
	});
	
	//날짜 값 출력
	$.ajax({
		type:'GET',
		url:'../reserveCheck/reserve',
		data:{
			title:title,
			theater:theater,
		},
		success:function(result){
			//날짜
			$(".date-list ul li.day").addClass("dimmed");
			// 날짜
			for(i=0;i<result.length;i++){
				$(".date-list ul li.day").each(function(){
					var str = result[i].movieTimeVOs[0].screenDate;
					var l = str.split('-');
					var y = l[0];
					var m = l[1];
					var d = l[2];
					
					var cy = $(this).data("year");
					var cm = $(this).data("month");
					var cd = $(this).data("date");
					if(cy == y && cm == m && cd == d ){
						$(this).removeClass("dimmed");
					}
				});
			}
		}
	});
	
	$(".time-list .content").html('');
	selectedCheck();
	
}
		
		
		//3개다 체크했는지 여부 판단
		function selectedCheck(){
			var cMovie = false;
			var cTheater = false;
			var cDate = false;
			
			if($(".movie-list ul li").hasClass("selected") == true){
				cMovie = true;
			}
			if($(".area_theater_list ul li").hasClass("selected") == true){
				cTheater = true;
			}
			if($(".date-list ul li.day").hasClass("selected") == true){
				cDate = true;
			}
			
			if(cMovie && cTheater && cDate){
				$("#ticket .step1 .section-time .col-body .placeholder").css("display","none");
				$("#ticket .step1 .section-time .col-body .time-list").css("display","block");
				
				//해당 조건에 맞는 상영 시간대 출력
				$.ajax({
					type:'GET',
					url:'../reserveCheck/reserve',
					data:{
						title:title,
						theater:theater,
						date:date
					},
					success:function(result){
						timeMake(result);
					}
				});
				
			}
		}
		
		
		//세개 다 선택했을 시 상영 시간 목록  HTML생성
		function timeMake(result){
			var list = [];
			
			for(i=0;i<result.length;i++){
				var fType = "";
				
				if(result[i].theaterVOs[0].filmType == 1){
					fType = '3D';
				}else if(result[i].theaterVOs[0].filmType == 2){
					fType = '4D';
				}else{
					fType = '2D';
				}
				
				
				var li = '<li data-time="'+ result[i].movieTimeVOs[0].screenTime +'" data-index="'+ result[i].movieTimeVOs[0].num +'">'
					+'<a class="button" href="#" title="" onclick="return false;">'
					+'<span class="time"><span>'+ result[i].movieTimeVOs[0].screenTime +'</span></span>'
					+'<span class="count" data-count="'+ result[i].movieTimeVOs[0].remainSeat +'">'+ result[i].movieTimeVOs[0].remainSeat +'석</span>'
					+'<span class="sreader mod"> 선택불가</span>'
					+'</a>'
					+'</li>'
				
				var query = '<div class="theater" data-name="'+ result[i].theaterVOs[0].filmType +'" data-floor="'+ result[i].theaterVOs[0].name 
					+'" data-seatcount="'+ result[i].theaterVOs[0].seatCount +'">'
					+'<span class="title">'
					+'<span class="name">'+ fType +'</span>'
					+'<span class="floor">'+ result[i].theaterVOs[0].name +'</span>'
					+'<span class="seatcount">(총'+ result[i].theaterVOs[0].seatCount +'석)</span>'
					+'</span>'
					+'<ul>'
					+ li
					+'</ul>'
					+'</div>'
				
				var checkName = result[i].theaterVOs[0].filmType;
				var checkFloor = result[i].theaterVOs[0].name;
				var check = true;

				for(k=0;k<list.length;k++){
					if(list[k] == checkName+checkFloor){
						check = false;
					}
				}
				
				if(i != 0){
					$(".time-list .theater").each(function(){
						if($(this).data("name") == checkName && $(this).data("floor") == checkFloor){
							$(this).find("ul").append(li);
						}
					});
					if(check){
						$(".time-list .content").append(query);
					}
				}else{
					$(".time-list .content").append(query);
				}
				
				list.push(checkName+checkFloor);
			}
			
			//.time-list ul li 잔여좌석이 0인 경우 class = "disabled"추가
			$(".time-list ul li .count").each(function(){
//				console.log("count: "+$(this).data("count"));
				if($(this).data("count") == 0){
					$(this).parent().parent().addClass("disabled");
				}
			});
			
			
			// 초기화
			//date - time
			$("#select_day").text($("#sDate").val());
			//theater
			$("#select_theater").text("");
			$("#theaterName").val("");
			
			//filmType
			$("#select_movieType").text("");
			$("#filmType").val("");
			
			$(".tnb.step1 .btn-right").removeClass("on");
		}
		
		
		
		function timeDimmedCheck(){
			var rdate = new Date();
			var rhour = rdate.getHours();
			var rminute = rdate.getMinutes();
			
			console.log("현재 시간 : "+ rdate);
			console.log("시 : " +rhour);
			console.log("분 : " +rminute);
			
			console.log("누른시간 : "+date);
			
			
			//누른날짜랑 현재 지금 날짜랑 동일 할때 
			//누른 각 버튼의 시간대와 현재의 시간대를 비교해서 dimmed추가
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 상영시간 선택
		$(".time-list").on("click",".theater ul li",function(){
			if(!$(this).hasClass("disabled")){
				$("#movieTimeNum").val($(this).data("index"));
				$(".theater ul li").removeClass("selected");
				$(this).addClass("selected");
				
				
				//날짜 값 + 시간값
				var select_time= $("#sDate").val() +" "+$(this).data("time");
				$("#select_day").text(select_time);
				
				//seatCount
				$("#seatCount").val($(this).parent().parent().data("seatcount"));
				
				
				//theater
				$("#select_theater").text($(this).parent().parent().data("floor"));
				$("#theaterName").val($(this).parent().parent().data("floor"));
				
				//filmType
				$("#select_movieType").text($(this).parent().parent().data("name"));
				$("#filmType").val($(this).parent().parent().data("name"));
				
				$(".row.movie_type").css("display","block");
				$(".tnb.step1 .btn-right").addClass("on");
				
				timeDimmedCheck();
			}
			
		});
		
		
		
		
		
		//좌석예매페이지로 이동
		$(".tnb_container").on("click",".tnb.step1 .btn-right",function(){
			if($(this).hasClass("on") == true){
//				$("#data-from").submit();
				//alert("전송전송");
				
				$.ajax({
					url : '../reservation/seatReservation',
					type : 'post',
					data : {
						movieNum : $("#movieNum").val(),
						movieTimeNum : $("#movieTimeNum").val(),
						cinemaName : $("#cinemaName").val(),
						theaterName : $("#theaterName").val(),
						filmType : $("#filmType").val(),
						seatCount : $("#seatCount").val(),
						_csrf : $("#_csrf").val()
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(result){
//						console.log(result);
						$(".step.step1").css("display","none");
						$(".ticket_tnb .tnb_container .tnb").removeClass("step1");
						$(".ticket_tnb .tnb_container .tnb").addClass("step2");
						$(".ticket_tnb .tnb.step2 .btn-left").css("display","block");
						
						
						$(".step.step2").css("display","block");
						$(".step.step2").html(result);
					}
					
				});
				
			}else{
				alert("선택해주세요");
			}
			
		});
		
		
		
		//결제하기 페이지로 이동
		$(".tnb_container").on("click",".tnb.step2 .btn-right",function(){
			if($(this).hasClass("on")){
				alert("payment");
				//결제진행 - ajax()
				$.ajax({
					url : '../reservation/reservePayment',
					type : 'post',
					data : {
						_csrf : $("#_csrf").val()
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(result){
//						console.log(result);
						$(".step.step2").css("display","none");
						$(".ticket_tnb .tnb_container .tnb").removeClass("step2");
						$(".ticket_tnb .tnb_container .tnb").addClass("step3");
						
						//할인 - 결제수단 결정 페이지
						$(".ticket_tnb .tnb.step3 .btn-left").css("display","block");
						
						$(".step.step3").css("display","block");
						$(".step.step3").html(result);
					}
				});
				
			}else{
				if(totalCount == 0){
					alert("관람인원을 선택하여 주세요");
				}else{
					alert("관람인원과 선택좌석수가 동일하지 않습니다.");
				}
			}
		});
		
		
		
		
		//뒤로가기 버튼 - 영화예매로 이동
		$(".ticket_tnb").on("click",".tnb.step2 .btn-left",function(){
			alert("aa")
			$(".steps .step2").empty();
			
			$(".steps .step.step2").css("display","none");
			$(".steps .step.step1").css("display","block");
			
			$(".ticket_tnb .tnb_container .tnb").removeClass("step2");
			$(".ticket_tnb .tnb_container .tnb").addClass("step1");
			
			$(".info.seat").css("display","none");
			$(".info.payment-ticket").css("display","none");
			$(".info.path").css("display","block");
			$(".info.theater .row.number .data").text("");
			
			$(".tnb.step1 .btn-right").addClass("on");
		});
		
		
		//뒤로가기 버튼 - 좌석예매 이동
		$(".ticket_tnb").on("click",".tnb.step3 .btn-left",function(){
			alert("aa")
			$(".steps .step.step3").empty();
			
			$(".steps .step.step3").css("display","none");
			$(".steps .step.step2").css("display","block");
			
			$(".ticket_tnb .tnb_container .tnb").removeClass("step3");
			$(".ticket_tnb .tnb_container .tnb").addClass("step2");
			
			$(".info.payment-ticket").css("display","block");
			
			$(".tnb.step2 .btn-right").addClass("on");
		});
		
		
		//스크롤 이동
		$("#movie-list-content").scroll(function () {
			var height = $(this).scrollTop();
			
			$(".movie-list .slider").css("top",height);
			console.log(height);
			
		});

		
	
	//menu tab클리하여 ajax로 값 변경(정렬 방법 선택)
	$(".btn-rank").click(function(){
		$.get("./movieListSort?kind=rate",function(result){
			console.log(result);
			$("#movie-list-content").html(result);
		});
	});
	
	$(".btn-abc").click(function(){
		$.get("./movieListSort?kind=title",function(result){
			console.log(result);
			$("#movie-list-content").html(result);
		});
	});
	
	

	function removeComma(str)
	{
		n = parseInt(str.replace(/,/g,""));
		return n;
	}



	
	
	
	
	
	