<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../template/head.jsp"></c:import>
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>

		<div id="layoutSidenav_content">
			<main>
				<!-- main contents -->
				<div class="container">
					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">
						영화 선택
					</button>
					<div id="demo" class="collapse">
						<!-- 검색창 -->
						<div class="input-group">
							<select id="searchTag" name="searchTag">
							    <option value="">검색 태그</option>
							    <option value="id">아이디</option>
							    <option value="name">이름</option>
							    <option value="phone">핸드폰</option>
							    <option value="email"></option>
							</select>
							
							<input id="searchTxt" class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
							<div class="input-group-append">
								<button id="searchBtn" class="btn btn-primary" type="button">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
						
						<!-- 영화리스트 -->
						<!-- ul li로 바꿔보고 안되면-->
						<!-- script로 통으로 추가 -->
						<div style="margin: 10px;">
							<c:forEach var="list" items="${list}" varStatus="vo">
							<div class="row">
								<div class="col-sm-2">
									<div class="card">
										<img class="card-img-top" style="width:100%;" src="/images/movie/movieList/filmCover/1917.jpg" />
										<div class="card-header">
											<h5 class="card-title">1917</h5>
											<h6 class="card-text">예매율: 10%</h6>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<br>

							<!-- pager -->
							<div>
								<ul class="pagination">
									<c:if test="${pager.curBlock gt 1}">
										<li class="page-item"><a class="page-link" href="./memberList?curPage=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.curBlock lt pager.totalBlock}">
										<li class="page-item"><a class="page-link" href="./memberList?curPage=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
</body>
</html>