/**
 * 
 */
		
			var userID = document.getElementById("userID");
			var userPWD = document.getElementById("userPWD"); 
			var userPWD2 = document.getElementById("userPWD2"); 
			var name = document.getElementById("name"); 
			var email = document.getElementById("email"); 
			var phone = document.getElementById("phone"); 
			
			var ch_year = document.getElementById("ch_year");
			var ch_month = document.getElementById("ch_month");
			var ch_date = document.getElementById("ch_date");
			var birthc = document.getElementById("birthc");
		
			var ch = document.getElementsByClassName("ch");
			var s1 = document.getElementById("s1");	//아이디
			var s1_1 = document.getElementById("s1_1");	//아이디
			var s2 = document.getElementById("s2");	//비번
			var s3 = document.getElementById("s3");	//비번2
			var s4 = document.getElementById("s4");	//이름
			var s5 = document.getElementById("s5");	//이메일
			var s5_0 = document.getElementById("s5_0");	//이메일

			var s6 = document.getElementById("s6");	//폰

			var s8 = document.getElementById("s8");	//성별
			var s9 = document.getElementById("s9");	//생년
			
			var frm = document.getElementById("frm");
			
			
			/* ...................중복확인 시작........................ */
			/* 버튼형 아이디 중복확인 */
			var mIdResult=false;
			function overlap_id() {
				
				if(userID.value.length<6){
				//6글자가 넘지않는경우(alert)	
					alert("6자이상 입력해주세요.")
					
				}else{
				
					$.ajax({
				     type:"POST",
				     url:"./memberIdCheck",
				     data:{
				            id:$('#userID').val()
				     },
				     success:function(data){
				    	 data=data.trim();//공백이 들어있을 수 있기때문에 trim 해준다.
				    	 
							if(data==0){//한글은 깨질수있기때문에 숫자가 영어로 넘겨준다.
								//사용가능한경우(alert, 사용가능한 아이디입니다.(innerHTML))	
								alert("사용가능한 아이디입니다.")
								s1_1.innerHTML="사용가능한 아이디입니다.";
								s1_1.style.color="skyblue";
								mIdResult=true;
							}else{
								//중복되는경우(alert, 이미 등록된 아이디입니다.(innerHTML))
								alert("이미 등록된 아이디입니다.")
								s1_1.innerHTML="이미 등록된 아이디입니다.";
								s1_1.style.color="red";	
							}
				   	 },
					 error:function(){
							alert("에러발생");
					 }
					})
				
				
				}	
			}
			

			userID.addEventListener("keyup",function(){
				//s1.innerHTML="6글자 이상 입력하세요";
				if(userID.value.length>=6){
					s1.innerHTML="6자 이상 입력하였습니다.";
					s1.style.color="skyblue";
					
				}else{
					s1.innerHTML="6자 이상 입력하세요.";
					s1.style.color="RED";
					
				}
			});
			
			userID.addEventListener("blur",function(){
				if(userID.value==""){
					s1.innerHTML = "필수 정보입니다."
					s1.style.color="RED";
				}
			});
			
			
			/* innerhtml 이메일 중복확인 */
			var mEmailResult=false;
			email.addEventListener("keyup",function(){
				var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(regEmail.test(mEmail.value)){//test > true, false //진행순서를 잘 보아야한다.
					//중복되는 경우
					
					//사용가능한 경우
					
					$.ajax({
				     type:"POST",
				     url:"./memberEmailCheck",
				     data:{
				            email:$('#email').val()
				     },
				     success:function(data){
				    	 data=data.trim();//공백이 들어있을 수 있기때문에 trim 해준다.
				    	 
							if(data==1){//한글은 깨질수있기때문에 숫자가 영어로 넘겨준다.
								//사용가능한경우
								s5.innerHTML="사용가능한 이메일 입니다.";
								s5.style.color="skyblue";	
								mEmailResult=true;
							}else{
								//중복되는경우
								s5.innerHTML="이미 등록된 이메일입니다.";
								s5.style.color="red";	
								mEmailResult=false;
							}
				   	 },
					 error:function(){
							alert("에러발생");
					 }
					})
				}else{
				//email 잘못된 이메일 형식인 경우
					s5.innerHTML="올바른 이메일 형식이 아닙니다.";
					s5.style.color="red";	mEmailResult=false;
				}
			});
			
			
			/* innerhtml 비밀번호 확인 */
			var mPwResult=false;
			
			userPWD.addEventListener("change",function(){//비밀번호의 값이 변경되었을 때
				//alert("음음") 	//질문 : 첫번째 입력하고 나갔을 때.. 떠도 상관 없음!
				userPWD2.value="";
				mPwResult=false;	//
				s3.innerHTML="비밀번호가 일치하지 않습니다.";
				s3.style.color="RED";
				s3.setAttribute("class","fail");
			});
			
			userPWD.addEventListener("blur",function(){
				if(userPWD.value.length>=6){
					s2.innerHTML="사용 가능한 비밀번호입니다.";
					s2.style.color="skyblue";
					mPwResult=true;
				}else if(userPWD.value.length<6 && userPWD.value.length>=1){
					s2.innerHTML="비밀번호를 6글자 이상 다시 입력해주세요.";
					s2.style.color="RED";
					mPwResult=false;
				}else if(userPWD.value==""){
					s2.innerHTML = "필수 정보입니다."
					s2.style.color="RED";
					userPWD2.value="";
					//s3.innerHTML = "비밀번호가 일치하지 않습니다.";
				}
			 
			});
			
			
			/* innerhtml 2차비밀번호 확인 */
			var mPw2Result=false;
			userPWD2.addEventListener("blur",function(){
				if(userPWD2.value==userPWD.value && userPWD2.value.length>=1){
					s3.innerHTML="비밀번호가 일치합니다.";
					s3.style.color="skyblue";
					s3.setAttribute("class","success");
					mPw2Result=true;
				}else if(mPw2.value!=mPw.value){
					s3.innerHTML="비밀번호가 일치하지 않습니다.";
					s3.style.color="RED";
					mPw2.value="";
					s3.setAttribute("class","fail");
					mPw2Result=false;
				}else if(mPw2.value==""){
					s3.innerHTML = "필수 정보입니다."
					s3.style.color="RED";
				}
			});
			
			
			
			
			/* 이름 */
			name.addEventListener("blur",function(){
				if(name.value==""){
					s4.innerHTML = "필수 정보입니다."
					s4.style.color="RED";
				}else{
					s4.innerHTML = ""
				}
			});
			
			/* 이메일 */
			email.addEventListener("blur",function(){
				if(email.value==""){
					s5_0.innerHTML = "필수 정보입니다."
					s5_0.style.color="RED";
				}else{
					s5_0.innerHTML = ""
				}
			});
			
			/* 폰 */
 			phone.addEventListener("blur",function(){
				if(phone.value==""){
					s6.innerHTML = "필수 정보입니다.";
					s6.style.color="RED";
				}else{
					s6.innerHTML = ""
				}
			}); 
			
			
	/* -------------------------------------------------------------*/
 			
 			
// 			월 옵션 생성
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
 			
 			
/* -------------------------------------------------------------*/			
 			
 			
		var sex = document.getElementsByClassName("sex");
 		
			for(i=0; i<sex.length; i++){
				if(sex[i].value==null){
				sex[i].value=="";
			}
		} 
		
		
	
			/* 가입전 필수정보 입력확인 */
			//넘어가기 전에 확인하려면 input타입의 submit을 button으로 바꿔서 실행해본다
		var btn = document.getElementById("btn");
	
		var check=true;
		btn.addEventListener("click",function(e){
				for(i=0; i<ch.length; i++){
					if(ch[i].value==""/*==0*/){
						check=false;
						console.log(ch[i]+"브레이크");
						break;
					}
				}
			
				//if가 true일때만 실행
				if(mIdResult && mPwResult && mPw2Result && mEmailResult && mEmailNumResult && check){
					console.log("가입성공");
				}else{
					alert("중복확인 및 필수요소들을 입력해주세요");
					e.preventDefault();//form안의 전송 막기
					console.log(mIdResult);
					console.log(mPwResult);
					console.log(mPw2Result);
					console.log(mEmailResult);
					console.log(mEmailNumResult);
					console.log(check);
					
					if(mIdResult==false){
						s1_1.innerHTML = "아이디 중복확인을 눌러주세요";
						s1_1.style.color="RED";
						
					}else if(mEmailNumResult==false){
						alert("이메일 인증번호를 다시확인해주세요.");
					}
					
					
				}
				
			
			}); 
			
			
/* 			$("#test").click(function() {
				
			}); */
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		