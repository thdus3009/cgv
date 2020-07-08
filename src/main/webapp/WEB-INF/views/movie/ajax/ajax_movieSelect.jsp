<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <div class="container1" >
<div class="row" style="width: 800px; height: 630px;">
	<c:forEach items="${review}" var="vo2">
	<div class="col-sm-6" style="width:400px; height:210px; border-bottom: 1px solid #999999; ">
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
				<div class="box-comment" style="padding-top: 20px; ">
					<p>${vo2.contents}</p>
				</div>
				
				<!-- 날짜, 좋아요 -->
					<div class="box-contentss"> 									
					<ul class="writerinfoo">											
						<li class="writer-etcc">
							<span class="dayy">
								<span class="datee"> ${vo2.createAt}</span> &ensp;|&ensp; 
								<a class="date" data-reservation="${vo2.reservationNum}"><img alt="" src="../../images/like.png"></a>
							</span>
							<span class="like11">${vo2.like1}</span>
						</li>
					</ul>
				</div> 
				
			</li>
		</ul>
	</div>
	</c:forEach>
</div>
</div> 

<input type="hidden" id="totalCount" value="${pager.totalCount}"/>
<!-- pager -->
 <ul class="pagination">

 <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
 	<li class="page1" id="page1${i}" name="${i}" data-page1="${i}"><a href="javascript:void(0);">${i}</a></li>
 </c:forEach>
 

 
 
 </ul>
 
 
