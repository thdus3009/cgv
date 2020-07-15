<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="_csrf" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
<!-- 보안 -->

<c:forEach items="${list}" var="vo">

	<div class="list_p" style="padding-bottom: 0;">

		<div class="list_p_content">
			<!-- 이미지 주소부분 나중에 수정해야함 -->
			<div class="list_p_photo">
				<img alt=""
					src="${pageContext.request.contextPath}/images/${vo.fileName}">
			</div>
			<div class="list_p_contents1">
				<div style="position: relative;"">
					<!-- 제목,삭제버튼 -->
					<div class="list_p_contents2 td1" id="m-title">${vo.title}</div>
					<div style="display: none;">${vo.num}</div>
					<div class="td1 hd del-bt">
						<button class="hd_btn_x" data-num="${vo.num}">
							<img alt="삭제버튼" src="${pageContext.request.contextPath}/images/btn_del.gif">
						</button>
					</div>
				</div>

				<div class="br-m-info">
					<div>
						<span>${vo.screenDate} ${vo.screenTime}</span>
					</div>
					<div>
						<span>${vo.cinemaName} ${vo.theaterName} / ${vo.people}명 </span>
					</div>
				</div>
				<div>

					<!-- Modal 1 Button + 조건-->

					<div id="r${vo.num}">
						<c:if test="${empty vo.createAt}">
							<button class="popupBtn1 before" id="${vo.num}" data-toggle="modal"
								data-target="#myModal" data-num="${vo.num}"
								data-title="${vo.title}">
								<img alt=""
									src="${pageContext.request.contextPath}/images/before.JPG">
							</button>
						</c:if>

						<c:if test="${not empty vo.createAt}">
							<c:if test="${vo.egg eq 1}">
								<button class="popupOnlyRead" data-num2="${vo.num}"
									title="${vo.num}" id="good">
									<img alt=""
										src="${pageContext.request.contextPath}/images/good.JPG">
								</button>
								<div class="sss" id="sss${vo.num}" data-toggle="modal"
									data-target="#myModal3" data-num2="${vo.num}">좋았어요</div>
							</c:if>
							<c:if test="${vo.egg eq 0}">
								<button class="popupOnlyRead" data-num2="${vo.num}"
									title="${vo.num}" id="bad">
									<img alt=""
										src="${pageContext.request.contextPath}/images/bad.JPG">
								</button>
								<div class="sss" id="sss${vo.num}" data-toggle="modal"
									data-target="#myModal3" data-num2="${vo.num}">별로예요</div>
							</c:if>

						</c:if>
					</div>

					<!-- Modal 2 Button-->
					<button type="button" class="popupBtn2" data-toggle="modal"
						data-target="#myModal2" style="display: none;"
						data-num="${vo.num}"></button>
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
