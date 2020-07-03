<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="./template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/admin.css" />
</head>
<body class="sb-nav-fixed">
	<c:import url="./template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="./template/sidenav.jsp"></c:import>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>AdminPage</h1>
					<p class="pp">관리자 정보 수정 페이지</p>
					<div>
						<form action="" method="get">
							<table>
								<tr>
									<th>이름</th>
									<td><input type="text" required="required" value=""></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" required="required" value=""></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="text" class="pwd" value=""
										required="required"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="text" class="pwd_chk" required="required"></td>
								</tr>
							</table>
							<div class="btn_s">
								<button id="cancle" type="submit">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$("#cancle").click(function(){
		if($(".pwd").val() != $(".pwd_chk").val()){
			alert("비밀번호가 일치하지 않습니다!");
		}
	});

	</script>
	<c:import url="./template/scripts.jsp"></c:import>
</body>
</html>