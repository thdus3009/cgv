`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/member/memberLogin.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 비회원 비밀번호 찾기 - 확인 -->
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
						로그인
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
				<div class="wrap_login">
					<ul class="tab_menu_round">
						<li><a class="lo" href="">비밀번호 찾기</a></li>
					</ul>
					<div class="showId-box">
						<form action="/member/login" method="post" class="showId-form">
							<fieldset class="showId-field">
								<h1 id="showID">고객님의 비밀번호는 [] 입니다.</h1>
								<h1 id="showID"></h1>
							</fieldset>
							<div class="showId-button">
								<a href="${pageContext.request.contextPath}/member/memberLogin"
									class="move-login"> <span>로그인 화면으로 이동</span></a> 
								<a href="${pageContext.request.contextPath}/" class="move-home"> <span>메인
										화면으로 이동</span></a>
							</div>
						</form>
						<div></div>
					</div>

					<div class="login_guide">
						<div class="box_guide">
							<strong>CJ ONE 회원이 아니신가요?</strong> <span>회원가입하시고 다양한 혜택을
								누리세요!</span> <strong> <a href="./memberjoin" class="round red">
									<span>CJ ONE 회원가입하기</span>
							</a>
							</strong> <em> <a href="" class="round black"> <span>CJ
										ONE 멤버쉽이란?</span>
							</a>
							</em>
						</div>
					</div>
				</div>
			</div>
	
	</div>
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript">

	function incodeID(username) {

		var incodedId = "";
		
		for(var i=0; i<username.length; i++) {

			if(i<3) {
				incodedId += username[i];
			} else {
				incodedId += '*';
			}
		}

		return incodedId;
	}

	function main() {
		var username = incodeID(`${username}`);
		var msg = '고객님의 비밀번호는 ' + username + ' 입니다';
		$("#showID").text(msg);
	}

	main();
	
</script>

</body>
</html>