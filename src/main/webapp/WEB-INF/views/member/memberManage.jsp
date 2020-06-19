<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import> 
	
	<!-- 사이드 바  -->
	<c:import url="../template/adminSidebar.jsp"></c:import> 

	<!-- 회원 정보 -->
	<form action="">
		<img alt="프로필 사진" src="">
		프로필 사진 수정하기
		<input type="file">
		<input type="text" value="">num
		<input type="text" value="">uid <input type="text" value="">pwd
		<input type="text" value="">name <input type="text" value="">birth
		<input type="text" value="">phone <input type="text" value="">email
		<input type="text" value="">gender <input type="text" value="">age
		<input type="text" value="">nick <input type="text" value="">enabled

		<div class="bar">
			<button>취소</button>
			<button>저장</button>
			<button>회원 삭제</button>
		</div>

	</form>

	<!-- 푸터 -->
	 <c:import url="../template/footer.jsp"></c:import>
	 
</body>
</html>