<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaterEnroll - 영화관 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theater/theaterManage.css" type="text/css">
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import> 
	
	<div class="top-bar">영화관 정보</div>

	<!--영화관 정보-->
	<form action="" method="post" class="theater-info">
		<ul>
			<li>
				<p class="what">극장사진</p>
				<img src="" alt="" class="theater-pic">
				<span class="del-pic">X</span>
				<input type="file">
			</li>
			<li>
				<p class="what">극장명</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">지역명</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">주소</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">전화번호</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">극장설명</p>
				<textarea class="input-textarea"></textarea>
			</li>
			<li>
				<p class="what">오시는길</p>
				<textarea class="input-textarea"></textarea>
			</li>
			<li>
				<p class="what">주차안내</p>
				<textarea class="input-textarea"></textarea>
			</li>
			</div>
		</ul>
		<div class="button-bar">
			<button type="button" class="cancle">취소</button>
			<button type="submit" class="mod">수정</button>
			<button type="submit" class="del">삭제</button>
		</div>
	</form>
	
	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>