<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
		<div class="head">
			
			<h1 class="animated swing"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/header/h1_cgv.png" alt="cgvLogo"></a></h1>
			<div class="header_service">
				<c:if test="${not empty sessionScope.memberVO}">
					<ul class="gnb">
						<li>
							<a class="logout" href="${pageContext.request.contextPath}/member/memberLogout" style="width: 43px; background-position: -521px 9px;">
							<span>로그아웃</span></a>
						</li>
						<li><a class="mycgv" href="${pageContext.request.contextPath}/member/memberMypage"><span>MyCGV</span></a></li>
						<li><a class="vip_lounge" href="#"><span>VIPLOUNGE</span></a></li>
						<li><a class="club_service" href="#"><span>Club서비스</span></a></li>
						<li><a class="customer" href="${pageContext.request.contextPath}/bbs/bbsList"><span>고객센터</span></a></li>
						<li><a class="english_ticketing" href="#"><span>ENGLISHTICKETING</span></a></li>
					</ul>
				</c:if>
				<c:if test="${empty sessionScope.memberVO}">
					<ul class="gnb">
						<li><a class="login" href="${pageContext.request.contextPath}/member/memberLogin"><span>로그인</span></a></li>
						<li><a class="join" href="${pageContext.request.contextPath}/member/memberTerms"><span>회원가입</span></a></li>
						<li><a class="mycgv" href="${pageContext.request.contextPath}/member/memberMypage"><span>MyCGV</span></a></li>
						<li><a class="vip_lounge" href="#"><span>VIPLOUNGE</span></a></li>
						<li><a class="club_service" href="#"><span>Club서비스</span></a></li>
						<li><a class="customer" href="${pageContext.request.contextPath}/bbs/bbsList"><span>고객센터</span></a></li>
					<li><a class="english_ticketing" href="#"><span>ENGLISHTICKETING</span></a></li>
				</ul>
				</c:if>		
			</div>
			<div class="header_menu">
				<h2>
					<img src="${pageContext.request.contextPath}/images/header/h2_cultureplex.png" alt="cultureplex">
				</h2>
				<div class="menu">
					<ul>
						<li class="menu_movie"><a href="${pageContext.request.contextPath}/movie/movieList">영화</a></li>
						<li class="menu_reserve"><a href="${pageContext.request.contextPath}/movie/movieReservation">예매</a></li>
						<li class="menu_theater"><a href="">극장</a></li>
						<li class="menu_event"><a href="">이벤트&컬처</a></li>
					</ul>
				</div>
				<div class="search">
					<fieldset>
						<input type="text" id="search">
						<button class="btn-go-search" id="btn_search" name="search">검색</button>
					</fieldset>
				</div>
				<div class="phototicket">
					<a href="#">포토티켓</a>
				</div>
			</div>
		</div>
	</div>
