
	
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
	
	
	//상영 20분 전 예매 불가능
	timeDimmedCheck();
}
		

//DateFormat
Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";

    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};

String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };



function timeDimmedCheck(){
	var nowDate = new Date();
	console.log("현재 시간 : "+nowDate)

	var nowTime = nowDate.format("yyyy-MM-dd");
	
	//누른날짜랑 현재 지금 날짜랑 동일 할때
	//시간이 지나있으면 disabled
	//읽어온 시간 값이 현재시간 20분 뒤면 disabled
	
	if(nowTime == date){
		$(".time-list ul li").each(function(){
			console.log("읽어온 시간 : "+$(this).data("time"));
			var arr = $(this).data("time").split(":");
			var readDate = new Date(nowDate.getFullYear(),nowDate.getMonth(),nowDate.getDate(),arr[0],arr[1]);
			//console.log("읽은 시간 :  "+readTime)
			
			var resultTime = readDate - nowDate;
			var mi = (Math.floor((resultTime % (1000 * 60 * 60)) / (1000 * 60)))+1;
			console.log("minute : "+mi);
			
			if(mi < 20){
				$(this).addClass("disabled");
			}
			
		});
	}
}



//if($(this).data("time") == 0){
//	$(this).addClass("disabled");
//}
		
		
		
		
		
		
		
		
		
		
		
		
		
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

	}

});

		
		
		
		
//좌석예매페이지로 이동
$(".tnb_container").on("click",".tnb.step1 .btn-right",function(){
	if($(this).hasClass("on") == true){
//		$("#data-from").submit();
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
//				console.log(result);
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
//				console.log(result);
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



	
	
	
	
	
	