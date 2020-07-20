<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    

<%-- <c:forEach var="list" items="${list}"> --%>
<%-- 	<li class="rating-${list.ageLimit}"> --%>
<!-- 		<a href="#" title="제목" alt="제목">  -->
<!-- 			<span class="icon">&nbsp;</span>  -->
<%-- 			<span class="text">${list.title}</span> --%>
<!-- 			<span class="sreader"></span> -->
<!-- 		</a> -->
<!-- 	</li> -->
<%-- </c:forEach> --%>
	<c:forEach var="list" items="${list}">
		<li class="rating-${list.ageLimit}" data-index="${list.num}" data-age_limit="${list.ageLimit}" data-title="${list.title}" data-image="${list.movieImageVO.fileName}">
			<a title="제목" >
				<span class="icon">&nbsp;</span> 
				<span class="text">${list.title}</span>
				<span class="sreader"></span>
			</a>
		</li>
	</c:forEach>
