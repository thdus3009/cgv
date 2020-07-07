<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:forEach items="${list}" var="vo">
	<tr class="memberList-c">
		<td>${vo.title}</td>
		<td>${vo.titleEng}</td>
		<td>${vo.runtime}</td>
		<td>${vo.director}</td>
		<td>${vo.actor}</td>
		<td>${vo.ganre}</td>
		<td>${vo.ageLimit}</td>
		<td>${vo.country}</td>
		<td>${vo.openDate}</td>
		<td>${vo.visitor}</td>
		<td>${vo.rate}</td>
	</tr>
</c:forEach>