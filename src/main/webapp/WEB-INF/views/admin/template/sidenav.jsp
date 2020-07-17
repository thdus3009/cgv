<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/notice/noticeList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공지사항
						</a>
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/member/memberList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/movie/movieList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> 
						<a class="nav-link collapsed" href="/admin/cinema/cinemaList" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								극장 관리	
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/cinema/cinemaList">극장 리스트</a>
								<!-- <a class="nav-link" href="/admin/cinema/cinemaInsert">극장 등록</a> -->
								<a class="nav-link" href="/admin/cinema/theaterInsert?cinemaNum=0">상영관 등록</a>
							</nav>
						</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/reservation/selectList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 예매 관리
						</a> 
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/review/adminReview">
		                     <div class="sb-nav-link-icon">
		                        <i class="fas fa-tachometer-alt"></i>
		                     </div> 리뷰 관리
	                  	</a> 
						<a class="nav-link collapsed" href="/admin/cinema/cinemaList" data-toggle="collapse" data-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts2">
							<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								쿠폰 & 포인트
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a>
						<div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/coupon/couponList">쿠폰</a>
								<a class="nav-link" href="/admin/point/pointHistoryList">포인트 사용내역</a>
								<a class="nav-link" href="/admin/point/accumulateManagement">포인트 적립관리</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/notice/bannerManage" data-toggle="collapse" data-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts3">
							<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
							배너 관리
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a>
						<div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/banner/mainBannerList">메인 배너 관리</a>
								<a class="nav-link" href="/admin/banner/sideBannerList">사이드 배너 관리</a>
							</nav>
						</div>
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/event/eventList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 이벤트 관리
						</a>
					</div>
				</div>
			</nav>
		</div>