<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 사진 설정</title>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import>

	<!-- 배너사진 설정 -->
	<div>
		<div>
			<h1>배너 사진 관리</h1>
			<span class="banner-add">사진 추가</span>
		</div>
		<div>
			<label>n번째 배너
				<input type="file">
				<span class="banner-del"></span>
			</label>
		</div>
	</div>

	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		//버튼 누를때마다 input추가
		$("banner-add").click(function() {
			
		});

		//배너 추가 라벨 삭제
		function(){
			$("banner-del").on('click',".add",function() {
			$("banner-del").click(function() {
				
			});
		}
	</script>
</body>
</html>