<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member/memberJoin.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="./login">회원 서비스</a>
					</li>
					<li class="last">
						회원가입
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div class="wrap_login">
				<ul class="tab_menu_round">
					<li>
						<a class="lo" href="#">회원가입</a>
					</li>
				</ul>
				<div class="box_login">
					<form class="box_form" action="./join" id="frm" method="post">
						<fieldset>
							<div class="login_input">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
								<h2>아이디</h2>
								<input id="userID" class="id check" type="text" style="display: inline-block;" name="username">
								<button id="idCheck" type="button" style="display: inline-block; color:#ffffff; height:38px; width: 85px; margin-top: 0px;margin-right: 200px;">중복체크</button>
								<p id="idc"></p>
								
								<h2>비밀번호</h2>
								<input id="userPWD" class="check" type="password">
								<p id="pwd1c"></p>
								
								<h2>비밀번호 재확인</h2>
								<input id="userPWD2" class="check" type="password" style="display: inline-block;" name="password">
								<!-- <button type="button" style="display: inline-block; color:#ffffff; height:38px; width: 85px; margin-top: 0px;margin-right: 200px;">확인</button> -->
								<p id="pwd2c"></p>	
									
								<h2>이름</h2>
								<input id="name" class="text check" type="text" name="name">
								
								<h2>생년월일</h2>
								<div class="ymd">
									<input id="ch_year" class="text year check" type="text" placeholder="년(4자리)" maxlength="4" name="year">
									<select id="ch_month" class="month check" name="month">
										
									</select>
									<input id="ch_date" class="text day check" type="text" placeholder="일" maxlength="2" name="day">
								</div>
								<p id="birthc"></p>	
								
								<h2>전화번호</h2>
								<!-- id명 phone / phoneAuth 입력 유효성 검사 필요(전부 숫자만 입력되도록) -->
								<input id="phone" class="text" type="text" style="display: inline-block;" placeholder="' - ' 없이 입력해 주세요" maxlength="11"  onkeyup=keyinCheck(this.id) name="phone">
								<button id="phoneBtn" type="button" style="display: inline-block; color:#ffffff; height:38px; width: 85px; margin-top: 0px; margin-bottom: 0px; margin-right: 200px;">인증번호 발송</button>
								<input id="phoneAuth" class="text" type="text" style="display: none;" placeholder="인증번호를 입력해주세요" maxlength="6" onkeyup=keyinCheck(this.id)>
								<button id="phoneAuthBtn" type="button" style="display: none;">인증번호 확인</button>
								
								<h2>성별</h2>
								<input id="genderMale" class="check gender" type="radio" name="gender" value="1">남자
								<input id="genderFemale" class="check gender" type="radio" name="gender" value="0">여자
								
								<h2>이메일</h2>
								<input id="email" class="check" type="email" placeholder="선택입력" name="email">
							</div>
						
						</fieldset>
						<button id="btn" type="submit"><span>가입 신청</span></button>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript" src="../js/member/join.js"></script>

</body>
</html>
























