/**
 * 
 */
	var commonCount = 0;  //일반
	var teenagerCount = 0;  //청소년 
	var preferenceCount = 0;  //우대
	
	var totalCount = 0;  //일반 + 청소년 + 우대
	var selectedCount = 0; //선택된 좌석의 개수
	
	//값 회귀용
	var preCommon = 0;  //일반 (term)
	var preTeenager = 0;  //청소년  (term)
	var prePreference = 0;  //우대 (term)
	
	//금액 계산용
	var amountCommon = 0; 
	var amountTeenager = 0;
	var amountPreference = 0;
	
	var totalCommonPay = 0;
	var totalTeenagerPay = 0;
	var totalPreferencePay = 0;
	
	
	//좌석,좌석등급 출력용
	var selectedSeatList = [];
	var selectedSeatGrade = [];
	
	var selectedSeatNumList = [];
	
	
	$(".group.adult.common ul li:first").addClass("selected");
	$(".group.adult.teenager ul li:first").addClass("selected");
	$(".group.adult.preference ul li:first").addClass("selected");

	$(".btn-right").removeClass("on");
	
	//일반 인원 수 선택
	$(".group.adult.common ul li").click(function(){
//		console.log($(this).data("index"));
		
		commonCount = $(this).data("index");
		var check = countCheck();
		var check2 = selectedSeatAndCountCheck();
		
		if(check && check2){
			$(".group.adult.common ul li").removeClass("selected");
			$(this).addClass("selected");
			
			preCommon = commonCount;
			amountCommon = commonCount;
			
			seatCountListMake();
			allSelectedCheck();
		}else{
			commonCount = preCommon;
		}
		
		seatCountListMake();
		
		personCheck();
	});
	
	//청소년 인원 수 선택
	$(".group.adult.teenager ul li").click(function(){
//		console.log($(this).data("index"));
		
		teenagerCount = $(this).data("index");
		var check = countCheck();
		var check2 = selectedSeatAndCountCheck();
		
		if(check && check2){
			$(".group.adult.teenager ul li").removeClass("selected");
			$(this).addClass("selected");
			preTeenager = teenagerCount;
			amountTeenager = teenagerCount;
			
			seatCountListMake();
			allSelectedCheck();
		}else{
			teenagerCount = preTeenager;
		}
		
		personCheck();
	});
	
	//우대 인원 수 선택
	$(".group.adult.preference ul li").click(function(){
//		console.log($(this).data("index"));
		
		preferenceCount = $(this).data("index");
		
		var check = countCheck();
		var check2 = selectedSeatAndCountCheck();
		
		if(check && check2){
			$(".group.adult.preference ul li").removeClass("selected");
			$(this).addClass("selected");
			prePreference = preferenceCount;
			amountPreference = preferenceCount;
			
			seatCountListMake();
			allSelectedCheck();
		}else{
			preferenceCount = prePreference;
		}
		
		personCheck();
	});
	
	
	//인원 미선택시 dimmed 활성화 상태 
	function personCheck(){
		if(totalCount > 0){
			$("#ticket .section-seat").removeClass("dimmed");
		}else{
			if(selectedCount == 0){
				$("#ticket .section-seat").addClass("dimmed");
			}
			
		}
	}
	
	
	//전체 선택완료 했는지를 검사
	function allSelectedCheck(){
		if(totalCount == selectedCount && totalCount != 0){
			$(".tnb.step2 .btn-right").addClass("on");
		}else{
			$(".tnb.step2 .btn-right").removeClass("on");
		}
	}
	
	
	
	//각 선택시 리스트에 추가된 인원값 추가 (일반 1명 )식으로 저장
	function seatCountListMake(){
		
		var seatCount = {
				'common' : commonCount,
				'teenager' : teenagerCount,
				'special':preferenceCount
		}
		
//		console.log(seatCount);
//		console.log(seatCount['common']);
//		console.log(seatCount['teenager']);
//		console.log(seatCount['special']);
		
		var cNum = seatCount['common'];
		var tNum = seatCount['teenager'];
		var sNum = seatCount['special'];
		
		var list = [];
		if(cNum > 0){
			list.push("일반 "+ cNum+"명");
		}
		if(tNum > 0){
			list.push("청소년 "+tNum+"명")
		}
		if(sNum > 0){
			list.push("우대 "+sNum+"명")
		}
//		console.log(list.join(","));
		$(".row.number .data").text(list.join(","));
		
		
	}
	
	
	
	
	function countCheck(){
		totalCount = commonCount + teenagerCount + preferenceCount;
//		console.log("totalCount : "+ totalCount);
		if(totalCount > 8){
			alert("8명까지만 예약 가능합니다.");
			return false;
		}
		return true;
	}
	
	function selectedSeatAndCountCheck(){
		if(selectedCount > totalCount){
			alert("선택된 좌석 값보다 작습니다.");
			return false;
		}
		return true;
	}
	
	

	//hover
	$(".seats .seat").hover(function(){
		if(!$(this).hasClass("blocked") && !$(this).hasClass("reserved") && !$(this).hasClass("selected")){
			var check1 = true;
			var check2 = false;
			//2개 출력
			if((totalCount - selectedCount) != 1){
				if(!$(this).next().hasClass("blocked") && !$(this).next().hasClass("reserved") && !$(this).next().hasClass("selected")){
						//띄워져있는지 검사
						for(i=0;i<seatSpaceList.length;i++){
							if(seatSpaceList[i].type == 1){  //col
								if($(this).data("col") == seatSpaceList[i].index){
									if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved") && !$(this).prev().hasClass("selected")){
										$(this).prev().addClass("preSelect");
										check1 = false;
									}
								}
							}
						}

						//마지막줄인지 검사
						if($(this).data("col") == maxCol){
							if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved") && !$(this).prev().hasClass("selected")){
								$(this).prev().addClass("preSelect");
							}
						}else{
							check2 = true;
						}
						
						if(check1 && check2){
							$(this).next().addClass("preSelect");
						}
					}
				
					if($(this).next().hasClass("blocked") || $(this).next().hasClass("reserved") || $(this).next().hasClass("selected")){
						if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved") && !$(this).prev().hasClass("selected")){
							//띄워져있는지 검사
							for(i=0;i<seatSpaceList.length;i++){
								if(seatSpaceList[i].type == 1){  //col
									if($(this).prev().data("col") != seatSpaceList[i].index){
										$(this).prev().addClass("preSelect");
									}
								}
							}
						}
					}
				}
				
			
			//하나만 출력
//			console.log("ffffff")
			$(this).addClass("preSelect");
		}
		
	},function(){
		$(this).removeClass("preSelect");
		$(this).next().removeClass("preSelect");
		$(this).prev().removeClass("preSelect");
	});
	
	

	
	
	//클릭
	$(".seats .seat").click(function(){
		if($(this).hasClass("selected") && ($(this).next().hasClass("selected") || $(this).prev().hasClass("selected"))){
			//붙은 자리일때 경고 문구 띄워주고 yes일 시 지움
			var check = confirm("붙임좌석으로 선택한 좌석입니다.\n정말로 취소하시겠습니까?");
			if(check){
				//왼쪽에 있는지 오른쪽에 있는지 파악
				if($(this).hasClass("selected") && $(this).next().hasClass("selected")){
					//오른쪽 삭제
					
					$(this).next().removeClass("selected");
//					console.log("next : "+$(this).next().parent().parent().prev().text()+"-"+$(this).next().find(".no").text());
//					console.log("index : "+selectedSeatList.indexOf($(this).next().parent().parent().prev().text()+"-"+$(this).next().find(".no").text()));
					selectedSeatList.splice(selectedSeatList.indexOf($(this).next().parent().parent().prev().text()+""+$(this).next().find(".no").text()),1);
					
//					console.log("remove next() Grade : "+ $(this).data("grade"));
//					console.log("remove index grade : "+ selectedSeatGrade.indexOf($(this).data("grade")));
					
//					selectedSeatGrade.splice(selectedSeatGrade.indexOf($(this).next().data("grade")),1);
					
				}else if($(this).hasClass("selected") && $(this).prev().hasClass("selected")){
					//왼쪽 삭제
					
					$(this).prev().removeClass("selected");
//					console.log("prev : "+$(this).prev().parent().parent().prev().text()+"-"+$(this).prev().find(".no").text());
//					console.log("index : "+selectedSeatList.indexOf($(this).prev().parent().parent().prev().text()+"-"+$(this).prev().find(".no").text()));
					selectedSeatList.splice(selectedSeatList.indexOf($(this).prev().parent().parent().prev().text()+""+$(this).prev().find(".no").text()),1);

//					console.log("remove prev() Grade : "+ $(this).data("grade"));
//					console.log("remove index grade : "+ selectedSeatGrade.indexOf($(this).data("grade")));
//					selectedSeatGrade.splice(selectedSeatGrade.indexOf($(this).prev().data("grade")),1);
				}
				
				$(this).removeClass("selected");
				selectedCount = selectedCount - 2;
//				console.log("this : "+$(this).parent().parent().prev().text()+"-"+$(this).find(".no").text());
//				console.log("index : "+selectedSeatList.indexOf($(this).parent().parent().prev().text()+"-"+$(this).find(".no").text()));
				selectedSeatList.splice(selectedSeatList.indexOf($(this).parent().parent().prev().text()+""+$(this).find(".no").text()),1);
				
//				console.log("remove basic() Grade : "+ $(this).data("grade"));
//				console.log("remove index grade : "+ selectedSeatGrade.indexOf($(this).data("grade")));
			
//				selectedSeatGrade.splice(selectedSeatGrade.indexOf($(this).data("grade")),1);
				
				//삭제후 화면 출력값 갱신
				console.log(selectedSeatList);
				$("#select_Seat").text(selectedSeatList.join(","));
				
//				console.log(selectedSeatGrade);
				var gradeText = gradeTextMake(selectedSeatGrade);
				$("#select_seat_grade").text(gradeText);
				
				//삭제시 결제값 변경
//				console.log("선택값들 : "+commonCount+" "+teenagerCount+" "+preferenceCount);
				amountCommon = commonCount;
				amountTeenager = teenagerCount;
				amountPreference = preferenceCount;
				
				$(".row.payment-adult").css("display","none");
				$(".row.payment-youth").css("display","none"); 
				$(".row.payment-special").css("display","none"); 
				$(".row.payment-final").css("display","none"); 
				
				textInput();
				
				
				
			}
				
		}else if($(this).hasClass("selected")){
			//1명 자리일때 그냥 지움
			$(this).removeClass("selected");
			selectedCount = selectedCount - 1;
			selectedSeatList.splice(selectedSeatList.indexOf($(this).parent().parent().prev().text()+""+$(this).find(".no").text()),1);
//			console.log(selectedSeatList);
			$("#select_Seat").text(selectedSeatList.join(","));
			
//			console.log("remove basic() Grade : "+ $(this).data("grade"));
//			console.log("remove index grade : "+ selectedSeatGrade.indexOf($(this).data("grade")));
//			console.log(selectedSeatGrade);
			var gradeText = gradeTextMake(selectedSeatGrade);
			$("#select_seat_grade").text(gradeText);
				
		}else{
			//좌석 추가
			if(!$(this).hasClass("reserved") && !$(this).hasClass("blocked") && !$(this).hasClass("selected")){
//				console.log("total : "+ totalCount);
//				console.log("select : "+ selectedCount);
				
				var preCheck = preSelectCountCheck();
				var char = (totalCount-selectedCount)*1;
				
//				console.log("남은값 : "+char)
				//preSelect가 2이상 존재 할때 실행
				if(preCheck == 2){  
					if(totalCount-selectedCount > 1){
						
							var check1 = true;
							var check2 = false;
							
							//2개 출력
							if((totalCount - selectedCount) != 1){
								//오른쪽 검사
								if(!$(this).next().hasClass("blocked") && !$(this).next().hasClass("reserved") && !$(this).next().hasClass("selected")){
										//띄워져있는지 검사
										for(i=0;i<seatSpaceList.length;i++){
											if(seatSpaceList[i].type == 1){  //col
												
												if($(this).data("col") == seatSpaceList[i].index){
													if($(this).prev().hasClass("blocked") || $(this).prev().hasClass("reserved") || $(this).prev().hasClass("selected")){
														check1 = false;
													}else{
														selectedCount = selectedCount + 2;
														var check = selectedCountCheck(2);
														if(check){
															$(this).prev().addClass("selected");
															$(this).addClass("selected");
															
															console.log("prev()");
															console.log($(this).parent().parent().prev().text()+""+$(this).prev().find(".no").text());
															console.log($(this).parent().parent().prev().text()+""+$(this).find(".no").text());
															
															var gradeType = $(this).data("grade");
															
														}
														check1 = false;
													}
												}
												
//												console.log($(this).data("col") + " / "+seatSpaceList[i].index)
//												console.log(check1);
											}
										}

										//마지막줄인지 검사
										if($(this).data("col") == maxCol){
											if(!$(this).prev().hasClass("blocked") && !$(this).prev().hasClass("reserved") && !$(this).prev().hasClass("selected")){
												selectedCount = selectedCount + 2;
												var check = selectedCountCheck(2);
												if(check){
													$(this).prev().addClass("selected");
													$(this).addClass("selected");
													
													console.log("prev()");
													console.log($(this).parent().parent().prev().text()+""+$(this).prev().find(".no").text());
													console.log($(this).parent().parent().prev().text()+""+$(this).find(".no").text());
													
													var gradeType = $(this).data("grade");
													
												}
											}
										}else{
											check2 = true;
										}
										
//										console.log(check1 + " "+check2);
										if(check1 && check2){
											selectedCount = selectedCount + 2;
											var check = selectedCountCheck(2);
											if(check){
												$(this).next().addClass("selected");
												$(this).addClass("selected");
												
												console.log("열 : "+$(this).find(".no").text());
												console.log("열 : "+$(this).next().find(".no").text());
												console.log("행 : "+ $(this).parent().parent().prev().text());
												
												console.log("next()");
												console.log($(this).parent().parent().prev().text()+""+$(this).find(".no").text());
												console.log($(this).parent().parent().prev().text()+""+$(this).next().find(".no").text());
												
												var gradeType = $(this).data("grade");
											}
										}
									
									//hover가 2칸이 안잡히면 자동으로 1칸만 등록 되므로 여기서는 그냥 클릭되면 -> 클릭한 자신 + prev() 셀렉트 해주면 됨 (구별은 호버에서)
									}else if($(this).next().hasClass("blocked") || $(this).next().hasClass("reserved") || $(this).next().hasClass("selected")){
										selectedCount = selectedCount + 2;
										$(this).addClass("selected");
										$(this).prev().addClass("selected");
										
									}
								
							//}
						}
						
						console.log("select : "+ selectedCount);
						console.log("cha : "+ (totalCount-selectedCount)*1);
						console.log("-----------------------------")
					
						//--------------------------------------------------------------------------------------------------------------------------------------------------------------------ㄴ
						//--------------------------------------------------------------------------------------------------------------------------------------------------------------------ㄴ						
					}else if(char == 0){
						alert("모든 좌석 선택했음111");
					}
					
					
				}else{
					//1명선택
//					console.log("normal()")
					selectedCount = selectedCount + 1;  
					var check = selectedCountCheck(1);
					if(check){
						$(this).addClass("selected");
//						console.log("열 : "+$(this).find(".no").text());
//						console.log("행 : "+ $(this).parent().parent().prev().text());
						
//						console.log($(this).data("grade"));
						console.log("normal()");
						console.log($(this).parent().parent().prev().text()+""+$(this).find(".no").text());
						
						//계산 - eachGradePayment(gradeType,num)
						var gradeType = $(this).data("grade");
//						console.log("gradeType : "+ gradeType);
					}
//					console.log("select : "+ selectedCount);
//					console.log("cha : "+ (totalCount-selectedCount)*1);
//					console.log("-----------------------------")
				}
				
			}
			
			textInput();
			
		}
		priceCount();
		
		//전좌석 선택 완료
		allSelectedCheck();
		
		//좌석 선택시 CSS display 변경
		console.log(selectedCount);
		if(selectedCount > 0){
			$(".info.seat").css("display","block");
			$(".info.payment-ticket").css("display","block");
			$(".info.path").css("display","none");
		}else{
			$(".info.seat").css("display","none");
			$(".info.payment-ticket").css("display","none");
			$(".info.path").css("display","block");
		}
		
	});
	
	
	//선택한 좌석값이 지정한 총 좌석수보다 큰지를 판단
	function selectedCountCheck(num){
		
//		console.log("num : "+ num);
//		console.log("selected : "+ selectedCount);
//		console.log("totalCount : "+ totalCount);

		if(totalCount < selectedCount){
//			console.log("false리턴");
			selectedCount = selectedCount - num;
			return false;
		}else{
//			console.log("true리턴");
			return true;
		}
	}
	
	
	//preSelect가 몇개를 나타내는지(1 or 2)
	function preSelectCountCheck(){
		var a = 0;
		
		$(".seats .seat").each(function(){
			if($(this).hasClass("preSelect")){
				a = a+1;
			}
		})
//		console.log("preSelectCount : "+ a);
//		
		return a;
	}
	
	//선택한 좌석을 list에 넣어서 text()에 출력
	function textInput(){
		selectedSeatList = [];
		selectedSeatGrade = [];
		selectedSeatNumList = [];
		
		$(".seats .seat").each(function(){
			if($(this).hasClass("selected")){
				
				
				selectedSeatList.push($(this).parent().parent().prev().text()+""+$(this).find(".no").text());
				selectedSeatNumList.push($(this).find(".sreader.seatNum").text());
				selectedSeatGrade.push($(this).data("grade"));
				//Economy Standard Prime
				
				console.log("seatNum : "+selectedSeatNumList);
				
				
//				console.log($(this).data("grade"));
//				console.log($(this).parent().parent().prev().text()+"-"+$(this).find(".no").text());
			}
		});
//		console.log(selectedSeatList);
//		console.log(selectedSeatList.join(","));
//		console.log(selectedSeatGrade.sort());
//		console.log(selectedSeatGrade);
		
		var gradeText = gradeTextMake(selectedSeatGrade);
		
//		console.log(gradeText);
		$("#select_Seat").text(selectedSeatList.join(","));
		$("#select_seat_grade").text(gradeText);
	}
	
	function gradeTextMake(gradeList){
		var gradeText = "";
//		var a = gradeList.shift();
		
		var a = gradeList[0];
//		console.log(a);
		
		if(a == 1){
			gradeText = "Economy석";
		}else if(a == 2){
			gradeText = "Standard석";
		}else if(a == 3){
			gradeText = "Prime석";
		}else{
			gradeText ="";
		}
		
		return gradeText;
	}
	
	
	
	//eachGradePayment(grade구분/몇명인지 구분)
	function eachGradePayment(gradeType,num){
		
		//amountCommon
		//amountTeenager
		//amountPreference

		//일반일때 계산
		if(amountCommon > 0){
			amountCommon = amountCommon - num;
			
			var check = true;
			
			if(amountCommon < 0){
				num = 1;
			}
				
			switch (gradeType) {
			case 1: //Economy - 8000
				totalCommonPay = totalCommonPay + (num * 8000);
				break;
			case 2: //Standard - 9000
				totalCommonPay = totalCommonPay + (num * 9000);
				break;
			case 3: //Prime - 10000
				totalCommonPay = totalCommonPay + (num * 10000);
				break;
			}
			
			$(".row.payment-adult").css("display","block"); 
			$(".payment-ticket .payment-adult .data .price").text(addComma(totalCommonPay)+"원");
			
			if(check){
				return totalCommonPay;
			}
			
		}
		//청소년일때 계산
		if(amountTeenager > 0){
			amountTeenager = amountTeenager - num;
			
			var check = true;
			
			if(amountTeenager < 0){
				num = 1;
				chck = false;
			}
			
			switch (gradeType) {
			case 1: //Economy - 6000
				totalTeenagerPay = totalTeenagerPay + (num * 6000);
				break;
			case 2: //Standard - 7000
				totalTeenagerPay = totalTeenagerPay + (num * 7000);
				break;
			case 3: //Prime - 8000
				totalTeenagerPay = totalTeenagerPay + (num * 8000);
				break;

			default:
				break;
			}
			
			$(".row.payment-youth").css("display","block"); 
			$(".payment-ticket .payment-youth .data .price").text(addComma(totalTeenagerPay)+"원");
			
			if(check){
				return totalTeenagerPay;
			}
		}
		
		//우대일때 계산
		if(amountPreference > 0){
			amountPreference = amountPreference - num;
			
			var check = true;
			
			if(amountPreference < 0){
				num = 1;
				chck = false;
			}
			
			totalPreferencePay = totalPreferencePay + (num * 5000);
			
			$(".row.payment-special").css("display","block"); 
			$(".payment-ticket .payment-special .data .price").text(addComma(totalPreferencePay)+"원");
			
			return totalPreferencePay;
		}
	}
	
	
	
	function priceCount(){

//		console.log("sort : "+selectedSeatGrade.sort());
		
		for(i=0;i<selectedSeatGrade.length;i++){
//			console.log(i + " : "+selectedSeatGrade[i]);
			
			if(selectedSeatGrade[i] == 1){ //Economy
				eachGradePayment(1,1)
				
			}else if(selectedSeatGrade[i] == 2){ //Standard
				eachGradePayment(2,1)
				
			}else if(selectedSeatGrade[i] == 3){ //Prime
				eachGradePayment(3,1)
			}
			
			console.log("일반 : "+ amountCommon);
			console.log("청소 : "+ amountTeenager);
			console.log("우대 : "+ amountPreference);
			
			console.log("일반 : "+ totalCommonPay);
			console.log("청소 : "+ totalTeenagerPay);
			console.log("우대 : "+ totalPreferencePay);
			console.log("---")
			
			//총 가격 출력
			var totalPay = totalCommonPay + totalTeenagerPay + totalPreferencePay;
			$(".row.payment-final").css("display","block"); 
			$(".payment-ticket .payment-final .data .price").attr("title",totalPay);
			$(".payment-ticket .payment-final .data .price").text(addComma(totalPay));
		}
		
		//다시 좌석을 선택시 값을 리셋
		amountCommon = preCommon;
		amountTeenager = preTeenager;
		amountPreference = prePreference;
		totalCommonPay = 0;
		totalTeenagerPay = 0;
		totalPreferencePay = 0;
		
	}
	
	
	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	