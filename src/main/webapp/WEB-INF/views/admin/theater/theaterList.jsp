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

<title>영화관 리스트</title>
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
									<li><a href="">회원 관리<i></i></a></li>
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

							<!-- 상단바 -->
							<div class="top-bar">
								<h1>영화관 리스트</h1>
								<a href="">영화관 등록</a>
								<!-- 검색 -->
								<form action="" method="get" class="search-form">
									<select class="select">
										<option>극장명</option>
										<option>지역명</option>
										<option>주소</option>
										<option>전화번호</option>
									</select> <input type="text" class="serach-text">
									<button type="submit" class="search">검색</button>
								</form>
							</div>

							<!-- 리스트 -->
							<table class="theaterList-bar">
								<tr>
									<td>극장명</td>
									<td>지역명</td>
									<td>주소</td>
									<td>전화번호</td>
									<td>극장설명</td>
								</tr>
							</table>

							<!-- 반복 -->
							<table>
								<c:forEach items="" var="vo">
									<tr>
										<td><a href="">극장명</a></td>
										<td>지역명</td>
										<td>주소</td>
										<td>전화번호</td>
										<td>극장설명</td>
									</tr>
								</c:forEach>
							</table>

							<!-- 페이저 -->
							<div class="pager">
								<ul class="pagination">
									<c:if test="${pager.curBlock>1}">
										<li><a href="#" class="custompager"
											title="${pager.startNum-1}">이전</a></li>
									</c:if>

									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="p">
										<li><a href="#" class="custompager" title="${p}">${p}</a></li>
									</c:forEach>

									<c:if test="${pager.curBlock<pager.totalBlock}">
										<li><a href="#" class="custompager"
											title="${pager.lastNum+1}">다음</a></li>
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
	<script type="text/javascript">
		//버튼 누를때마다 input추가
		$(".banner-add")
				.click(
						function() {
							var $banner = $('<div id="banner-label"><input type="file"><span class="del">삭제</span></div>');
							$(".banner-form").append($banner);
						});

		//배너 추가 라벨 삭제
		$(function() {
			$(".banner-form").on("click", "span", function() {
				$(this).parent().remove();
			});
		});
	</script>
</body>
</html>