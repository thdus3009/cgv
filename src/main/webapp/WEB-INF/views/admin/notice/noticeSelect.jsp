<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../template/head.jsp"></c:import>
	<link rel="stylesheet" href="/css/admin/notice/notice.css" />
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
					<h1>Notice Select</h1>
					<p>공지사항</p>
					<div class="board-view">
						<ul class="notice-ul">
							<li>[카테고리] 제목${bbsVO.title}</li>
							<li><span>등록일<strong>${bbsVO.hireDate}</strong></span> <span>조회수<strong>${bbsVO.hit}</strong></span>
							</li>
						</ul>
						<div class="notice-contents">${bbsVO.contents}</div>
					</div>
					<div class="btn-bar">
						<button type="button" class="3btn">삭제하기</button>
						<button type="button" class="3btn" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeWrite?num='">수정하기</button>
						<button type="button" class="3btn" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeList'">목록으로</button>
					</div>
					<div class="pre-next">
						<ul>
							<li><span>이전글 ▲&nbsp;</span> <span><a href="${pageContext.request.contextPath}/admin/notice/noticeSelect?num=">제목</a></span></li>
							<li>등록일</li>
						</ul>
						<p></p>
						<ul>
							<li><span>다음글 ▼&nbsp;</span> <span><a href="${pageContext.request.contextPath}/admin/notice/noticeSelect?num=">제목</a></span></li>
							<li>등록일</li>
						</ul>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<script src="js/scripts.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

</body>
</html>