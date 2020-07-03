<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/member/member.css" />
<link rel="stylesheet" href="/css/admin/pager.css" />
</head>
<body class="sb-nav-fixed">
	<c:import url="../template/header.jsp"></c:import>
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Member List</h1>
					<!-- 검색창 -->
					<div class="input-group">
						<select id="searchTag" name="searchTag">
							<option value="">검색 태그</option>
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="phone">핸드폰</option>
							<option value="email"></option>
						</select> <input id="searchTxt" class="form-control" type="text"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2" />
						<div class="input-group-append">
							<button id="searchBtn" class="btn btn-primary" type="button">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>

					<!-- 테이블 -->
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr class="admin-tr">
									<th>아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>핸드폰</th>
									<th>이메일</th>
									<th>성별</th>
									<th>나이</th>
									<th>닉네임</th>
									<th>계정상태(활성/탈퇴)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="vo">
									<tr class="memberList-c">
										<th class="ate-center">${vo.username}</th>
										<th class="ate-center">${vo.name}</th>
										<th class="ate-center">${vo.birth}</th>
										<th class="ate-center">${vo.phone}</th>
										<th class="ate-center">${vo.email}</th>
										<th class="ate-center"><c:if test="${vo.gender eq true}">남</c:if> <c:if
												test="${vo.gender eq false}">여</c:if></th>
										<th class="ate-center">${vo.age}</th>
										<th class="ate-center">${vo.nick}</th>
										<th class="ate-center">
											<div id="username" class="btns">
												<c:if test="${vo.enabled eq 1}">
													<%-- <a class="btn btn-info updateBtn" href="./memberUpdate?username=${vo.username}">수정</a>
											<button id="${vo.username}" class="btn btn-danger deleteBtn" type="button">탈퇴</button> --%>
											활성
										</c:if>
												<c:if test="${vo.enabled eq 0}">
											탈퇴
										</c:if>
											</div>
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- pager -->
						<div class="pager">
							<ul class="pagination">
								<c:if test="${pager.curBlock gt 1}">
									<li class="page-item"><a class="page-link"
										href="./memberList?curPage=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
								</c:if>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<li class="page-item"><a class="page-link"
										href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
								</c:forEach>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<li class="page-item"><a class="page-link"
										href="./memberList?curPage=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript" src="/js/admin/member/memberList.js"></script>
</body>
</html>