<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member/memberTerms.css" rel="stylesheet" type="text/css">

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
						<a href="login">회원 서비스</a>
					</li>
					<li class="last">
						이용약관
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div class="wrap_login">
				<ul class="tab_menu_round">
					<li>
						<a class="lo" href="./">회원가입</a>
					</li>
				</ul>
				<div class="box_login">
				
					<!-- All기능 동작 -->
					<div class="con">	
						<div class="content_check">
							<input type="checkbox" id="all" class="all" >
						</div>
						<div class="content_title">
							<h3 id="h_all" style="text-decoration: underline;">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),프로모션 안내 메일 수신(선택)에 모두 동의합니다.</h3>
						</div>
					</div>
					
					
					
					<!-- All이랑 연동 -->	
					
					<div class="con">
						<div class="content_check">
							<input type="checkbox" class="ch1 terms_ch checkbox">
						</div>
						<div class="content_title">
							<h3 title="0">네이버 이용약관 동의</h3>
							<span>(필수)</span>
							<textarea rows="5" cols="70" readonly="readonly">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
다양한 네이버 서비스를 즐겨보세요.
							</textarea>
						</div>
					</div>
					
					
					<div class="con">	
						<div class="content_check">
							<input type="checkbox" class="ch1 terms_ch checkbox">
						</div>
						<div class="content_title">
							<h3 title="1">개인정보 수집 및 이용에 대한 안내</h3>
							<span>(필수)</span>
							<textarea rows="5" cols="70" readonly="readonly">정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
							</textarea>
						</div>
					</div>
					
					<div class="con">	
						<div class="content_check">
							<input type="checkbox" class="ch1 checkbox">
						</div>
						<div class="content_title">
							<h3 title="2">위치정보 이용약관 동의</h3>
							<span style="color:#666;">(선택)</span>
							<textarea rows="5" cols="69" readonly="readonly">위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.
제 1 조 (목적)
이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
							</textarea>
						</div>
					</div>	
					
				</div>
					
				
				
					
			</div>
		
		</div>
		<!-- 다 체크되어있는지 확인 -->
		<div class="btn-area">
			<button class="btn_cancle" onclick="location.href='../'"><span>취 소</span></button>
			<button class="btn_submit" id="btn" type="submit"><span>확  인</span></button>	
		</div>
	</div>
	
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>
	
<script type="text/javascript" src="../js/member/terms.js"></script>

</body>
</html>