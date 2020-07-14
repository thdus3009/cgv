<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>
		<div id="layoutSidenav_content">
			<input type="hidden" id="_csrf" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<main>
				<div class="container-fluid">
					<h1>Cinema Insert</h1>
					<br>
					<form action="cinema${path}" method="post"
						enctype="multipart/form-data">
						<input type="hidden" id="_csrf" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<c:if test="${path eq 'Update'}">
							<input type="hidden" name="num" id="num" value="${vo.num}">
						</c:if>


						<div class="form-group">
							<label for="name">극장 이름:</label> <input type="text"
								class="form-control" id="name" name="name" value="${vo.name}">
						</div>

						<div class="form-group">
							<label for="local">지역:</label> <input type="text"
								class="form-control" id="local" name="local" value="${vo.local}">
						</div>

						<div class="form-group">
							<label for="address">주소:</label> <input type="text"
								class="form-control" id="address" name="address"
								value="${vo.address}">
						</div>

						<div class="form-group">
							<label for="tel">전화번호:</label> <input type="text"
								class="form-control" id="tel" name="tel" value="${vo.tel}">
						</div>

						<div class="form-group">
							<label for="totalTheater">총 관수:</label> <input type="text"
								class="form-control" id="totalTheater" name="totalTheater"
								value="${vo.totalTheater}">
						</div>

						<div class="form-group">
							<label for="totalSeat">총 좌석수:</label> <input type="text"
								class="form-control" id="totalSeat" name="totalSeat"
								value="${vo.totalSeat}">
						</div>


						<div class="form-group">
							<label for="trafficInfo">교통안내:</label> <input type="text"
								class="form-control" id="trafficInfo" name="trafficInfo"
								value="${vo.trafficInfo}">
						</div>


						<div class="form-group">
							<label for="parkingInfo">주차안내:</label> <input type="text"
								class="form-control" id="parkingInfo" name="parkingInfo"
								value="${vo.parkingInfo}">
						</div>

						<div class="form-group">
							<label for="intro">극장소개:</label> <input type="text"
								class="form-control" id="intro" name="intro" value="${vo.intro}">
						</div>

						<div class="btn_s">
							<button type="submit" class="btn btn-default">완료</button>
						</div>

					</form>
					<c:if test="${path eq 'Update'}">
						<button type="button" id="btn_delete" class="btn"
							value="${vo.num}">삭제</button>
					</c:if>



				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>



	<script type="text/javascript">
		
	</script>
</body>
</html>