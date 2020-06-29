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
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="#">서울</li></a>
                            <li class="breadcrumb-item active">경기</li>
                            <li class="breadcrumb-item active">인천</li>
                            <li class="breadcrumb-item active">강원</li>
                            <li class="breadcrumb-item active">대전/충청</li>
                            <li class="breadcrumb-item active">대구</li>
                            <li class="breadcrumb-item active">부산/울산</li>
                            <li class="breadcrumb-item active">경상</li>
                            <li class="breadcrumb-item active">광주/전라/제주</li>
                        </ol>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Num</th>
                                                <th>극장명</th>
                                                <th>지역</th>
                                                <th>주소</th>
                                                <th>연락처</th>
                                                <th>총 관수</th>
                                                <th>총 좌석수 </th>
                                                <th>교통안내</th>
                                                <th>주차안내</th>
                                                <th>소개</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Num</th>
                                                <th>극장명</th>
                                                <th>지역</th>
                                                <th>주소</th>
                                                <th>연락처</th>
                                                <th>총 관수</th>
                                                <th>총 좌석수 </th>
                                                <th>교통안내</th>
                                                <th>주차안내</th>
                                                <th>소개</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        	<c:forEach items="${list}" var="vo">
                                            <tr>
                                                <td>${vo.num}</td>
                                                <td><a href="../cinema/cinemaSelect?num=${vo.num}">${vo.name}</a></td>
                                                <td>${vo.local}</td>
                                                <td>${vo.address}</td>
                                                <td>${vo.tel}</td>
                                                <td>${vo.totalTheater}</td>
                                                <td>${vo.totalSeat}</td>
                                                <td>${vo.trafficInfo}</td>
                                                <td>${vo.parkingInfo}</td>
                                                <td>${vo.intro}</td>
                                            </tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <c:import url="../template/footer.jsp"></c:import>
            </div>
        </div>
        <c:import url="../template/scripts.jsp"></c:import>
    </body>
</html>