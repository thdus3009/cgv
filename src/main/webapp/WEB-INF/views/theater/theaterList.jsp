<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 리스트</title>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import>

	<!-- 상단바 -->
	<div class="top-bar">
		<h1>영화관 리스트</h1>
		<a href="">영화관 등록</a>
		<!-- 검색 -->
		<form action="" method="get" class="search-form">
			<select class="select">
				<option>극장명</option>
				<option>지역명</option>
				<option>주소</option>
				<option>전화번호</option>
			</select>
			<input type="text" class="serach-text">
			<button type="submit" class="search">검색</button>
		</form>
	</div>

	<!-- 리스트 -->
	<table class="theaterList-bar">
		<tr>
			<td>극장명</td>
			<td>지역명</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>극장설명</td>
		</tr>
	</table>

	<!-- 반복 -->
	<table>
	<c:forEach items="" var="vo">
		<tr>
			<td><a href="">극장명</a></td>
			<td>지역명</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>극장설명</td>
		</tr>
	</c:forEach>
	</table>

	<!-- 페이저 -->
	<div></div>

	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>