<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/head.jsp"></c:import> 
	<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
</head>
<body class="sb-nav-fixed">
		<c:import url="../template/header.jsp"></c:import> 
        <div id="layoutSidenav">
            <c:import url="../template/sidenav.jsp"></c:import>
            <div id="layoutSidenav_content">
				<main>
					<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="container-fluid">
						<h1>Cinema Insert</h1>
						<br>
						<form action="cinema${path}" method="post" enctype="multipart/form-data">
	                    	<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<c:if test="${path eq 'Update'}">
								<input type="hidden" name="num" id="num" value="${vo.num}">
							</c:if>
	
								
						  <div class="form-group">
						   	 <label for="name">Name:</label>
						   	 <input type="text" class="form-control" id="name" name="name" value="${vo.name}">
						  </div>
						  
						  <div class="form-group">
						   	 <label for="local">Local:</label>
						   	 <%-- <input type="text" class="form-control" id="local" name="local" value="${vo.local}"> --%>
						   	 <select class="" id="" name="local">
						   	 	<option value="서울">서울</option>
						   	 	<option value="경기">경기</option>
						   	 	<option value="인천">인천</option>
						   	 	<option value="대전/충청">대전/충청</option>
						   	 	<option value="대구">대구</option>
						   	 	<option value="부산/울산">부산/울산</option>
						   	 	<option value="경상">경상</option>
						   	 	<option value="광주/전라/제주">광주/전라/제주</option>
							 </select>
						  </div>
						  
						  <div class="form-group">
						   	 <label for="address">Address:</label>
						   	 <input type="text" class="form-control" id="address" name="address" value="${vo.address}">
						  </div>
						  
						  <div class="form-group">
						   	 <label for="tel">Tel:</label>
						   	 <input type="text" class="form-control" id="tel" name="tel" value="${vo.tel}">
						  </div>
						  
						  <div class="form-group">
						   		<label for="totalTheater">TotalTheater:</label>
						   	 <input type="text" class="form-control" id="totalTheater" name="totalTheater" value="${vo.totalTheater}" readonly="readonly">
						  </div>
						  
						  <div class="form-group">
						   		<label for="totalSeat">TotalSeat:</label>
						   	 <input type="text" class="form-control" id="totalSeat" name="totalSeat" value="${vo.totalSeat}" readonly="readonly">
						  </div>
						  
						  
						  <div class="form-group">
						   		<label for="trafficInfo">TrafficInfo:</label>
						   	 <input type="text" class="form-control" id="trafficInfo" name="trafficInfo" value="${vo.trafficInfo}">
						  </div>
						  
						  
						  <div class="form-group">
						   		<label for="parkingInfo">ParkingInfo:</label>
						   	 <input type="text" class="form-control" id="parkingInfo" name="parkingInfo" value="${vo.parkingInfo}">
						  </div>
						  
						  <div class="form-group">
						   		<label for="intro">Intro:</label>
						   	 <input type="text" class="form-control" id="intro" name="intro" value="${vo.intro}">
						  </div>
			

						  <button type="submit" class="btn btn-default">Submit</button>
						</form>
					
						<c:if test="${path eq 'Update'}">
							<button type="button" id="btn_delete" value="${vo.num}">Delete</button>
						</c:if>

					</div>
				</main>
                <c:import url="../template/footer.jsp"></c:import>
            </div>
        </div>
        <c:import url="../template/scripts.jsp"></c:import>

    </body>
</html>