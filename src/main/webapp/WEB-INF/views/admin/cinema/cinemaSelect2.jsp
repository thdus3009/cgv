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
                        <h1 class="mt-4">Cinema List</h1>
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
                                   
                                    <code>Cinema Info</code><br>
                               		<span>Name : ${cine.name}</span><br>
                               		<span>Local : ${cine.local}</span><br>
                               		<span>Tel : ${cine.tel}</span><br>
                               		<span>Total Theater : ${cine.totalTheater}</span><br>
                               		<span>Total Seat : ${cine.totalSeat}</span><br>
                               		<span>Traffic Info : ${cine.trafficInfo}</span><br>
                               		<span>Parking Info : ${cine.parkingInfo}</span><br>
                               		<span>Intro : ${cine.intro}</span><br>
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Theater List
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Num</th>
                                                <!-- <th>CinemaNum</th> -->
                                                <th>Name</th>
                                                <th>seatCount</th>
                                                <th>filmType</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                               <th>Num</th>
                                               <!-- <th>CinemaNum</th> -->
                                               <th>Name</th>
                                               <th>seatCount</th>
                                               <th>filmType</th>
                                           </tr>
                                        </tfoot>
                                        <tbody>
                                        	<c:forEach items="${theaterList}" var="vo">
												<tr class="theaterList-c">
													<td><a href="">${vo.num}</a></td>
													<%-- <td>${vo.cinemaNum}</td> --%>
													<td><a href="./theaterSelect?num=${vo.num}">${vo.name}</a></td>
													<td>${vo.seatCount}</td>
													<c:if test="${vo.filmType eq 0}">
														<td>2D</td>
													</c:if>
													<c:if test="${vo.filmType eq 1}">
														<td>3D</td>
													</c:if>
													<c:if test="${vo.filmType eq 2}">
														<td>4D</td>
													</c:if>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="" style="float:right;">
	                    	<span id="de" class="btn btn-danger">Delete</span>
	                    	<span id="up" class="btn btn-primary">Update</span>
	                    </div>
                    </div>
                  
                </main>
                <c:import url="../template/footer.jsp"></c:import>
            </div>
        </div>
        <c:import url="../template/scripts.jsp"></c:import>
        <script type="text/javascript">
			//delete submit
			$("#de").click(function(){
				//정말 삭제할 거냐고 묻는 alert창
				var check = confirm("삭제하시겠습니까?");
				if(check){
					location.href="./cinemaDelete?num="+${cine.num};
				}
			});

			
			//update submit
			$("#up").click(function(){		
				location.href="./cinemaUpdate?num="+${cine.num};
			});
			
        </script>
    </body>
</html>