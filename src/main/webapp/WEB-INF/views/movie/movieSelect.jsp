<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>
</head>
<body>

	<div class="root">
		<!-- 헤더 -->
		<c:import url="../template/header.jsp"></c:import>

		<!-- 콘텐츠 -->
		<div class="contents">
			<h3>영화 상세</h3>
			<div class="sect-base-movie">
				<div>
					<span>관람가</span> <img alt="영화포스터" src=""> <span>더보기</span>
				</div>
				<div>
					<div>
						<strong>제목</strong> <em>영문제목</em>
						<p>상영상태</p>
					</div>
					<div>
						예매율<span>예매율퍼센트</span>| <img alt="계란" src="">?
					</div>
					<div>
						<dl>
							<dt>감독:</dt>
							<dd></dd>
							<dt>배우:</dt>
							<dd></dd>
							<dt>장르:</dt>
							<dd></dd>
							<dt>기본:</dt>
							<dd></dd>
							<dt>개봉:</dt>
							<dd></dd>
						</dl>
					</div>
					<div>
						<a>프리에그</a> <a>예매</a>
					</div>
				</div>
			</div>
			<div>
				<ul>
					<li>주요정보</li>
					<li>트레일러</li>
					<li>스틸컷</li>
					<li>평점/리뷰</li>
					<li>상영시간표</li>
				</ul>
				<div>
					<strong>한줄요약</strong> <br> 줄거리 길게
				</div>
				<ul>
					<li><strong>성별 예매 분표</strong>
						<div>
							<span>여 100%</span> <span>남 100%</span>
							<canvas></canvas>
						</div></li>
					<li><strong>연령별 예매 분표</strong>
						<div>
							<span>10대</span> <span>20대</span> <span>30대</span> <span>40대</span>
							<span>50대</span>
							<canvas></canvas>
						</div></li>
				</ul>
				<img alt="광고 베너" src="">
				<div class="trailer-div">
					<div class="heading">
						<h4>트레일러</h4>
						<span>n건</span> <a href=""></a>
					</div>
					<ul>
						<!-- 반복 -->
						<li><a href=""> <img alt="동영상 썸네일" src=""> <span>재생버튼-누르면
									모달창</span>
								<p>
									<strong><span>화질</span>제목</strong> <span>날짜</span>
								</p>
						</a></li>
					</ul>
				</div>
				<div class="steelcut-div">
					<div class="heading">
						<h4>트레일러</h4>
						<strong>1/</strong> <span>n건</span> <a href=""></a>
					</div>
					<div class="slider">
						<div class="images"></div>
						<button type="button">앞</button>
						<button type="button">뒤</button>
					</div>
				</div>
				<div class="movie-grade">
					<div>
						<em>영화 평가</em>
						<div>
							<span>계란</span> <span>Pre Egg</span> <span>%</span> <span>사전기대지수</span>
						</div>
						<div>
							<span>계란</span> <span>Golden Egg</span> <span>%</span> <span>실관람평지수</span>
						</div>
					</div>
					<div>
						<div>
							<h5>매력 포인트</h5>
							<div>그래프</div>
						</div>
						<div>
							<h5>감정 포인트</h5>
							<div>그래프</div>
						</div>
					</div>
				</div>
				<div class="real-rating">
					<p>관람일 포함 7일 이내 관람평을 남기시면 CJ ONE 20P가 적립됩니다.</p>
					<p>13,564 명의 실관람객이 평가해주셨습니다.</p>
					<div>
						<button>평점작성</button>
						<button>내 평점</button>
					</div>
				</div>
				<div class="">
					<ul>
						<li>최신순▼</li>
						<li>추천순▼</li>
					</ul>
					<div class="person-grade">
						<ul>
							<!-- 반복 -->
							<li><img alt="프로필사진" src="">
								<div>
									<span><img alt="계란" src="">닉네임</span> <em>후기</em> <span>등급</span>
									<p>
										날짜|<img>좋아요 수
									</p>
									<a>더보기</a>
								</div></li>
						</ul>
					</div>
				</div>
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



		<!-- 푸터 -->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 -->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>

</body>
</html>