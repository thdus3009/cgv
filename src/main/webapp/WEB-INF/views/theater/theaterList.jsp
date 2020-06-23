<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbsList.css" rel="stylesheet" type="text/css">

<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>	
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">고겍센터</a>
					</li>
					<li class="last">
						게시판
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div>
				
				<div class="col_content">
					<!----------------------------------------------------------------------------------------------------- contents aside -->
					<div class="col_aside">
						<div class="snb">
							<ul>
								<li><a href="">고객센터 메인<i></i></a></li>
								<li><a href="">자주찾는 질문<i></i></a></li>
								<li class="on"><a href="./bbsList">공지/뉴스<i></i></a></li>
								<li><a href="">이메일 문의<i></i></a></li>
								<li><a href="">분실문 문의<i></i></a></li>
								<li><a href="">단체/대관 문의<i></i></a></li>
								<li><a href="">대학로 옥탑 예약<i></i></a></li>
							</ul>
						
						</div>
						<div class="ad_area">
							<div class="ad_panner_1">
								<a href="">
									<img alt="" src="../images/bbsList/200313_160x300.jpg">
								</a>
							</div>
							<div class="ad_panner_2">
								<a href="">
									<img alt="" src="../images/bbsList/0325_160x35.png">
								</a>
							</div>
						</div>
					</div>
					
					<!----------------------------------------------------------------------------------------------------- contents detail -->
					
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="customer_top">
							<h2 class="tit">상연관</h2>
							<p class="stit">상영관 정보</p>
						</div>
						
						
						<!----------------------------------------------------------------------------------------------------- contents detail search_area
						<div class="search_area">
							<form action="./bbsList">
								<select style="width: 100px;" name="kind">
									<option selected="selected" value="title">제목</option>
									<option value="contents">내용</option>
								</select>
								<input type="text" name="search" placeholder="검색어를 입력해 주세요" style="width: 185px;">
								<button type="submit" class="round inblack"><span>검색하기</span></button>
							</form>	
						</div>-->
					
						<!----------------------------------------------------------------------------------------------------- contents detail tab-->
						<div class="wrap_tab">
							<ul class="tab_menu_round">
								<li>
									<a class="lo" href="./bbsList">전체</a>
								</li>
							</ul>
							
						</div>
						
						<!----------------------------------------------------------------------------------------------------- contents detail search_result
						<div class="search_result">
<%-- 							총<span class="num">${fn:length(bbsList)}</span>건이 검색되었습니다. --%>
							총<span class="num">${pager.totalCount}</span>건이 검색되었습니다.
						</div>
						-->
						
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
									<tr>
										<th scope="col">상영관번호</th>
										<th scope="col" class="tit">상영관명</th>
										<th scope="col">좌석수</th>
										<th scope="col">2D/3D</th>
										
									</tr>
								</thead>
								<tbody id="list_body">
									<c:forEach var="vo" items="${list}" >
										<tr class="first">
											<td>${vo.num}</td>
											<td class="txt">
												<a href="./theaterUpdate?num=${vo.num}">${vo.name}</a>
											</td>
											<td>${vo.seatCount}</td>
											<td>
											<c:if test="${vo.filmType eq 0}">2D</c:if>
											<c:if test="${vo.filmType eq 1}">3D</c:if>
											<c:if test="${vo.filmType eq 2}">4D</c:if>
											<%-- ${vo.filmType} --%>
											</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
						</div>
						<a href="./${board}Insert" class="btn btn-danger">Write</a>
						<!----------------------------------------------------------------------------------------------------- contents detail paging
						<div class="paging">
							
							<c:if test="${pager.curBlock gt 1}">
								<button id="btn-first" type="button" class="btn_page first"></button>
								<button id="btn-pre" type="button" class="btn_page pre">이전</button>
							</c:if>
						
							<ul>
<!-- 							
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				
									<li><a href="./bbsList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				
								</c:forEach>
				
							</ul>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<button id="btn-next" type="button" class="btn_page next">다음</button>
								<button id="btn-end" type="button" class="btn_page end">끝</button>
							</c:if>
							
							<a href="./bbsWrite"><button id="btn-submit" type="button" class="round inred">글쓰기</button></a>
							
						</div> -->
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>


</body>
</html>