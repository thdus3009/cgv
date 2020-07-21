<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"  style="table-layout: fixed;">
	<thead>
		<tr class="admin-tr">
			<th style="width:50px;">No.</th>
			<th style="width:140px;">극장명</th>
			<th style="width:130px;">지역</th>
			<th style="width:500px;">주소</th>
			<th style="width:140px;">연락처</th>
			<th style="width:80px;">총 관수</th>
			<th style="width:80px;">총 좌석수</th>
			<th>교통안내</th>
			<th>주차안내</th>
			<th>소개</th>
		</tr>
	</thead>
	<tfoot>
		<tr class="admin-tr">
			<th>No.</th>
			<th>극장명</th>
			<th>지역</th>
			<th>주소</th>
			<th>연락처</th>
			<th>총 관수</th>
			<th>총 좌석수</th>
			<th>교통안내</th>
			<th>주차안내</th>
			<th>소개</th>
		</tr>
	</tfoot>
	<tbody>
		<c:forEach items="${list}" var="vo">
			<tr class="admin-tr-each">
			<td class="ate-center">${vo.num}</td>
				<td class="ate-center"><a
					href="../cinema/cinemaSelect?num=${vo.num}">${vo.name}</a></td>
				<td class="ate-center">${vo.local}</td>
				<td>${vo.address}</td>
				<td class="ate-center">${vo.tel}</td>
				<td class="ate-center">${vo.totalTheater}</td>
				<td class="ate-center">${vo.totalSeat}</td>
				<td style="text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">${vo.trafficInfo}</td>
				<td style="text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">${vo.parkingInfo}</td>
				<td style="text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">${vo.intro}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<!-- 페이저 -->
<div class="pager" style="display: flex; justify-content: center;">
	<ul class="pagination">
		<c:if test="${pager.curBlock>1}">
			<li class="page-item"><a href="${pager.startNum-1}" class="page-link custompager" title="${pager.startNum-1}">이전</a></li>
		</c:if>
		
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
			<li class="page-item"><a href="./cinemaList?curPage=${p}&local=${pager.local}" class="page-link custompager" title="${p}">${p}</a></li>
		</c:forEach>

		<c:if test="${pager.curBlock<pager.totalBlock}">
			<li class="page-item"><a href="${pager.lastNum+1}" class="page-link custompager" title="${pager.lastNum+1}">다음</a></li>
		</c:if>
	</ul>
</div>