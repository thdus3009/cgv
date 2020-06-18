
$(function() {
	
		//class selected값 변경
		$(".sortmenu a").click(function() {
			$(".sortmenu a").removeClass("selected");
			$(this).addClass("selected");
		});
		
		//영화 이미지, 제목, 연령제한
		$("#movie-list-content li").click(function() {
			$("#movie-list-content li").removeClass("selected");
			$(this).addClass("selected");
			
			$("#select_title").text($(this).data("title"));
			$("#select_image").attr("src","../images/movie/movieList/filmCover/"+$(this).data("image"));
			$("#select_ageLimit").text($(this).data("age_limit"));

			
			
			$(".movie_poster img").css("display","inline");
			$(".movie_title").css("display","block");
			
			$(".movie .placeholder").css("display","none");
		});
		
		
		//지역선택
		$(".theater-area-list > ul > li").click(function(){
			$(".theater-area-list > ul > li").removeClass("selected");
			$(this).addClass("selected");
			
			console.log($(this).data("local"));
			var local = $(this).data("local")
			
			$.get("../cinema/localCinemaSearch?local="+local,function(result){
				//console.log(result);
				$("#cinema_ajax").html(result);
			});
		
			
		});
		
		
	 	//극장 선택
		$(".theater-list").on("click",".area_theater_list > ul > li",function(){
			$(".area_theater_list li").removeClass("selected");
			$(this).addClass("selected");
			console.log($(this).data("theater"))
			
			$("#select_cinema").text($(this).data("theater"));
			$(".row.name").css("display","block");
			$(".row.date").css("display","block");
			$(".row.screen").css("display","block");
			$(".row.number").css("display","block");
			$(".info.theater .placeholder").css("display","none");
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
		
		
		$(".date-list ul li.day").click(function(){
			$(".date-list ul li.day").removeClass("selected");
			$(this).addClass("selected");
			//console.log($(this).data("year")+" "+$(this).data("month")+" "+$(this).data("date")+" "+$(this).data("week"));
			$("#select_day").text($(this).data("year")+"."+$(this).data("month")+"."+$(this).data("date")+"("+$(this).data("week")+")")
			
			
			$(".row.name").css("display","block");
			$(".row.date").css("display","block");
			$(".row.screen").css("display","block");
			$(".row.number").css("display","block");
			$(".info.theater .placeholder").css("display","none");
		})
		
		
		
		
		
		
		
		
		
		
		
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
	
	
	
	
	
	
	
	
	
	