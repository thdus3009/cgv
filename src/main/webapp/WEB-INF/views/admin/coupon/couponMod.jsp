<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />

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
					<h1>Coupon ${path}</h1>
					<p>쿠폰 수정 페이지</p>
					
					<form action="coupon${path}" method="get" enctype="multipart/form-data" id="coupon-form" 
					style="width: 500px; margin: 0 auto;">
						<div class="form-group">
							<label for="intro">이름</label> 
							<input type="text" class="form-control" id="name" required="required" value="${vo.name}">
						</div>
						<div class="form-group">
							<label for="intro">시리얼넘버</label> 
							<input type="text" class="form-control" id="serialNum" required="required" value="${vo.serialNum}">
						</div>
						<div class="form-group">
							<label for="intro">비밀번호</label> 
							<input type="text" class="form-control" id="pwd" required="required" value="${vo.pwd}">
						</div>
						<div class="form-group">
							<label for="intro">가격(원)</label> 
							<input type="text" class="form-control" id="price" required="required" value="${vo.price}">
						</div>
						<div class="form-group">
							<label for="intro">타입</label> 
							<input type="text" class="form-control" id="type" required="required" value="${vo.type}">
						</div>
						<div class="form-group">
							<label for="intro">사용기간(시작)</label> 
							<input type="date" class="form-control" id="sIssuance" required="required" value="${vo.sIssuance}">
						</div>
						<div class="form-group">
							<label for="intro">사용기간(끝)</label> 
							<input type="date" class="form-control" id="eIssuance" required="required" value="${vo.eIssuance}">
						</div>
						<div class="btn_s">
							<button type="submit" class="btn" style="background-color: #dc3545; color: #fff;">등록하기</button>
						</div>
					</form>
					
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript">

	//숫자만
		$("#price").keyup(function(e) {
			reg = /[^0-9]/gi;
			v = $(this).val();

			if (reg.test(v)) {
				$(this).val(v.replace(reg, ''));
				$(this).focus();
			}
		});

		//사용기간 비교
		$("#coupon-form").submit(
				function() {
					var startDate = $("#sIssuance").val();
					var endDate = $("#eIssuance").val();

					var startArray = startDate.split('-');
					var endArray = endDate.split('-');

					var start_date = new Date(startArray[0], startArray[1],
							startArray[2]);
					var end_date = new Date(endArray[0], endArray[1],
							endArray[2]);

					if (start_date.getTime() > end_date.getTime()) {
						alert("종료일이 시작일보다 늦어야합니다!");
						return false;
					}
				});
		
	</script>
</body>
</html>


