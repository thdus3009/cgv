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
					<h1>Notice Add</h1>
					<p>공지사항 등록</p>
					<!-- 내용 -->
					<form action="./bbsWrite" method="post" enctype="multipart/form-data">
						<div>
							<ul>
								<label class="label">카테고리</label>
								<li><label> <input type="radio" name="kind" checked="checked"> 극장
								</label></li>
								<li><label> <input type="radio" name="kind"> 행사/이벤트
								</label></li>
								<li><label> <input type="radio" name="kind"> 시스템점검
								</label></li>
								<li><label> <input type="radio" name="kind"> 기타
								</label></li>
							</ul>
							<label for="title" class="label">제목</label>
							<input type="text" required="required" class="title" id="title">
							<input type="hidden" value="${sessionScope.memberVO.id}" name="writer">
							<textarea id="summernote"></textarea>
							<div class="btn_s">
								<button type="button" class="write-cancle" onClick="location.href='./noticeWrite'" id="cancle">취소</button>
								<button type="submit" class="write-submit" id="btn">등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<c:import url="../template/scripts.jsp"></c:import>
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

		//유효성 검사		
		//제목
		$("#btn").click(function(e){
			if($(".title").val() == ""){
				alert("제목을 입력해주세요!");
				e.prventDefault();
			}
		});
		
	</script>

</body>
</html>