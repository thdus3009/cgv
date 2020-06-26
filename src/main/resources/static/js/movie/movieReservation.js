
$(function() {
	
		var title ="";
		var theater = "";
		var date = "";
	
//		console.log("title : "+title);
//		console.log("theater : "+theater);
//		console.log("date : "+date);
		
	
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
				
				if($(this).hasClass("selected")){
					//선택 취소
					$(this).removeClass("selected");
					title ="";
					
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
					
		//			console.log("title : "+title);
		//			console.log("theater : "+theater);
		//			console.log("date : "+date);
					
				}
				$.ajax({
					type:'GET',
					url:'../reserveCheck/reserve',
					data:{
						title:title,
						theater:theater,
						date:date
					},
					success:function(result){
//						console.log(result);
						
						
						//극장 . 날짜 
						//극장
						$(".theater-list li").addClass("dimmed");
						//날짜
						$(".date-list ul li.day").addClass("dimmed");
						
						//극장, 날짜
						for(i=0;i<result.length;i++){
	//						console.log(result[i].cinemaVOs[0].name+" "+result[i].movieTimeVOs[0].screenDate); // 극장 , 날짜
							
							//극장
							$(".theater-list li").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								if($(this).data("theater") == result[i].cinemaVOs[0].name){
									$(this).removeClass("dimmed");
								}
								
							});
							
							$(".date-list ul li.day").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								
								var str = result[i].movieTimeVOs[0].screenDate;
								var l = str.split('-');
								var y = l[0];
								var m = l[1];
								var d = l[2];
								
								var cy = $(this).data("year");
								var cm = $(this).data("month");
								var cd = $(this).data("date");
								
	//							console.log("=================================");
	//							console.log("읽은값 : "+y + " "+ m+" "+d);
	//							console.log("화면값 : "+cy + " "+ cm+" "+cd);
								
								if(cy == y && cm == m && cd == d ){
									$(this).removeClass("dimmed");
								}
								
							});
							
							
						}
						$(".time-list .content").html('');
						selectedCheck(result);
						
					}
				
				});
				
			}
		});
		
		
		//지역선택
		$(".theater-area-list > ul > li").click(function(){
			$(".theater-area-list > ul > li").removeClass("selected");
			$(this).addClass("selected");
			
			console.log($(this).data("local"));
//			var local = $(this).data("local")
//			
//			$.get("../cinema/localCinemaSearch?local="+local,function(result){
//				//console.log(result);
//				$("#cinema_ajax").html(result);
//			});
//		
//			
		});
		
		
		
		
		
	 	//극장 선택
		$(".theater-list").on("click",".area_theater_list > ul > li",function(){
			
			if($(this).hasClass("dimmed") === true){
				alert("선택할수 없습니다.");
			}else{
				
				if($(this).hasClass("selected")){
					//선택 취소
					$(this).removeClass("selected");
					theater ="";
				}else{
					$(".area_theater_list li").removeClass("selected");
					$(this).addClass("selected");
		//			console.log($(this).data("theater"))
					theater = $(this).data("theater");
					$("#cinemaName").val(theater);
					
					
					$("#select_cinema").text($(this).data("theater"));
					$(".row.name").css("display","block");
					$(".row.date").css("display","block");
					$(".row.screen").css("display","block");
					$(".row.number").css("display","block");
					$(".info.theater .placeholder").css("display","none");
					
		//			console.log("title : "+title);
		//			console.log("theater : "+theater);
		//			console.log("date : "+date);
				}
				
				$.ajax({
					type:'GET',
					url:'../reserveCheck/reserve',
					data:{
						title:title,
						theater:theater,
						date:date
					},
					success:function(result){
	//					console.log(result);
						//영화제목 . 날짜 
						//영화
						$("#movie-list-content li").addClass("dimmed");
						//날짜
						$(".date-list ul li.day").addClass("dimmed");
						
						
						for(i=0;i<result.length;i++){
							console.log(result[i].movieInfoVOs[0].title+" "+result[i].movieTimeVOs[0].screenDate)// 영화제목 , 날짜
							
							$("#movie-list-content li").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								if($(this).data("title") == result[i].movieInfoVOs[0].title){
									$(this).removeClass("dimmed");
								}
								
							});
							
							$(".date-list ul li.day").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								
								var str = result[i].movieTimeVOs[0].screenDate;
								var l = str.split('-');
								var y = l[0];
								var m = l[1];
								var d = l[2];
								
								var cy = $(this).data("year");
								var cm = $(this).data("month");
								var cd = $(this).data("date");
								
	//							console.log("=================================");
	//							console.log("읽은값 : "+y + " "+ m+" "+d);
	//							console.log("화면값 : "+cy + " "+ cm+" "+cd);
								
								if(cy == y && cm == m && cd == d ){
									$(this).removeClass("dimmed");
								}
								
							});
							
						}
						$(".time-list .content").html('');
						selectedCheck(result);
						
					}
					
					
				});
			
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
				
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					date="";
				}else{
					$(".date-list ul li.day").removeClass("selected");
					$(this).addClass("selected");
					//console.log($(this).data("year")+" "+$(this).data("month")+" "+$(this).data("date")+" "+$(this).data("week"));
					
					var str = $(this).data("year")+"."+$(this).data("month")+"."+$(this).data("date")+"("+$(this).data("week")+")";
					
					$("#sDate").val(str)
					
					$("#select_day").text(str);
					//date = $(this).data("year")+"-"+$(this).data("month")+"-"+$(this).data("date")
					var sYear = $(this).data("year");
					var sMonth = $(this).data("month")+"";
					var sDate = $(this).data("date")+"";
					
		//			console.log("length : "+sMonth.length);
		//			console.log("length : "+sDate.length);
					
					if(sMonth.length == 1){
						sMonth = "0"+sMonth;
					}
					if(sDate.length == 1){
						sDate = "0"+sDate;
					}
					
		//			console.log("length : "+sMonth.length);
		//			console.log("length : "+sDate.length);
					
					date = sYear+"-"+sMonth+"-"+sDate;
					
					$(".row.name").css("display","block");
					$(".row.date").css("display","block");
					$(".row.screen").css("display","block");
					$(".row.number").css("display","block");
					$(".info.theater .placeholder").css("display","none");
					
		//			console.log("title : "+title);
		//			console.log("theater : "+theater);
		//			console.log("date : "+date);
				}
				
				$.ajax({
					type:'GET',
					url:'../reserveCheck/reserve',
					data:{
						title:title,
						theater:theater,
						date:date
					},
					success:function(result){
	//					console.log(result);
	//					console.log(result.length);
	//				영화 . 극장정보 ============
						//영화
						$("#movie-list-content li").addClass("dimmed");
						//극장
						$(".theater-list li").addClass("dimmed");
						
						for(i=0;i<result.length;i++){
	//						console.log(result[i].movieInfoVOs[0].title+" "+result[i].cinemaVOs[0].name);// 영화제목 , 극장명
							
							//영화
							$("#movie-list-content li").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								if($(this).data("title") == result[i].movieInfoVOs[0].title){
									$(this).removeClass("dimmed");
								}
								
							});
							
							
							//극장
							$(".theater-list li").each(function(){
								//console.log("aaaaa : "+$(this).data("title"))
								if($(this).data("theater") == result[i].cinemaVOs[0].name){
									$(this).removeClass("dimmed");
								}
								
							});
							
						}
						$(".time-list .content").html('');
						selectedCheck(result);
					}
				
				});
			
			}
		});
		
		
		
		
		//3개다 체크했는지 여부 판단
		function selectedCheck(result){
			var cMovie = false;
			var cTheater = false;
			var cDate = false;
			
				
			if($(".movie-list ul li").hasClass("selected") === true){
				cMovie = true;
			}else{
				cMovie = false;
			}
			

			if($(".area_theater_list ul li").hasClass("selected") === true){
				cTheater = true;
			}else{
				cTheater = false;
			}
			
				
			if($(".date-list ul li.day").hasClass("selected") === true){
				cDate = true;
			}else{
				cDate = false;
			}
			
//			console.log("m : "+cMovie)
//			console.log("t : "+cTheater)
//			console.log("d : "+cDate)
			
			if(cMovie && cTheater && cDate){
//				console.log("INNN")
				$("#ticket .step1 .section-time .col-body .placeholder").css("display","none");
				$("#ticket .step1 .section-time .col-body .time-list").css("display","block");
				timeMake(result);
			}
		}
		
		
		//세개 다 선택했을 시 상영 시간 목록  HTML생성
		function timeMake(result){
			var list = [];
			
			for(i=0;i<result.length;i++){
//				console.log(result[i].movieTimeVOs[0].screenTime)				
				
				var fType = "";
				
				if(result[i].theaterVOs[0].filmType === 1){
					fType = '3D';
				}else if(result[i].theaterVOs[0].filmType === 2){
					fType = '4D';
				}else{
					fType = '2D';
				}
				
				
				var li = '<li data-time="'+ result[i].movieTimeVOs[0].screenTime +'" data-index="'+ result[i].movieTimeVOs[0].num +'">'
					+'<a class="button" href="#" title="">'
					+'<span class="time"><span>'+ result[i].movieTimeVOs[0].screenTime +'</span></span>'
					+'<span class="count">'+ result[i].movieTimeVOs[0].remainSeat +'석</span>'
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

				//				console.log(checkName+checkFloor +" "+result[i].movieTimeVOs[0].screenTime)
//				console.log("size: "+list.length)
				for(k=0;k<list.length;k++){
//					console.log("list["+ k +"] : "+list[k]);
					
					if(list[k] == checkName+checkFloor){
//						console.log("겹치는 값이 하나라도 존재 -> 쿼리 추가X");
						check = false;
					}
				}
				
				if(i != 0){
					$(".time-list .theater").each(function(){
//						console.log("있는값:"+ $(this).data("name")+$(this).data("floor"));
						
						if($(this).data("name") == checkName && $(this).data("floor") == checkFloor){
							$(this).find("ul").append(li);
						}
					});
					
					if(check){
//						console.log("없는 값이 추가 되므로 쿼리 추가");
						$(".time-list .content").append(query);
					}
					
				}else{
					$(".time-list .content").append(query);
				}
				
//				console.log("=================================");
				list.push(checkName+checkFloor);
				
				
				
			}
		}
		
		
		
		// 상영시간 선택
		$(".time-list").on("click",".theater ul li",function(){
			//console.log($(this).data("time"));
			//console.log($(this).data("index"));
			
			$("#movieTimeNum").val($(this).data("index"));
			$(".theater ul li").removeClass("selected");
			$(this).addClass("selected");
			
			var select_time= $("#sDate").val() +" "+$(this).data("time");
			$("#select_day").text(select_time);
			
//			console.log($(this).parent().parent().data("name"));
//			console.log($(this).parent().parent().data("floor"));
//			console.log($(this).parent().parent().data("seatcount"));
			
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
						seatCount : $("#seatCount").val()
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
				
				
				//payment();
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
						
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(result){
//						console.log(result);
						$(".step.step2").css("display","none");
//						$(".ticket_tnb .tnb.step2 .btn-left").css("display","block");
						
//						$(".ticket_tnb .tnb_container .tnb").removeClass("step2");
//						$(".ticket_tnb .tnb_container .tnb").addClass("step3");

						
						
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
		
		
		function payment(){
			
			var IMP = window.IMP; // 생략가능
		    IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		    
		    IMP.request_pay({
		        pg : 'inicis', // version 1.1.0부터 지원.
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '주문명:결제테스트',
		        amount : 100,
		        buyer_email : 'iamport@siot.do',
		        buyer_name : 'tm',
		        buyer_tel : '010-1234-5678',
		        buyer_addr : '서울특별시 강남구 삼성동',
		        buyer_postcode : '123-456',
		        m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		        }
		        alert(msg);
		    });
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//스크롤 이동
		$("#movie-list-content").scroll(function () {
			var height = $(this).scrollTop();
			
			$(".movie-list .slider").css("top",height);
			console.log(height);
			
		});
	})

	
	
	
	
	
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
	
	
	
	
	
	
	
	
	
	