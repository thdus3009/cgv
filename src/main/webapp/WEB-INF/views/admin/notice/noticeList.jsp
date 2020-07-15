<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/notice/notice.css" />
<link rel="stylesheet" href="/css/admin/movieTime/insert.css">
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
					<h1>Notice List</h1>
					<p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
					<div class="contents">
						<div class="col_detail">
							<!----------------------------------------------------------------------------------------------------- contents detail search_area-->

							<form action="./bbsList">
								<div class="input-group" style="padding: 0 0 10px 0;">
									<select name="kind" id="searchTag">
										<option selected="selected" value="title">제목</option>
										<option value="contents">내용</option>
									</select> <input id="searchTxt" class="form-control" type="text"
										name="search" placeholder="검색어를 입력해 주세요">
									<div class="input-group-append">
										<button id="searchBtn" class="btn btn-primary" type="button">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>

							<!----------------------------------------------------------------------------------------------------- contents detail tab-->
							<div class="wrap_tab">
								<ul class="cinema-ol">
									<li><a class="lo" href="./bbsList">전체</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">시스템 점검</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">극장</a></li>
									<span>/</span>
									<li><a class="lo" href="./bbsList">기타</a></li>
								</ul>
							</div>
							<!----------------------------------------------------------------------------------------------------- contents detail search_result-->
							<div class="search_result">
								<%-- 총<span class="num">${fn:length(bbsList)}</span>건이 검색되었습니다. --%>
								총<span class="num">${pager.totalCount}</span>건이 검색되었습니다.
							</div>


							<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
							<div class="box_bbsList">
								<table class="tbl_list">
									<colgroup>
										<col style="width: 50px;">
										<col style="width: 570px;">
										<col style="width: 80px;">
										<col style="width: 75px;">
										<col style="width: 60px;">
									</colgroup>
									<thead>
										<tr class="top-tr">
											<th scope="col">번호</th>
											<th scope="col" class="tit">제목</th>
											<th scope="col">등록자</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody id="list_body">
										<c:forEach var="list" items="${bbsList}">
											<tr class="first">
												<td>${list.num}</td>
												<td class="txt"><a href="./bbsSelect?num=${list.num}">${list.title}</a></td>
												<td>${list.writer}</td>
												<td>${list.hireDate}</td>
												<td class="num">${list.hit}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

							<!----------------------------------------------------------------------------------------------------- contents detail paging-->
							<div class="paging" style="position: relative;">

								<c:if test="${pager.curBlock gt 1}">
									<button id="btn-first" type="button" class="btn_page first"></button>
									<button id="btn-pre" type="button" class="btn_page pre">이전</button>
								</c:if>

								<ul>
									<!-- 							<li class="on"><a href="#">1</a></li> -->
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">

										<li><a
											href="./bbsList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>

									</c:forEach>

								</ul>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<button id="btn-next" type="button" class="btn_page next">다음</button>
									<button id="btn-end" type="button" class="btn_page end">끝</button>
								</c:if>
								<a href="./bbsWrite" style="position: absolute; right: 10px; top: 10px;">
									<button id="btn-submit" type="button" class="round inred btn"
									style="font-weight: 600; background-color: #e9ecef;">글쓰기</button></a>
							</div>
						</div>

					</div>

				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<c:import url="../template/scripts.jsp"></c:import>

</body>
</html>