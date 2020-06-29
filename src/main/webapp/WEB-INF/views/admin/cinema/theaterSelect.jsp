<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/head.jsp"></c:import> 

</head>
<body class="sb-nav-fixed">
		<c:import url="../template/header.jsp"></c:import> 
        <div id="layoutSidenav">
            <c:import url="../template/sidenav.jsp"></c:import>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Theater Select</h1>
                        <h3>${cine.name}</h3>
                       <!--  <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="#">서울</li></a>
                            <li class="breadcrumb-item active">경기</li>
                            <li class="breadcrumb-item active">인천</li>
                            <li class="breadcrumb-item active">강원</li>
                            <li class="breadcrumb-item active">대전/충청</li>
                            <li class="breadcrumb-item active">대구</li>
                            <li class="breadcrumb-item active">부산/울산</li>
                            <li class="breadcrumb-item active">경상</li>
                            <li class="breadcrumb-item active">광주/전라/제주</li>
                        </ol> -->
						<div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                   
                                    <code>Theater Info</code><br>
                               		상영관명 : <span>${theater.name}</span><br>
                               		총 좌석수 : <span>${theater.seatCount}</span><br>
	                         		필름 타입 : <c:if test="${theater.filmType eq 0}">
										<td>2D</td>
									</c:if>
									<c:if test="${theater.filmType eq 1}">
										<td>3D</td>
									</c:if>
									<c:if test="${theater.filmType eq 2}">
										<td>4D</td>
									</c:if>
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                          	      좌석배치도
                            </div>
							<!-- 좌석 배치 -->
							<div class="theater_minimap">
								<div class="theater nano has-scrollbar">
									<div class="seat-content" style="right: -17px; bottom: -17px;">
										<div class="screen" style="width: 652px;">
											<span class="text"></span>
										</div>
										<div class="seats" style="width: 272px; height: 192px;">
											<c:forEach var="row" items="${rowList}" varStatus="t" >
												<div class="row" style="top:${t.index+(t.index*16)}px;" data-row="${row.rowIdx}">
													<div class="label">${row.rowIdx}</div>
													<div class="seat_group" data-seat-group="">
														<div class="group"> 
															<c:forEach begin="1" end="${maxCol}" var="i" >
																<!--blocked(선택불가)  reserved(이미 예매)  -->
																<!-- rating_economy(노랑) rating_comfort(초록) rating_prime(빨강)  -->
																
																<div class="seat" style="left:${48+(i*16)}px" data-row="${t.index+1}" data-col="${i}" data-grade="${row.grade}"> 
																	<a href="#" onclick="return false;"> 
																		<span class="no">${i}</span>
																		<span class="sreader"></span>
																		<span class="sreader mod"></span>
																	</a>
																</div>
															</c:forEach>
																
														</div>
													</div>
												</div>
												<br>
												
											</c:forEach>
											
										</div>
									</div>								
								</div>
								<div class="legend" style="width: 110px;">
									<div class="buttons">
										<a class="btn-zoom" href="#" onclick="return false;">크게보기</a>
									</div>
									<div class="seat-icon-desc">
										<span class="icon selected"><span class="icon"></span>선택</span>
										<span class="icon reserved"><span class="icon"></span>예매완료</span>
										<span class="icon notavail"><span class="icon"></span>선택불가</span>
									</div>
									<div class="seat-type">
										<span class="radiobutton type-rating_economy" title="Economy 석" style="">Economy Zone<span class="icon"></span></span>
										<span class="radiobutton type-rating_comfort" title="Standard 석" style="">Standard Zone<span class="icon"></span></span>
										<span class="radiobutton type-rating_prime" title="Prime 석" style="">Prime Zone<span class="icon"></span></span>
									</div>
									
								</div>
							</div>						
							<!-- 좌석 배치 -->
                    </div>
                </main>
                <c:import url="../template/footer.jsp"></c:import>
            </div>
        </div>
        <c:import url="../template/scripts.jsp"></c:import>
    </body>
</html>