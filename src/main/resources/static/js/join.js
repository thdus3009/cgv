/**
 * 
 */
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
		
		
		
		
		
//		아이디 기입 조건 설명 출력
		userID.addEventListener("focus",function(){
			idc.innerText = '아이디는 6글자 이상입니다.';
			
		});
		
//		아이디 조건 체크
		userID.addEventListener("keyup",function(){
			if(userID.value.length < 6){
				idc.innerText = '아이디는 6글자 이상입니다.';
				idc.style.color = "red";
				idcheck = false;
			}else{
				
					idc.innerText = '사용가능한 아이디입니다.';
					idc.style.color = "green";
					idcheck = true;
			}
			
		});
		
//		패스워드 조건 설명 출력
		pwd1.addEventListener("focus",function(){
			pwd1c.innerText = '패스워드는는 6글자 이상입니다.';
			
		});
		
//		패스워드 조건 체크
		pwd1.addEventListener("blur",function(){
			if(pwd1.value.length != 0){
				
				if(pwd1.value.length >= 6 ){
					pwd1c.innerText = '사용 가능한 패스워드 입니다.';
					pwd1c.style.color = "green";
				}else{
					pwd1c.innerText = '사용 불가능한 패스워드 입니다.';
					pwd1c.style.color = "red";
				}
			}
			
			
		});
		
		
		pwd1.addEventListener("change",function(){
			pwd2.value = "";
			pwd2c.innerText="";
			pwdcheck = false;
		});
		
//		1차 패스워드 2차 패스워드 대조
		pwd2.addEventListener("blur",function(){
			if(pwd2.value.length != 0){
				if(pwd1.value == pwd2.value){
					pwd2c.innerText = '패스워드가 일치합니다.';
					pwd2c.style.color = "green";
					pwdcheck = true;
				}else{
					
					pwd2c.innerText = '패스워드가 불일치합니다.';
					pwd2c.style.color = "red";
					pwd2.value="";
					pwdcheck = false;
				}
			}
			
			
		});
		
		
//		폼 태그의 빈칸 여부 체크
		btn.addEventListener("click",function(e){
			var flag = true;
			var blankArr = [];
//			console.log(spaceArr);
			
			for(i=0;i<check.length;i++){
//				console.log(i +"value : "+ check[i].value);
//				console.log(i +"length : "+ check[i].value.length);
				if(check[i].value.length == 0){
					flag = false;
					blankArr.push(check[i]);
				}
			}
//			console.log(spaceArr);
//			console.log(spaceArr[0].id);
			if(blankArr.length != 0){
				var blank_go = document.getElementById(blankArr[0].id);
			}
			
			
//			console.log(blank_go);
			
			console.log("flag:"+flag);
			console.log("idch:"+idcheck);
			console.log("pwdch:"+pwdcheck);
			
			if(flag && idcheck && pwdcheck){
				alert("회원가입 성공");
			}else{
				e.preventDefault();
				alert("미기입한 항목이 존재합니다.")
				blank_go.focus();
				
			}
			
		});

		
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
		
		ch_date.addEventListener("blur",function(){
			
			console.log(year_flag);
			console.log(month_flag);
			
			
			if(ch_date.value.length != 2){
				console.log("pont1");
				if(year_flag){
					console.log("pont2");
					if(month_flag){
						console.log("pont3");
						
					}else{
						birthc.innerText = "date : 태어난 월을 선택하세요."
					}
				}else{
					birthc.innerText = "date : 태어난 년도 4자리를 정확히 입력하세요.";
				}
			}else{
				console.log("elseselsef");
				date_flag = true;
				birthc.innerText = "";
			}
			
			
		});
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		