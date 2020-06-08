
		var frm = document.getElementById("frm");

		var userID = document.getElementById("userID");
		var idc = document.getElementById("idc");
		
		var pwd1 = document.getElementById("userPWD");
		var pwd1c = document.getElementById("pwd1c");
		
		var pwd2 = document.getElementById("userPWD2");
		var pwd2c = document.getElementById("pwd2c");
		
		var ch_year = document.getElementById("ch_year");
		var ch_month = document.getElementById("ch_month");
		var ch_date = document.getElementById("ch_date");
		var birthc = document.getElementById("birthc");
		
		var check = document.getElementsByClassName("check");
		var btn = document.getElementById("btn");
		
		var idcheck = false;
		var pwdcheck = false;
		
		
		
		

		
//		월 옵션 생성
		var month_arr = '<option class="opt" selected="selected">월</option>';
		for(i=1;i<=12;i++){
			month_arr += '<option class="opt" value='+ i +'>'+i+'</option>';
		}
		ch_month.innerHTML = month_arr;
		var opt = document.getElementsByClassName("opt");
	
		var year_flag = false;
		var month_flag = false;
		var date_flag = false;
		
		birthc.style.color = "red";
		
		for(i=0;i<opt.length;i++){
			if(opt[i].selected){
				if(opt[i].innerText == "월"){
					month_flag = false;
				}else{
					month_flag = true;
				}
				break;
			}
		}
		
		
		
		ch_year.addEventListener("blur",function(){
			var num = ch_year.value*1;
			
			if(ch_year.value.length < 4){
				birthc.innerText = "year :태어난 년도 4자리를 정확히 입력하세요."
			}else{
				console.log(num);
				if(isNaN(num)){
					birthc.innerText = 'year :정확한 년도를 입력해주세요.';
				}else{
					year_flag = true;
					if(!month_flag){
						birthc.innerText = "year :태어난 월을 선택하세요."
					}else{
						if(!date_flag){
							birthc.innerText = "year :태어난 일(날짜) 2자리를 정확하게 입력하세요."
						}else{
							birthc.innerText = "";
						}
					}
				}
			}
		});
		
		ch_month.addEventListener("click",function(){
			if(year_flag){
				for(i=0;i<opt.length;i++){
					if(opt[i].selected){
						if(opt[i].innerText == "월"){
							month_flag = false;
						}else{
							month_flag = true;
						}
					}
				}
				if(!date_flag){
					birthc.innerText = "month: 태어난 일(날짜) 2자리를 정확하게 입력하세요.";
				}else{
					birthc.innerText = "";
				}
				
			}else{
				birthc.innerText = "month :태어난 년도 4자리를 정확히 입력하세요.";
			}
		});
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		