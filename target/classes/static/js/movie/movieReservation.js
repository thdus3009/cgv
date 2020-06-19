
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
		$("#movie-list-content li").click(function() {
			$("#movie-list-content li").removeClass("selected");
			$(this).addClass("selected");
			
			$("#select_title").text($(this).data("title"));
			$("#select_image").attr("src","../images/movie/movieList/filmCover/"+$(this).data("image"));
			$("#select_ageLimit").text($(this).data("age_limit"));
			title = $(this).data("title");
			
			
			$(".movie_poster img").css("display","inline");
			$(".movie_title").css("display","block");
			
			$(".movie .placeholder").css("display","none");
			
//			console.log("title : "+title);
//			console.log("theater : "+theater);
//			console.log("date : "+date);
			
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
				}
			
			});
			
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
			$(".area_theater_list li").removeClass("selected");
			$(this).addClass("selected");
//			console.log($(this).data("theater"))
			theater = $(this).data("theater");
			
			$("#select_cinema").text($(this).data("theater"));
			$(".row.name").css("display","block");
			$(".row.date").css("display","block");
			$(".row.screen").css("display","block");
			$(".row.number").css("display","block");
			$(".info.theater .placeholder").css("display","none");
			
//			console.log("title : "+title);
//			console.log("theater : "+theater);
//			console.log("date : "+date);
			
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
						console.log(result[i].movieVOs[0].title+" "+result[i].movieTimeVOs[0].screenDate)// 영화제목 , 날짜
						
						$("#movie-list-content li").each(function(){
							//console.log("aaaaa : "+$(this).data("title"))
							if($(this).data("title") == result[i].movieVOs[0].title){
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
				}
			});
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
			$(".date-list ul li.day").removeClass("selected");
			$(this).addClass("selected");
			//console.log($(this).data("year")+" "+$(this).data("month")+" "+$(this).data("date")+" "+$(this).data("week"));
			$("#select_day").text($(this).data("year")+"."+$(this).data("month")+"."+$(this).data("date")+"("+$(this).data("week")+")")
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
//						console.log(result[i].movieVOs[0].title+" "+result[i].cinemaVOs[0].name);// 영화제목 , 극장명
						
						//영화
						$("#movie-list-content li").each(function(){
							//console.log("aaaaa : "+$(this).data("title"))
							if($(this).data("title") == result[i].movieVOs[0].title){
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
				}
			
			});
		});
		
		
		
		
		
		
		
		
		
		
		
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
	
	
	
	
	
	
	
	
	
	