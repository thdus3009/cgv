<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<!-- header -->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 사이드바 -->
	<div class="side-bar">
		<c:import url="../template/adminSidebar.jsp"></c:import>
	</div>
	
	<div class="top-bar">
		<h1>회원 목록</h1>
		<a href="#">회원 등록</a>
		<form action="" method="POST" class="search-form">
			<em>항목</em> 
			<select class="select">
				<option value="">num</option>
				<option value="">uid</option>
				<option value="">pwd</option>
				<option value="">name</option>
				<option value="">birth</option>
				<option value="">phone</option>
				<option value="">email</option>
				<option value="">gender</option>
				<option value="">age</option>
				<option value="">nick</option>
				<option value="">enabled</option>
			</select> 
			<input type="text" class="serach-text">
			<button type="submit" class="search">검색</button>
		</form>
	</div>

	<!-- 멤버 목록 -->
	<table class="memberList-bar">
		<tr>
			<td>num</td>
			<td>uid</td>
			<td>pwd</td>
			<td>name</td>
			<td>birth</td>
			<td>phone</td>
			<td>email</td>
			<td>gender</td>
			<td>age</td>
			<td>nick</td>
			<td>enabled</td>
		</tr>
	</table>

	<!-- 반복 -->
	<table>
		<tr>
			<td>num</td>
			<td>uid</td>
			<td>pwd</td>
			<td>name</td>
			<td>birth</td>
			<td>phone</td>
			<td>email</td>
			<td>gender</td>
			<td>age</td>
			<td>nick</td>
			<td>enabled</td>
		</tr>
	</table>

	<!-- 페이저 -->
	<div class="pager">
		<ul class="pagination">
			<c:if test="${pager.curBlock>1}">
				<li><a href="#" class="custompager" title="${pager.startNum-1}">이전</a></li>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
				<li><a href="#" class="custompager" title="${p}">${p}</a></li>
			</c:forEach>

			<c:if test="${pager.curBlock<pager.totalBlock}">
				<li><a href="#" class="custompager" title="${pager.lastNum+1}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<!-- footer -->
	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>