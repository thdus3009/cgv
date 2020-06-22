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
<title>Insert title here</title>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>

	<!-- 위치바 -->
	<div>
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li><a href="../"> 
						<img alt="go to Home" src="../images/login/btn_home.png">
					</a></li>
					<li><a href="">MY CGV</a></li>
					<li class="last">MY CGV HOME</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 관리자 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import>

	<!-- 콘텐츠 -->

	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>


	<!-- 스크립트 -->
	<script type="text/javascript"></script>
</body>
</html>