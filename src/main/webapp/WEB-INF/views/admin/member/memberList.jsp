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
				<div style="margin: 10px;">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>생일</th>
							<th>핸드폰</th>
							<th>이메일</th>
							<th>성별</th>
							<th>나이</th>
							<th>닉네임</th>
							<th>계정정보변경</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo">
							<tr>
								<th>${vo.username}</th>
								<th>${vo.name}</th>
								<th>${vo.birth}</th>
								<th>${vo.phone}</th>
								<th>${vo.email}</th>
								<th>
									<c:if test="${vo.gender eq true}">남</c:if>
									<c:if test="${vo.gender eq false}">여</c:if>
								</th>
								<th>${vo.age}</th>
								<th>${vo.nick}</th>
								<th>
									<c:if test="${vo.enabled eq 1}">
										<a class="btn btn-info" href="./memberUpdate?username=${vo.username}">수정</a>
										<a class="btn btn-danger" href="./memberDelete?username=${vo.username}">삭제</a>
									</c:if>
									<c:if test="${vo.enabled eq 0}">
										삭제된 계정입니다
									</c:if>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
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
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../template/scripts.jsp"></c:import>
</body>
</html>