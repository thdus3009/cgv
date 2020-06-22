<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.admin-li{
	border-bottom: 1px solid #bbb9b1;
    background-color: #fdfcf0;
	width: 155px;
    height: 34px;
    padding-left: 5px;
    color: #222;
    font-weight: bold;
    font-size: 14px;
    line-height: 34px;
    display: block;
    position: relative;
}
</style>
<div>
	<ul>
		<li class="admin-li"><a
			href="${pageContext.request.contextPath}/member/memberList.jsp">회원
				관리</a></li>
		<li class="admin-li"><a
			href="${pageContext.request.contextPath}/theater/theaterList.jsp">영화관
				관리</a></li>
		<li class="admin-li"><a href="${pageContext.request.contextPath}//.jsp">상영관 관리</a></li>
		<li class="admin-li"><a
			href="${pageContext.request.contextPath}/notice/noticeList.jsp">공지
				사항 관리</a></li>
	</ul>
</div>