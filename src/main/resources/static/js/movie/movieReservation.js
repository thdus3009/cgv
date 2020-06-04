/**
 * 
 */

$(function() {
	
		//class selected값 변경
		$(".sortmenu a").click(function() {
			$(".sortmenu a").removeClass("selected");
			$(this).addClass("selected");
		});
		
		
		$("#movie-list-content li").click(function() {
			$("#movie-list-content li").removeClass("selected");
			$(this).addClass("selected");
			
			
			$(".movie_poster img").css("display","inline");
			$(".movie_title").css("display","block");
			
			$(".movie .placeholder").css("display","none");
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
	
	
	
	
	
	
	
	
	
	