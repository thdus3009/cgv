<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/notice/notice.css" />
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
					<h1>Notice Write</h1>
					<p>공지사항 수정</p>

					<!-- 내용 -->
					<form action="./bbsWrite" method="post"
						enctype="multipart/form-data">
						<div>
							<ul>
								<label class="label">카테고리</label>
								<li><label> <input type="radio" name="kind"
										checked="checked"> 극장
								</label></li>
								<li><label> <input type="radio" name="kind">
										행사/이벤트
								</label></li>
								<li><label> <input type="radio" name="kind">
										시스템점검
								</label></li>
								<li><label> <input type="radio" name="kind">
										기타
								</label></li>
							</ul>
							<label for="title" class="label">제목</label> <input type="hidden"
								value="${sessionScope.memberVO.id}" name="writer"> <input
								type="text" required="required" class="title" id="title"
								value="${bbsVO.title}">
							<textarea id="summernote"></textarea>
							<div class="btn_s">
								<button type="button" class="write-cancle"
									onClick="location.href='./noticeWrite'" id="cancle">취소</button>
								<button type="submit" class="write-submit" id="btn">등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<script type="text/javascript">
		//summernote
		$('#summernote').summernote(
				{
					placeholder : '내용을 입력해주세요',
					tabsize : 2,
					height : 480,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});

		//썸머노트 값
		$('#summernote').summernote('code', '${bbsVO.contents}');
	</script>
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