<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="vo">
	<tr class="admin-tr-each">
		<td class="ate-center">${vo.num}</td>
		<td class="ate-center">${vo.kind}</td>
		<td class="ate-center">
			<a href="../event/eventSelect?num=${vo.num}">${vo.title}</a>
		</td>
		<td class="ate-center">${vo.startDate}</td>
		<td class="ate-center">${vo.endDate}</td>

	</tr>
</c:forEach>