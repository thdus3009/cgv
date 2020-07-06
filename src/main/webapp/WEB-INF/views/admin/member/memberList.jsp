<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movie/movie.css" />
</head>
<body class="sb-nav-fixed">

	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<div id="layoutSidenav">

		<c:import url="../template/sidenav.jsp"></c:import>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>movie List</h1>
					<p>영화 목록</p>
					<div class="col_detail">
						<!-- 목록 -->
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr class="admin-tr">
								<td>제목</td>
								<td>영문제목</td>
								<td>상영시간</td>
								<td>감독</td>
								<td>배우</td>
								<td>장르</td>
								<td>연령가</td>
								<td>국가</td>
								<td>개봉일</td>
								<td>관람객 수</td>
								<td>평점</td>
							</tr>
							<!-- 반복 -->
							<!-- 이름 누르면 상세 페이지로 이동 -->
							<c:forEach items="" var="vo">
								<tr class="memberList-c">
									<td>title</td>
									<td>titleEng</td>
									<td>runtime</td>
									<td>director</td>
									<td>actor</td>
									<td>genre</td>
									<td>ageLimit</td>
									<td>country</td>
									<td>openDate</td>
									<td>visitor</td>
									<td>rate</td>
								</tr>
							</c:forEach>
						</table>

						<!-- 페이저 -->
						<div class="pager">
							<ul class="pagination">
								<c:if test="${pager.curBlock>1}">
									<li class="page-item"><a href="#" class="custompager page-link"
										title="${pager.startNum-1}">이전</a></li>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="p">
									<li class="page-item"><a href="#" class="custompager page-link" title="${p}">${p}</a></li>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li class="page-item"><a href="#" class=" custompager page-link"
										title="${pager.lastNum+1}">다음</a></li>
								</c:if>
							</ul>
						</div>
						
					</div>
				</div>
			</main>
		</div>
	</div>


</body>
</html>