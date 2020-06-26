<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<c:import url="../template/adminSidebar.jsp"></c:import>
	
	<!-- 콘텐츠 -->
	<div>
		<div class="top-bar">
		<h1>회원 목록</h1>
		<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
		<form action="" method="POST" class="search-form">
			<select class="select">
				<option value="">제목</option>
				<option value="">내용</option>
			</select> 
			<input type="text" class="serach-text">
			<button type="submit" class="search">검색하기</button>
		</form>
		</div>
		<ul>
			<li>전체</li>
			<li>시스템점검</li>
			<li>극장</li>
			<li>기타</li>
		</ul>
		<div>
			<p>총 n건이 검색되었습니다.</p>
			<table>
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회</td>
				</tr>
			</table>
		</div>
		<!-- 페이저 -->
		<div class="paging">
							
        <c:if test="${pager.curBlock gt 1}">
            <button id="btn-first" type="button" class="btn_page first">처음</button>
            <button id="btn-pre" type="button" class="btn_page pre">이전</button>
        </c:if>
    
        <ul>
            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">

                <li><a href="./bbsList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>

            </c:forEach>
        </ul>

        <c:if test="${pager.curBlock lt pager.totalBlock}">
            <button id="btn-next" type="button" class="btn_page next">다음</button>
            <button id="btn-end" type="button" class="btn_page end">끝</button>
        </c:if>

    </div>
	</div>
	
	<!-- 푸터 -->
	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>