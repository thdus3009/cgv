<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기대되는 영화</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/memberMyMovieExpect.css" type="text/css">
</head>
<body>
	<div>
		<form action=""></form>
		<h3>기대되는 영화</h3>
		<em>n건</em>
		<div>
			<select>
				<option>등록일 순</option>
				<option>개봉일 순</option>
			</select>
			<button type="button">GO</button>
		</div>
	</div>
	<div>
		<!-- 기대되는 영화가 있을 경우 -->
		<ul>
			<!-- li 반복 -->
			<li>
				<a href=""> 
					<img title="영화 포스터" alt="" src=""> 
					<strong>영화 제목</strong>
				</a> 
				<span>개봉날짜</span> 
				<span>상영여부</span>
			</li>
		</ul>
		<!-- 기대되는 영화가 없을 경우 -->
		<div>
			<p>
				기대되는 영화가 없습니다.<br>영화 상세 프리에그에서 '기대돼요!'를 선택하여 영화를 추가해보세요.
			</p>
			<a href="">무비차트</a>
		</div>
	</div>

	<!-- 페이저 -->
	<div class="paging">

		<c:if test="${pager.curBlock gt 1}">
			<button id="btn-first" type="button" class="btn_page first">처음</button>
			<button id="btn-pre" type="button" class="btn_page pre">이전</button>
		</c:if>

		<ul>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">

				<li><a
					href="./bbsList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>

			</c:forEach>
		</ul>

		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<button id="btn-next" type="button" class="btn_page next">다음</button>
			<button id="btn-end" type="button" class="btn_page end">끝</button>
		</c:if>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		//기대되는 영화 삭제
		$(".movie-del").click(function() {
			$.ajax({
				url : "",
				type : "",
				data : "",
				success : function() {
					alert("'기대되는 영화'에서 삭제되었습니다.");
					$(this).parent().remove();
				},
				error : function() {
					alert("삭제 실패.");
				}
			});
		});

		//영화 정렬
		$(".go").click(function() {
			console.log();
		});
	</script>

</body>
</html>