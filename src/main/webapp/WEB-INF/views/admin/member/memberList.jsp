<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbs/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/Admin/AdminNoticeList.css" rel="stylesheet" type="text/css">
<link href="../css/member/memberMyPage.css" rel="stylesheet" type="text/css">
<link href="../css/admin/member/memberList.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>memberList - 회원 목록</title>
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


			<div class="contents" style="background-color: #fdfcf0;">
				<div>
					<div class="col_content">

						<!-- 메뉴바 -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">ADMIN HOME<i></i></a></li>
									<li><a href="">☞ 회원 관리<i></i></a></li>
									<li><a href="">영화관 관리<i></i></a></li>
									<li><a href="">상영관 관리<i></i></a></li>
									<li><a href="">공지사항 관리</a></li>
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
							<div class="top-bar">
								<h1>회원 목록</h1>
								<div>
									<form action="" method="POST" class="search-form">
										<em>검색</em> <select class="select">
											<option value="">num</option>
											<option value="">uid</option>
											<option value="">pwd</option>
											<option value="">name</option>
											<option value="">birth</option>
											<option value="">phone</option>
											<option value="">email</option>
											<option value="">gender</option>
											<option value="">age</option>
											<option value="">nick</option>
											<option value="">enabled</option>
										</select> <input type="text" class="serach-text">
										<button type="submit" class="search-btn">검색하기</button>
										<a href="#" class="memberAdd-btn">회원 등록</a>
									</form>
								</div>
							</div>

							<!-- 멤버 목록 -->
							<table class="memberList-bar">
								<tr>
									<td>번호</td>
									<td>아이디</td>
									<td>패스워드</td>
									<td>이름</td>
									<td>생년월일</td>
									<td>전화번호</td>
									<td>이메일</td>
									<td>성별</td>
									<td>나이</td>
									<td>닉네임</td>
									<td>상태</td>
								</tr>
								<!-- 반복 -->
								<!-- 이름 누르면 회원 상세 페이지로 이동 -->
								<c:forEach items="" var="vo">
										<tr class="memberList-c">
											<td>num</td>
											<td>uid</td>
											<td>pwd</td>
											<td><a href="#">name</a></td>
											<td>birth</td>
											<td>phone</td>
											<td>email</td>
											<td>gender</td>
											<td>age</td>
											<td>nick</td>
											<td>enabled</td>
										</tr>
								 </c:forEach>
							</table>

							<!-- 페이저 -->
							<div class="pager">
								<ul class="pagination">
									<c:if test="${pager.curBlock>1}">
										<li><a href="#" class="custompager" title="${pager.startNum-1}">이전</a></li>
									</c:if>

									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
										<li><a href="#" class="custompager" title="${p}">${p}</a></li>
									</c:forEach>

									<c:if test="${pager.curBlock<pager.totalBlock}">
										<li><a href="#" class="custompager" title="${pager.lastNum+1}">다음</a></li>
									</c:if>
								</ul>
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