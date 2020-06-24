<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:forEach items="${list}" var="vo">

		<div class="list_p">

			<div class="list_p_content"><!-- 이미지 주소부분 나중에 수정해야함 -->
				<div class="list_p_photo"><img alt="" src="${pageContext.request.contextPath}/images/${vo.fileName}" width="110px" height="154.6px"> </div>
				<div class="list_p_contents1">
					<div class="list_p_contents2"><span style="font-weight: bold; font-size: x-large;">${vo.title}</span></div>
					<div class="br">
					<div class="list_p_contents2"><span>${vo.screenDate} ${vo.screenTime}</span></div>
					<div class="list_p_contents2"><span>${vo.theaterName} ${vo.cinemaName} / ${vo.people}명</span></div>
					</div>
					<div class="list_p_contents2">
					
						<!-- Modal 1 Button-->
						<button type="button" id="btn1" class="btn btn-primary" data-toggle="modal"data-target="#myModal" data-num="${vo.num}">Open modal</button>
						
						<!-- Modal 2 Button-->
						<button type="button" id="btn2" data-toggle="modal" data-target="#myModal2" style="display: none;"></button>
					</div>
					
				</div>
			</div>
		</div>
		
		
		
		
		


		
<%-- 
	<div>title : ${vo.title}</div>
	<div>fileName : ${vo.fileName}</div>
	
	<div>theaterName : ${vo.theaterName}</div>
	<div>cinemaName : ${vo.cinemaName}</div>
	
	<div>movieTimeNum : ${vo.movieTimeNum}</div>
	<div>screenTime : ${vo.screenTime}</div>
	
	<div>people : ${vo.people}</div>

	 --%>
	<br>
	
</c:forEach>
