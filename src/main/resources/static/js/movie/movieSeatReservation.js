/**
 * 
 */
	var commonCount = 0;
	var teenagerCount = 0;
	var preferenceCount = 0;
	
	var totalCount = 0;
	var selectedCount = 0;
	
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
		totalCount = commonCount + teenagerCount + preferenceCount;
//		console.log("totalCount : "+ totalCount);
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
			//붙은 자리일때 경고 문구 띄워주고 yes일 시 지움
			var check = confirm("붙임좌석으로 선택한 좌석입니다.\n정말로 취소하시겠습니까?");
			if(check){
				$(this).removeClass("selected");
				$(this).next().removeClass("selected");
				$(this).prev().removeClass("selected");
			}
				
		}else if($(this).hasClass("selected")){
			//1명 자리일때 그냥 지움
			$(this).removeClass("selected");
			
		}else{
			//선택가능
			if(!$(this).hasClass("reserved") && !$(this).hasClass("blocked")){
				console.log("total : "+ totalCount);
				console.log("select : "+ selectedCount);
				console.log("cha : "+ (totalCount-selectedCount)*1);
				
				if(totalCount-selectedCount > 1){
					if($(this).next().hasClass("blocked") || $(this).next().hasClass("reserved")){
						
						//2명선택
						console.log("prev()")
						selectedCount = selectedCount + 2;
						var check = selectedCountCheck(2);
						if(check){
							$(this).prev().addClass("selected");
							$(this).addClass("selected");
						}
						
					}else if($(this).prev().hasClass("blocked") || $(this).prev().hasClass("reserved")){
						//2명선택
						console.log("next()")
						selectedCount = selectedCount + 2;
						var check = selectedCountCheck(2);
						if(check){
							$(this).next().addClass("selected");
							$(this).addClass("selected");
						}
					}
				}else if(totalCount-selectedCount == 0){
					alert("모든 좌석 선택했음");
					
				}else{
					//1명선택
					console.log("normal()")
					selectedCount = selectedCount + 1;  
					var check = selectedCountCheck(1);
					if(check){
						$(this).addClass("selected");
					}
					
				}
				
			}
		}
	});
	
	
	function selectedCountCheck(num){
		
//		console.log("num : "+ num);
//		console.log("selected : "+ selectedCount);
//		console.log("totalCount : "+ totalCount);
		
		
		if(totalCount < selectedCount){
			console.log("false리턴");
			console.log("-----------------------------")
			selectedCount = selectedCount - num;
			return false;
		}else{
			console.log("true리턴");
			console.log("-----------------------------")
			return true;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	