<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="vo" varStatus="i">
	<li>
		<a id="tile_${i}" href="">
			<div class="evt-thumb">
				<img alt="" src="/images/event/eventList/eventImage/${vo.eventImageVOs.fileName}">
			</div>
			<div class="evt-desc">
				<p class="txt1">${vo.title}</p>
				<p class="txt2">
					"${vo.startDate}~${vo.endDate}"
					<span> . </span>
					<em>D-5</em>
				</p>
			</div>
		</a>
	</li>
</c:forEach>
