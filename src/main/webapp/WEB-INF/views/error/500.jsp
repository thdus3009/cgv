<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/member/memberMyPage.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>500 error</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -->
		<c:import url="../template/header.jsp"></c:import>
		
		<!-- 사이드바 -->
		<c:import url="../template/sidebar.jsp"></c:import>

		<!-- 콘텐츠 -->
		<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png" style="padding: 7px 0 0 0;">
						</a></li>
						<li><a href="" style="color: black;">안내</a></li>
					</ul>
				</div>
			</div>
			<div class="contents">
				<div class="error-sect">
					<h3>이용에 불편을 드려 죄송합니다.</h3>
					<p>서버에 문제가 발생했습니다.<br>
						빠른시일내에 문제를 해결하겠습니다. 감사합니다.</p>
					<div>
						<a href="" class="error-btn" onclick="history.back()"><span>이전 페이지 이동</span></a> 
						<a href="" class="error-btn"><span>고객센터(1544-1122)</span></a>
						<a href="" class="red-button"><span>CGV 첫 화면 이동</span></a>
					</div>
				</div>
			</div>
		</div>

		<!-- 푸터 -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>

</body>
</html>