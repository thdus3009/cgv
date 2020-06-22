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

	<div class="top-bar">
		<h1>배너 사진 설정</h1>
		<span class="banner-add">배너 추가</span>
	</div>


	<!-- 배너사진 설정 -->
	<div class="banner-list">
		<p>배너 목록</p>
		<form action="" method="post" class="banner-form">
	
		</form>
		<button>취소</button>
		<button>등록하기</button>
	</div>

	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		//버튼 누를때마다 input추가
		$(".banner-add").click(function() {
			var $banner = $('<div id="banner-label"><input type="file"><span class="del">삭제</span></div>');
			$(".banner-form").append($banner);
		});

		//배너 추가 라벨 삭제
		$(function() {
			$(".banner-form").on("click","span",function() {
				$(this).parent().remove();
			});
		});
	</script>
</body>
</html>