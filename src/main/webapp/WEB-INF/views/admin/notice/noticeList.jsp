<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/Admin/AdminNoticeList.css" rel="stylesheet"
	type="text/css">
<link href="../css/member/memberMyPage.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="root">

		<!-- 헤더 -->
		<c:import url="../template/header.jsp"></c:import>

		<!-- 컨테이너 -->
		<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="">MY CGV</a></li>
						<li class="last">ADMIN HOME</li>
					</ul>
				</div>
			</div>


			<div class="contents">
				<div>
					<div class="col_content">

						<!-- 메뉴바 -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">ADMIN HOME<i></i></a></li>
									<li><a
										href="./memberUpdate?id=${sessionScope.memberVO.id}">회원 관리<i></i>
									</a></li>
									<li><a href="#" id="memberDelete">영화관 관리<i></i></a></li>
									<li><a href="">상영관 관리<i></i></a></li>
									<li><a
										href="./memberMyMovie?id=${sessionScope.memberVO.id}">공지사항
											관리</a></li>
								</ul>
							</div>
							<div class="ad_area">
								<div class="ad_panner_1">
									<a href=""> <img alt=""
										src="../images/bbsList/200313_160x300.jpg">
									</a>
								</div>
								<div class="ad_panner_2">
									<a href=""> <img alt=""
										src="../images/bbsList/0325_160x35.png">
									</a>
								</div>
							</div>
						</div>

						<!-- 내용 -->
						<div class="col_detail">
							<div class="noticeList">
								<div>

									<div class="noticeList-box">
										<div class="top-bar">
											<h1>회원 목록</h1>
											<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
											<form action="" method="POST" class="search-form">
												<select class="select">
													<option value="">제목</option>
													<option value="">내용</option>
												</select> <input type="text" class="serach-text">
												<button type="submit" class="search">검색하기</button>
											</form>
										</div>
										<ul>
											<li>전체</li>
											<li>시스템점검</li>
											<li>극장</li>
											<li>기타</li>
										</ul>
										<div>
											<p>총 n건이 검색되었습니다.</p>
											<table>
												<tr>
													<td>번호</td>
													<td>구분</td>
													<td>제목</td>
													<td>등록일</td>
													<td>조회</td>
												</tr>
											</table>
											<table>
												<tr>
													<td>번호</td>
													<td>구분</td>
													<td>제목</td>
													<td>등록일</td>
													<td>조회</td>
												</tr>
											</table>
										</div>
										<!-- 페이저 -->
										<div class="paging">

											<c:if test="${pager.curBlock gt 1}">
												<button id="btn-first" type="button" class="btn_page first">처음</button>
												<button id="btn-pre" type="button" class="btn_page pre">이전</button>
											</c:if>

											<ul>
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

										</div>
									</div>

								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>


	<!-- 스크립트 -->
	<script type="text/javascript"></script>
</body>
</html>