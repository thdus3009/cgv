<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <meta name="viewport" content="width=device-width, initial-scale=1">
 <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> 얘가 문제
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  --> 
<div class="container">
<div class="row">
	<div class="col-sm-6" style="width:400px; height:210px; background-color: pink;">aa</div>
	<div class="col-sm-6" style="width:400px; height:210px; background-color: yellow;">ab</div>
	<div class="col-sm-6" style="width:400px; height:210px; background-color: yellow;">ac</div>
	<div class="col-sm-6" style="width:400px; height:210px; background-color: pink;">ad</div>
	<div class="col-sm-6" style="width:400px; height:210px; background-color: pink;">ae</div>
	<div class="col-sm-6" style="width:400px; height:210px; background-color: yellow;">af</div>
</div>
</div>

<!-- row col 부트스트랩 사용하기 -->
	<c:forEach items="${review}" var="vo2">
	<div class="wrap-persongrade">
		<ul id="movie_point_list_container" class="point_col2">
			<li class="liCommentFirst" data-spoilercnt="0" data-reportcnt="0">
				<a href="" class="screen_spoiler">&nbsp;</a>
				
				<!-- 리뷰 이미지 (movieSelect2.css참고)-->
				<div class="box-image2">
				
				</div>
						
				<!-- 계란,아이디 -->								
				<div class="writer-name" style="position: relative;">										 
						<c:if test="${vo2.egg eq 1}">
						<div class="id id_image" style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -20px -45px;"></div>   
						</c:if>
						<c:if test="${vo2.egg eq 0}">
						<div class="id id_image" style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -0px -45px;"></div>   
						</c:if>
						
						<div class="id id_name">${vo2.uid}</div>
				</div>
				
				<!-- 리뷰 컨텐츠 -->	
				<div class="box-comment" style="padding-top: 20px;">
					<p>${vo2.contents}</p>
				</div>
				
				<!-- 날짜, 좋아요 -->
					<div class="box-contents"> 									
					<ul class="writerinfo">											
						<li class="writer-etc">
							<span class="day">
								<span class="date"> ${vo2.createAt}</span> &ensp;|&ensp; <img class="date" alt="" src="../../images/like.png">
							</span>
							<span class="like1">${vo2.like1}</span>
						</li>
					</ul>
				</div> 
				
			</li>
		</ul>
	</div>
	</c:forEach>

<%-- 	<c:forEach items="${review}" var="vo2">
		<div>${vo2.reservationNum}</div>
		<div>${vo2.uid}</div>
		<div>${vo2.contents}</div>
		<div>${vo2.like1}</div>
		<div>${vo2.createAt}</div>
			<div>-----------------</div>
	</c:forEach> --%>