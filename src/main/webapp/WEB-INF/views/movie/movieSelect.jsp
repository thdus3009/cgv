<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/movie/movieSelect.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container" >
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">영화</a>
					</li>
					<li class="last">
						영화상세
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div class="wrap-movie-detail" id="select_main">
				<div class="tit-heading-wrap">
					<h3>영화상세</h3>
				</div>
				<div class="sect-base-movie">
					<div class="box-image"  >
					<a href="">
						<span class="thumb-image">
							<img  class="box-image" alt="" src="../images/movie/movieList/filmCover/${vo.movieImageVOs.fileName}">
							<span class="icon-grade grade-${list.ageLimit}">${list.ageLimit}</span>
						</span>
					</a>
					</div>
					<div class="box-contents">
						<div class="title">
							<strong id="title">${vo.title}</strong>
							<em class="round lightblue">
								<span>"현재 상영중"</span>
							</em>
							<p>${vo.titleEng}</p>
						</div>
						
						<div class="score">
							<strong class="rate">
								예매율&nbsp;
								<span>${vo.rate}</span>
							</strong>
						</div>
						
						<div class="egg-gage-small">
							<span class="egg great"></span>
							<span class="percent">${vo.errRate}</span>
						</div>
						
						<div class="spec">
							<dl>
								<dt>감독 :&nbsp;</dt>
								<dd><a href="">${vo.director}</a></dd>
								<dd></dd>
								<dt>&nbsp;/ 배우 :&nbsp;</dt>
								<dd class="on">
									<a href="">${vo.actor}</a>
								</dd>
								<dt>장르 :&nbsp;${vo.ganre}</dt>
								<dd></dd>
								<dt>&nbsp;/ 기본 : &nbsp;</dt>
								<dd class="">${vo.ageLimit} 이상,&nbsp;${vo.runtime},&nbsp;${vo.country}</dd>
								<dt>개봉 : &nbsp;</dt>
								<dd class="on">${vo.openDate}</dd>
							</dl>
						</div>
						<span class="screentype">
						
						</span>
						
						
						<span class="like">
							<a class="link-count" href="" >
								<i class="sprite_preegg btn_md default"></i>
								프리에그
							</a>
							<a class="link-reservation" href="" style="background-image: url('../images/movie/movieList/sprite_btn.png')">예매</a>
						</span>
						
					</div>
					</div>
					<!--여기까지가 상영시간, 감독 등등 나오는 곳----------------------------------------------------------------------------------------------------->

					<!----------------------------------------------------------------------------------------------------- contents detail -->
					<div class="cols-content" id="menu">
					<div class="col_detail">
					
					<ul class="tab-menu" >
						<li class="on" >
							<a title="현재 선택됨" href="">주요정보</a>
						</li>
						<li>
							<a href="" >트레일러</a>
						</li>
						<li>
							<a href="">스틸컷</a>
						</li>
						<li>
							<a href="">평점/리뷰</a>
						</li>
						<li class="last">
							<a href="">상영시간표</a>
						</li>
					</ul>
					
					<div class="sect-story-movie" style="margin-top: 40px;">
						<strong>${vo.contents}</strong>
					</div>
					
					<div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion" style="margin-top: 40px;">
						<ul class="graph">
							<li>
								<strong>성별 예매 분포</strong>
								<div id="qplot_sex" class="chart jqplot-target" style="position: relative">
								그래프자리1
								</div>
							</li>
							
							<li>
								<strong>연령별 예매 분포</strong>
								<div id="qplot_sex" class="chart jqplot-target" style="position: relative">
								그래프자리2
								</div>
							</li>
						</ul>
					</div>
					
					
					<div class="movie-detail-ad">
						<iframe src="" width="100%" height="90"> </iframe>
					</div>
					
					<div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer" >
						<div class="heading">
							<h4>트레일러</h4>
							<span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count"></span>
						</div>
						<ul>
							<li>
							<div class="box-image">
								<a href="">
									<img alt="" src="">
								</a>
							</div>
							<div class="box-contents">
								<a href="">
									<strong class="title">
										<span class="ico-trailer hd">HD</span>
										현장 조사 보고서 영상
									</strong>
								</a>
								
							</div>
							</li>
						</ul>
					</div>
					<!-- 여기까지가 트레일러 -->
					<div id="ctl00_PlaceHolderContent_Section_Still_Cut">
						<div class="heading">
						<h4>스틸컷</h4>
						</div>
						
						<div class="slider-wrap">
						
						</div>
					</div>
					<!-- 여기까지가 스틸컷 -->
					<div class="sect-grade">
						<div class="movie-grade">
							<div class="egg_point">
								<div class="title">
									배우들의 연기가 메소드급인<br>
									몰입하여 보게 되는 영화
								</div>
								<div class="rating">
									<div class="box">
										<span class="sprite_preegg big default"></span>
										<span class="desc">Pre Egg</span>
										<span class="rate">94%</span>
										<span class="tooltip">사전기대지수</span>
									</div>
									<div class="box box_golden">
										<span class="sprite_preegg big great"></span>
										<span class="desc">Golden Egg</span>
										<span class="rate">94%</span>
										<span class="tooltip">실관람평지수</span>
									</div>
								</div>
							</div>
							
							<div class="chart_total">
								<div class="box">
									<div class="title">매력 포인트</div>
									<div class="radar-graph" id="chart2">
									</div>
								</div>
								<div class="box">
									<div class="title">감정 포인트</div>
									<div class="radar-graph" id="chart3">
									</div>
								</div>
							</div>
						</div>
						<div class="real-rating">
							<p class="title">관람일 포함 7일 이내 관람평을 남기시면 <strong>CJ ONE 20P</strong>가 적립됩니다.</p>
							<p class="desc"><span><em>15,557</em>명의 실관람객이 평가해주셨습니다.</span></p>
							<div class="wrap_btn">
								<a class="link-gradewrite" href=""><span>평점작성</span></a>
								<a class="link-reviewwrite" href=""><span>내 평점</span></a>
							</div>
						</div>
						
						<ul class="sort" id="sortTab">
							<li class="sortTab on" data-order-type="0" id="test">
								<a href="" title="현재선택">
									최신순
									<span class="arrow-down"></span>
								</a>	
							</li>
							<li class="sortTab" data-order-type="3" >
								<a href="">
									추천순
									<span class="arrow-down"></span>
								</a>
							</li>
						</ul>
						
						<div class="wrap-persongrade">
							<ul id="movie_point_list_container" class="point_col2">
								<li class="liCommentFirst" data-spoilercnt="0" data-reportcnt="0">
									<a href="" class="screen_spoiler">&nbsp;</a>
									<div class="box-image">
										<span class="thumb-image">
											<img alt="사용자 프로필" src="">
											<span class="profile-mask"></span>
										</span>
									</div>
									<div class="box-contents">
										<ul class="writerinfo">
											<li class="writer-name">
												<a href="">
													<span class=" egg-icon good "></span>
													dm**ud9235
												</a>
											</li>
											<li class="writer-etc">
												<span class="day">2020-06-23</span>
											</li>
										</ul>
									</div>
									<div class="box-comment">
										<p>재밌어요 강추</p>
									</div>
								</li>
							</ul>
						</div>
						
					</div>
						
						
						<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
						
								<div class="bbs_btn">
									<button type="button" class="round inblack" id="btn-list"><span>목록으로</span></button>
									
									<c:if test="${bbsVO.writer eq memberVO.id }">
										<a href="./${board}Delete?num=${vo.num}"><button type="button" class="round inred" id="btn-delete"><span>삭제하기</span></button></a>
										<a href="./${board}Update?num=${vo.num}"><button type="button" class="round inred" id="btn-update"><span>수정하기</span></button></a>
									</c:if>
									
								</div>
							
						
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

<script type="text/javascript" src="../js/bbsWrite.js"></script>



</body>
</html>