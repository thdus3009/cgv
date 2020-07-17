<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	<thead>
		<tr class="admin-tr">
			<th style="width:200px">No.</th>
			<th style="width:200px">분류</th>
			<th>제목</th>
			<th style="width:200px">시작일 <span class="sort sDate">▼</span></th>
			<th style="width:200px">마감일 <span class="sort eDate">▼</span></th>
		</tr>
	</thead>
	<tfoot>
		<tr class="admin-tr">
			<th style="width:200px">No.</th>
			<th style="width:200px">분류</th>
			<th>제목</th>
			<th style="width:200px">시작일 <span class="sort sDate">▼</span></th>
			<th style="width:200px">마감일 <span class="sort eDate">▼</span></th>
		</tr>
	</tfoot>
	
	<tbody>
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
		<!-- 페이저 -->
		
	</tbody>
	
</table>
<div class="pager">
	<ul class="pagination">
		<c:if test="${pager.curBlock>1}">
			<li><a href="#" class="custompager"
				title="${pager.startNum-1}">이전</a></li>
		</c:if>

		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
			<li><a href="./eventList?curPage=${p}" class="custompager" title="${p}">${p}</a></li>
		</c:forEach>

		<c:if test="${pager.curBlock<pager.totalBlock}">
			<li><a href="#" class="custompager"
				title="${pager.lastNum+1}">다음</a></li>
		</c:if>
	</ul>
</div>