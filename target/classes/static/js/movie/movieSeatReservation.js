/**
 * 
 */
	var commonCount = 0;
	var teenagerCount = 0;
	var preferenceCount = 0;
	
	var preCommon = 0;
	var preTeenager = 0;
	var prePreference = 0;
	
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
			
			preCommon = commonCount;
		}else{
			commonCount = preCommon;
		}
		
	});
	
	$(".group.adult.teenager ul li").click(function(){
//		console.log($(this).data("index"));
		
		teenagerCount = $(this).data("index");
		var check = countCheck();
		if(check){
			$(".group.adult.teenager ul li").removeClass("selected");
			$(this).addClass("selected");
			preTeenager = teenagerCount; 
		}else{
			teenagerCount = preTeenager;
		}
		
	});
	
	$(".group.adult.preference ul li").click(function(){
//		console.log($(this).data("index"));
		
		preferenceCount = $(this).data("index");
		
		var check = countCheck();
		if(check){
			$(".group.adult.preference ul li").removeClass("selected");
			$(this).addClass("selected");
			prePreference = preferenceCount;
		}else{
			preferenceCount = prePreference;
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
	
	

	//hover
	$(".seats .seat").hover(function(){
		if(!$(this).hasClass("blocked") && !$(this).hasClass("reserved")){
			$(this).addClass("preSelect");
			
			if(!$(this).next().hasClass("blocked") && !$(this).next().hasClass("reserved")){
				$(this).next().addClass("preSelect");
			}else if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved")){
				$(this).prev().addClass("preSelect");
			}
		}
		
	},function(){
		$(this).removeClass("preSelect");
		$(this).next().removeClass("preSelect");
		$(this).prev().removeClass("preSelect");
	});
	
	
	//클릭
	$(".seats .seat").click(function(){
		
		if($(this).hasClass("selected") && $(this).next().hasClass("selected") || $(this).prev().hasClass("selected")){
			var check = confirm("붙임좌석으로 선택한 좌석입니다.\n정말로 취소하시겠습니까?");
			
			if(check){
				$(this).removeClass("selected");
				$(this).next().removeClass("selected");
				$(this).prev().removeClass("selected");
			}
			
		}else if($(this).hasClass("selected")){
			$(this).removeClass("selected");
			
		}else{
			if(!$(this).hasClass("reserved") && !$(this).hasClass("blocked")){
				$(this).addClass("selected");
				if(!$(this).next().hasClass("blocked") && !$(this).next().hasClass("reserved")){
					$(this).next().addClass("selected");
					//2명선택
				}else if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved")){
					$(this).prev().addClass("selected");
					//2명선택
				}else{
					//1명선택
				}
			}
			
		}
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	