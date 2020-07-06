<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/reservation/reservation.css" />
</head>
<body class="sb-nav-fixed">
	
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		
		<c:import url="../template/sidenav.jsp"></c:import>
		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Reservation List</h1>
					<p>예매 내역 목록</p>
					
					<!-- 목록 -->
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr class="admin-tr">
									<th style="width: 60px;">No.</th>
									<th>영화제목</th>
									<th style="width: 100px;">상영시간</th>
									<th style="width: 100px;">가격</th>
									<th style="width: 80px;">타입</th>
									<th style="width: 100px;">영화관</th>
									<th style="width: 100px;">극장</th>
									<th style="width: 90px;">총 좌석</th>
									<th style="width: 130px;">수입</th>
									<th style="width: 80px;">일반</th>
									<th style="width: 80px;">청소년</th>
									<th style="width: 80px;">우대</th>
									<th style="width: 170px;">생성일</th>
									<th style="width: 50px;">삭제</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="admin-tr">
									<th>No.</th>
									<th>영화제목</th>
									<th>상영시간</th>
									<th>가격</th>
									<th>타입</th>
									<th>영화관</th>
									<th>극장</th>
									<th>총 좌석</th>
									<th>수입</th>
									<th>일반</th>
									<th>청소년</th>
									<th>우대</th>
									<th>생성일</th>
									<th>삭제</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${list}" var="vo">
									<tr class="admin-tr-each">
										<%-- <td class="ate-center"></td>
										<td class=""><a href="#">${vo.movieNum}</a></td>
										<td class="ate-center">${vo.movieTimeNum}분</td>
										<td>${vo.paymentNum}</td>
										<td>${vo.filmType}</td>
										<td class="ate-center">${vo.cinemaName}</td>
										<td class="ate-center">${vo.theaterName}</td>
										<td class="ate-center">${vo.seats}개</td>
										<td>${vo.totalPrice}</td>
										<td>${vo.common}</td>
										<td>${vo.teenager}</td>
										<td>${vo.preference}</td>
										<td>${vo.createAt}</td>
										<td class="del-td">X</td> --%>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- 페이저 -->
						<div class="pager">
							<ul class="pagination">
								<c:if test="${pager.curBlock>1}">
									<li><a href="#" class="custompager"
										title="${pager.startNum-1}">이전</a></li>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="p">
									<li><a href="#" class="custompager" title="${p}">${p}</a></li>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li><a href="#" class="custompager"
										title="${pager.lastNum+1}">다음</a></li>
								</c:if>
							</ul>
						</div>

					</div>

				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
	<script type="text/javascript">
		$(".del-td").click(function(){
			console.log("d")
			if(confirm("삭제하시겠습니까?")){
				alert("삭제되었습니다.");
			}
		});
	</script>
	<script src="js/scripts.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

</body>
</html>
