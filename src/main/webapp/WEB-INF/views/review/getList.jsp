<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:forEach items="${list}" var="vo">

		<div class="list_p">

			<div class="list_p_content">
				<div class="list_p_photo"><img alt="" src="${pageContext.request.contextPath}/images/${vo.fileName}" width="67px" height="79px"> </div>
				<div class="list_p_contents1">
					<div class="list_p_contents2"><span style="font-weight: bold;">${vo.theaterName}</span></div>
					<div class="list_p_contents2"><span style="font-weight: bold;">${vo.movieTimeNum} ${vo.screenTime}</span></div>
					<div class="list_p_contents2"><span style="font-weight: bold;">${vo.theaterName} ${vo.cinemaName} / ${vo.people}명</span></div>
					<div class="list_p_contents2">
						<!-- Button to Open the Modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal">Open modal</button>
					
					</div>
					
				</div>
			</div>
		</div>
		
		
		
		
		
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<form id="form" name="form" method="post"
						action="./review/review_Write">
						<div class="modal-header" style="background-color: #333;">
							<h4 class="modal-title"
								style="color: #F2F0E5; font-size: X-large;">평점작성</h4>
							<button id="exit" type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
							<textarea id="mContents" name="contents" rows="5" cols="70" onkeyup="CheckByte(this)"
								placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." 
								style="font-size: small;"></textarea>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<span id="bytes" style="color: black;">0</span>/280(byte)
							&emsp;
							<input type="button" class="btn btn-danger" id="popupBtn" value="확인">
						</div>
					</form>
				</div>
			</div>
		</div>

		
<%-- 
	<div>fileName : ${vo.fileName}</div>
	<div>theaterName : ${vo.theaterName}</div>
	<div>cinemaName : ${vo.cinemaName}</div>
	<div>movieTimeNum : ${vo.movieTimeNum}</div>
	<div>screenTime : ${vo.screenTime}</div>
	<div>people : ${vo.people}</div>

	 --%>
	<br>
	
</c:forEach>
