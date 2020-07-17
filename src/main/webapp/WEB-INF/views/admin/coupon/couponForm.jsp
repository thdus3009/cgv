<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<link rel="stylesheet" href="/css/admin/coupon/couponForm.css" />

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
					<h1>${path}</h1>
					<p id="title">쿠폰  정보 수정</p>
					
					<form action="./${path}" method="post" id="coupon-form" style="width: 500px; margin: 0 auto;">
						<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<c:if test="${path ne 'couponInsert'}">
							<input type="hidden" name="num" value="${couponInfoVO.num}" />
						</c:if>
						<select id="selectBox" name="type" class="form-control" style="width: 145px!important;">
							<option value="2" selected="selected">CGV 할인쿠폰</option>
							<option value="1">CGV 기프티콘</option>
						</select>
					
						<div class="form-group" style="clear: both;">
							<label for="intro">이름</label> 
							<input type="text" class="form-control" name="name" id="name" required="required" value="${couponInfoVO.name}">
						</div>
						<div class="form-group">
							<label for="intro">시리얼넘버</label> 
							<input type="text" class="form-control" name="serialNum" id="serialNum" required="required" readonly="readonly" value="${couponInfoVO.serialNum}" maxlength="16">
							<button type="button" id="btnCreate" class="btn btn-primary">생성</button>
						</div>
						
						
						<!-- CGV할인쿠폰 선택시 폼 -->
						<div id="cgvCouponForm" >
							<div class="form-group">
								<label for="intro">수량</label> 
								<input type="text" class="form-control" name="count" id="count" value="${couponInfoVO.count}" maxlength="4">
							</div>
						</div>
					
						<!-- CGV기프티콘 선택시 폼 -->
						<div id="cgvGiftCardForm" style="display: none;">
							<div class="form-group">
								<label for="intro">비밀번호</label> 
								<input type="text" class="form-control" name="pwd" id="pwd" value="${couponInfoVO.pwd}" maxlength="6" readonly="readonly">
							</div>
						</div>
						
						
						
						<div class="form-group">
							<label for="intro">가격(원)</label> 
							<input type="text" class="form-control" name="price" id="price" required="required" value="${couponInfoVO.price}">
						</div>
						<div class="form-group">
							<label for="intro">사용기간(시작)</label> 
							<input type="date" class="form-control" name="sIssuance" id="sIssuance" required="required" value="${couponInfoVO.getSIssuance()}">
						</div>
						<div class="form-group">
							<label for="intro">사용기간(끝)</label> 
							<input type="date" class="form-control" name="eIssuance" id="eIssuance" required="required" value="${couponInfoVO.getEIssuance()}">
						</div>
						<div class="btn_s">
							<button type="submit" id="btnSubmit" class="btn" style="background-color: #dc3545; color: #fff;">등록하기</button>
						</div>
					</form>
					
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	
	<c:import url="../template/scripts.jsp"></c:import>
	
	
<script type="text/javascript" src="/js/template/common.js"></script>
<script type="text/javascript">
	var path = `${path}`;
	var type = `${couponInfoVO.type}`;
</script>
<script type="text/javascript" src="/js/admin/coupon/couponForm.js"></script>

</body>
</html>


