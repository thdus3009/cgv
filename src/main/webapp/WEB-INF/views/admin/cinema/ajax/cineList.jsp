<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
