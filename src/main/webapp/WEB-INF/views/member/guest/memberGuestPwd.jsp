<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/member/memberGuest.css"
	rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 비회원 예매확인 -->
<title>비회원 비밀번호찾기 &lt;  비회원예매 | 영화 그 이상의 감동. CGV</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -------------------------------------------------------------------------------------->
		<c:import url="../../template/header.jsp"></c:import>
		<!-- 컨테이너 -------------------------------------------------------------------------------------->
		<div class="container" style="height: 900px;">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="../member/login">회원 서비스</a></li>
						<li class="last">로그인</li>
					</ul>
				</div>
			</div>

			<div class="contents">
				<div class="wrap_login">
					<ul class="tab_menu_round">
						<li><a class="lo" href="./memberGuestPwd">비밀번호 찾기</a></li>
					</ul>


					<div class="guest_guide">
						<div class="guest_guide-box">
							<h3>비회원 비밀번호 찾기</h3>
							<p>비회원 예매 시 입력한 개인정보 입력 후, [인증번호 받기]를 눌러 휴대폰으로 전송 받으신 인증번호를 입력해주세요.</p>
							<div class="guest-box">
								<div class="guest-chk">
									<strong class="g-title">개인정보입력</strong>
									<form enctype="" class="guest-form" style="width: 858px;">
									<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
									
										<table style="width: 100%;">
											<caption>모든 항목이 필수 입력사항입니다.</caption>
											<tr class="tr-box">
												<th>법정생년월일<br>(6자리)
												</th>
												<td><input id="birth" type="text" class="input-box birthday"
													maxlength="6"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<span style="font-size: 20px;">- ******</span></td>
											</tr>
											<tr class="tr-box phone">
												<th>휴대폰번호</th>
												<td>
													<select id="phone1" class="input-box">
															<option>010</option>
															<option>011</option>
															<option>016</option>
															<option>017</option>
															<option>018</option>
															<option>019</option>
													</select> 
													- 
													<input id="phone2" type="text" class="input-box phone-front"
														style="width: 75px;" maxlength="4"
														onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													
													- 
													<input id="phone3" type="text"
														onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
														class="input-box phone-back" style="width: 75px;"
														maxlength="4">
													<button id="btnCertification" type="button" class="num-chk">인증번호 받기</button>
												</td>
											</tr>
											<tr class="tr-box">
												<th>인증번호(6자리)</th>
												<td><input id="certificationNum" type="text" class="input-box pwd"
													maxlength="6"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
											</tr>
										</table>
										<div style="display: flex; justify-content: center;">
											<button type="reset" class="again">개인정보 다시입력</button>
											<button id="btnCertificationCheck" type="button" class="red-btn">비밀번호 찾기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						
						<!-- 임시 action주소 사용 - 수정해야됨 -->
						<form action="./pwdFindResult" method="post" id="pwdSubmit">
							<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" id="pwd" name="pwd" value="">
						</form>
						
						<div class="coupon-notice">
							<div style="background-color: #f9f7ec;">
								<em class="coupon-em">이용안내</em>
								<div>
									<ul class="coupon-notice-ul">
										<li>CGV 고객센터 : 1544-1122</li>
										<li>상담 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동 응답 안내 가능)</li>
									</ul>
								</div>
							</div>
						</div>

					</div>
ㄴㄴ


				</div>
			</div>

		</div>



		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../../template/footer.jsp"></c:import>



		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../../template/sidebar.jsp"></c:import>
	</div>

<!-- 스크립트 -->
<script type="text/javascript">

	//받은 인증번호를 담을 변수
	var certificationNum = "";
	var check = false;
	var phoneNumber = "";

	//인증번호 전송하기
	$("#btnCertification").click(function(){
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		if(phone2 == "" || phone3 ==""){
			alert("휴대폰 번호를 입력해 주세요");
		}else{
			phoneNumber = phone1+""+phone2+""+phone3;
			$.ajax({
				url : './guestCertification',
				type : 'post',
				data : {
					phoneNumber : phoneNumber,
					_csrf : $("#_csrf").val()
				},
				success : function(result){
					if(result>0){
						alert("인증 메일이 전송되었습니다.");
						certificationNum = result;
						$("#phone").val(phoneNumber);
						
						console.log(certificationNum);
					}else{
						alert("인증 메일 전송 실패");
					}
				}
			});
		}
		
	});

	//인증 번호 체크- submit버튼
	//$("#btnCertificationCheck").click(function(){
	//});
	function certificationCheck(){
		if(certificationNum == ''){
			alert("인증이 필요합니다.");
		}else{
			console.log($("#certificationNum").val())
			console.log(certificationNum)
			if($("#certificationNum").val() == certificationNum){
				check = true;
				//해당 정보로 예매내역이 존재하는지 확인
				pwdFind();
			}else{
				alert("인증 번호가 다릅니다.");
			}
		}
	}
		



	//패스워드 찾기
	function pwdFind(){
		$.ajax({
			url : './guestFindPwd',
			type : 'post',
			data : {
				birth : $("#birth").val(),
				phone : phoneNumber,
				_csrf : $("#_csrf").val()
			},
			success : function(result){
				if(result>0){
					//비밀번호 띄워주는 페이지로 이동
					//생성한 폼에 비밀번호 넣어주고 post형식으로 전달
					$("#pwd").val(result);
					$("#pwdSubmit").submit();
					
				}else{
					alert("입력하신 정보와 일치하는 예매내역이 없습니다.");
				}
			},
			error : function(result){
				alert("입력하신 정보와 일치하는 예매내역이 없습니다.")
			}
		});
	}

	//날짜 유효성 검사
	function isDate(txtDate) {
	    var currVal = txtDate;
	    if (currVal == ''){
		   	console.log("빈칸체크")
	        return false;
		}
	    
	 
	    var rxDatePattern = /^(\d{2})(\d{1,2})(\d{1,2})$/; //Declare Regex                  
	    var dtArray = currVal.match(rxDatePattern); // is format OK?
	 
	    if (dtArray == null){
	        console.log("???")
	        return false;
		}

	    console.log("111")
	    
	 
	    dtYear = dtArray[1]*1;
	    dtMonth = dtArray[2];
	    dtDay = dtArray[3];

		if(dtYear >= 20){
			dtYear += 1900;
		}else{
			dtYear += 2000;
		}
		dtYear += "";
		 
	    console.log(dtArray);
	    console.log(dtYear);
	    console.log(dtMonth);
	    console.log(dtDay);
	 
	    if (dtMonth < 1 || dtMonth > 12){
		    console.log("달체크")
	        return false;
	    }
	    else if (dtDay < 1 || dtDay > 31){
	    	console.log("일체크")
	        return false;
	    }
	    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31){
	    	console.log("30 31체크")
	        return false;
	    }
	    else if (dtMonth == 2) {
	        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
	        if (dtDay > 29 || (dtDay == 29 && !isleap))
	        	console.log("윤년체크")
	            return false;
	    }
	    
	    return true;
	}
	
	
		//유효성 검사
		$(".red-btn").click(function(e) {
			if ($(".birthday").val() == '') {
				alert("법정생년월일(6자리)를 입력해주세요!");
				e.preventDefault();
			}else if(!isDate($(".birthday").val())){
				alert("법정생년월일에 형식이 틀렸습니다.!");
				e.preventDefault();
			} else if ($(".phone-front").val() == '') {
				alert("핸드폰번호 앞자리를 입력해주세요!");
				e.preventDefault();
			} else if ($(".phone-back").val() == '') {
				alert("핸드폰번호 뒷자리를 입력해주세요!");
				e.preventDefault();
			} else{
				certificationCheck();
			}
		});
	</script>

</body>
</html>