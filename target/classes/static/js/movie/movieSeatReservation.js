/**
 * 
 */
	var commonCount = 0;
	var teenagerCount = 0;
	var preferenceCount = 0;
	
	$(".group.adult.common ul li:first").addClass("selected");
	$(".group.adult.teenager ul li:first").addClass("selected");
	$(".group.adult.preference ul li:first").addClass("selected");


	$(".group.adult.common ul li").click(function(){
//		console.log($(this).data("index"));
		
		commonCount = $(this).data("index");
		var check = countCheck();
		if(check){
			$(".group.adult.common ul li").removeClass("selected");
			$(this).addClass("selected");
		}
		
	});
	
	$(".group.adult.teenager ul li").click(function(){
//		console.log($(this).data("index"));
		
		teenagerCount = $(this).data("index");
		var check = countCheck();
		if(check){
			$(".group.adult.teenager ul li").removeClass("selected");
			$(this).addClass("selected");
		}
		
	});
	
	$(".group.adult.preference ul li").click(function(){
//		console.log($(this).data("index"));
		
		preferenceCount = $(this).data("index");
		
		var check = countCheck();
		if(check){
			$(".group.adult.preference ul li").removeClass("selected");
			$(this).addClass("selected");
		
		}
	});
	
	
	function countCheck(){
		var totalCount = commonCount + teenagerCount + preferenceCount;
//		console.log("totalCount : "+totalCount);
		if(totalCount > 8){
			alert("8명까지만 예약 가능합니다.");
			return false;
		}
		return true;
	}
	
	
//	$(".seats .seat").click(function(){
//		if($(".seats .seat").hasClass("selected")){
//			var check = confirm("이미 좌석을 모두 선택하셨습니다. \n선택하신 좌석으로 변경하시겠습니까?");
//			if(check){
//				$(".seats .seat").removeClass("selected");
//				$(this).addClass("selected");
//			}
//			
//		}else{
//			$(".seats .seat").removeClass("selected");
//			$(this).addClass("selected");
//		}
//	});
	
	
	$(".seats .seat").hover(function(){
		$(".seats .seat").removeClass("selected");
		$(this).addClass("selected");
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	