<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<script type="text/javascript" src="/js/template/common.js"></script>
<style type="text/css">

#selectBox{
	float: right;
}

label{
	display: block;
}

#serialNum{
	clear: both;
	width: 87%;
	float: left;
}

#btnCreate{
	float : right;
	width: 11%;
}

.btn_s{
	float: right;
	margin-bottom: 50px;
}


</style>

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
					<p id="title">쿠폰  정보 수정</p>

					
					<form action="./${path}" method="post" id="coupon-form" style="width: 500px; margin: 0 auto;">
						<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="num" value="${couponInfoVO.num}" />
						<select id="selectBox" name="type">
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
	
	
	
	
<script type="text/javascript">
	//숫자만 등록 가능
	$("#price").keyup(function() {
		reg = /[^0-9]/gi;
		v = $(this).val();

		if (reg.test(v)) {
			$(this).val(v.replace(reg, ''));
			$(this).focus();
		}
	});

	var path = `${path}`;
	
	if (path == 'couponInsert') {
		$("#title").text("쿠폰 등록");
	} else {
		//업데이트 일때
		//수정 막기	
		var type = `${couponInfoVO.type}`;
		if (type == 1) {
			//selected값 수정
			$('#selectBox option[value="1"]').prop("selected", true);
			//출력폼 수정
			$("#cgvGiftCardForm").css("display", "block");
			$("#cgvCouponForm").css("display", "none");
			$("#count").val(1);
		}
		$("#selectBox option").each(function() {
			$(this).prop("disabled", true);
		});
		$("#btnCreate").text("재생성");
		$("#btnSubmit").text("수정하기");
	}

	//selectBox에 따라서 ajax실행
	//1.기프티콘 - 시리얼번호(16자리-숫자,영어),비밀번호(6자리) 생성
	//2.할인쿠폰 - 시리언번호(6자리-숫자) 생성
	$("#btnCreate").click(function() {
		var type = $("#selectBox option:selected").val();
		console.log(type);

		$.ajax({
			url : './makeSerial',
			type : 'get',
			data : {
				type : type
			},
			success : function(result) {
				console.log(result);
				if (type == 1) {
					//시리얼번호,비번
					$("#pwd").val(result[1])
				}
				$("#serialNum").val(result[0])
			}
		});
	});

	//날짜 조건 체크(시작일이 종료일 보다 빨라야됨 -made.신우)
	periodComparison("coupon-form");

	//selectBox 선택에 의해서 출력 폼 변경
	$("#selectBox").change(function() {
		$('input[type="text"]').val("");

		if ($("#selectBox option:selected").val() == 1) { //1: 기프티콘
			$("#cgvGiftCardForm").css("display", "block");
			$("#cgvCouponForm").css("display", "none");
			$("#count").val(1);

		} else { //2: 할인쿠폰
			$("#cgvGiftCardForm").css("display", "none");
			$("#cgvCouponForm").css("display", "block");
		}
	});








	
</script>

</body>
</html>


