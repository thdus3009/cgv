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
	<div class="top-bar">회원 관리</div>
	
	<form action="" method="POST" class="member-info">
		<ul>
			<li>
				<p class="what">프로필사진</p>
				<img src="test.jpg" alt="프로필 사진" class="profile-pic">
				<span class="del-pic">X</span>
				<div>
					<p class="con">jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
					<input type="file">
				</div>
			</li>
			<li>
				<p class="what">uid</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">pwd</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">name</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">nick</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">phone</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">email</p>
				<input type="text" class="input-text">
			</li>
			<li>
				<p class="what">age</p>
				<input type="number" class="input-text">
			</li>
			<li>
				<p class="what">birth</p>
				<input type="date" class="input-text">
			</li>
			<li>
				<p class="what">gender</p>
				<label class="label">
					<input type="radio" name="gender">남
				</label>
				<label class="label">
					<input type="radio" name="gender">여
				</label>
			</li>
			<li>
				<p class="what">enabled</p>
				<label class="label">
					<input type="radio" name="enabled">가능
				</label>
				<label class="label">
					<input type="radio" name="enabled">불가능
				</label>
			</li>
		</ul>
	</form>

	<div>
		예매내역
		<table class="memberList-bar">
			<tr>
				<td>번호</td>
				<td>영화제목</td>
				<td>관람일시</td>
				<td>관람인수</td>
				<td>관람장소</td>
				<td>가격</td>
			</tr>
		</table>
			<!--반복-->
		<table>
			<tr>
				<td>번호</td>
				<td>영화제목</td>
				<td>관람일시</td>
				<td>관람인수</td>
				<td>관람장소</td>
				<td>가격</td>
			</tr>
		</table>
	</div>

	<div class="button-bar">
		<button type="button" class="cancle">취소</button>
		<button type="submit" class="del">회원삭제</button>
	</div>
	<!-- 푸터 -->
	 <c:import url="../template/footer.jsp"></c:import>
	 
</body>
</html>