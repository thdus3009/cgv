<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<ul class="content scroll-y" >
	<c:forEach var="cinema" items="${cinemaList}">
		<li class="" data-theater="${cinema.name}">
			<a>
				${cinema.name}<span class="sreader"></span>
			</a>
		</li>
	</c:forEach>
</ul>
<div class="pane pane-y">
	<div class="slider slider-y"></div>
</div>

