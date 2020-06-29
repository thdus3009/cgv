<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="./template/head.jsp"></c:import>
</head>
<body class="sb-nav-fixed">
	<c:import url="./template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="./template/sidenav.jsp"></c:import>
		<div id="layoutSidenav_content">
			<main>
				<!-- main contents -->
				<h1>index</h1>
			</main>
			<c:import url="./template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="./template/scripts.jsp"></c:import>
</body>
</html>