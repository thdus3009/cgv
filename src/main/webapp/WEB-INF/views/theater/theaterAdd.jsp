<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaterEnroll - 영화관 등록</title>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import> 
	
	<!--영화관 정보-->
	<form action="" method="post">
		<div>
		<label>극장명
            <input type="text">
        </label>
        <label>지역명
            <input type="text">
        </label>
        <label>주소
            <input type="text">
        </label>
        <label>전화번호
            <input type="number">
        </label>
        <label>극장사진
            <input type="file">
        </label>
        <label>극장설명
            <textarea></textarea>
        </label>
        <label>오시는길
            <textarea></textarea>
        </label>
        <label>주차안내
            <textarea></textarea>
        </label>
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
	
	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>