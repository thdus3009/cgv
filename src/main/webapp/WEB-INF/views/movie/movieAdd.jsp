<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/memberList.css" type="text/css">
</head>
<body>
	
	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import> 
	
	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import> 
	
	<!-- 영화 정보 -->
	<form action="">
	<h1>영화 등록</h1>
	<label>포스터
		<input type="file">
	</label>
	<label for="">제목
		<input type="text">
	</label>
	<label for="">영문제목
		<input type="text">
	</label>
	<label for="">상영시간
		<input type="text">
	</label>
	<label for="">감독
		<input type="text">
	</label>
	<label for="">배우
		<input type="text">
	</label>
	<label for="">장르
		<input type="text">
	</label>
	<label for="">연령대
		<input type="text">
	</label>
	<label for="">국가
		<input type="text">
	</label>
	<label for="">개봉일
		<input type="text">
	</label>
	<label for="">줄거리
		<input type="text">
	</label>
	
	<button>취소</button>
	<button type="submit">등록</button>
	
	</form>
	
	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>