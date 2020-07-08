<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
</head>
<body class="sb-nav-fixed">
	
	<c:import url="../template/header.jsp"></c:import>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<c:import url="../template/sidenav.jsp"></c:import>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<%-- <input id="_csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
			<main>
				<div class="container-fluid">
					<h1>Coupon ${path}</h1>
					<p>쿠폰 목록</p>

					<!-- 목록 -->
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr class="admin-tr">
									<th>No.</th>
									<th>이름</th>
									<th>시리얼 넘버</th>
									<th>비밀번호</th>
									<th>가격</th>
									<th>타입</th>
									<th>사용 수</th>
									<th>사용기간(시작)</th>
									<th>사용기간(끝)</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="admin-tr">
									<th>No.</th>
									<th>이름</th>
									<th>시리얼 넘버</th>
									<th>비밀번호</th>
									<th>가격</th>
									<th>타입</th>
									<th>사용 수</th>
									<th>사용기간(시작)</th>
									<th>사용기간(끝)</th>
								</tr>
							</tfoot>
							<tbody id="tb">
								<c:forEach items="${list}" var="vo">
									<tr class="admin-tr-each">
										<td class="ate-center">${vo.num}</td>
										<td class="ate-center"><a
											href="../coupon/couponSelect?num=${vo.num}">${vo.name}</a></td>
										<td class="ate-center">${vo.serialNum}</td>
										<td>${vo.pwd}</td>
										<td class="ate-center">${vo.price}</td>
										<td class="ate-center">${vo.type}</td>
										<td class="ate-center">${vo.count}</td>
										<td>${vo.sIssuance}</td>
										<td>${vo.eIssuance}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- 페이저 -->
						<div class="pager">
							<ul class="pagination">
								<c:if test="${pager.curBlock>1}">
									<li class="page-item"><a href="#" class="page-link"
										title="${pager.startNum-1}">이전</a></li>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="p">
									<li class="page-item"><a href="#" class="page-link" title="${p}">${p}</a></li>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li class="page-item"><a href="#" class="page-link"
										title="${pager.lastNum+1}">다음</a></li>
								</c:if>
							</ul>
						</div>

					</div>

				</div>
			</main>
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
	
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript">
        	
        	/* console.log("ㅎㅎ");
        	var local = '';
         	$(".breadcrumb-item>a").click(function(){
				local = $(this).text();
				console.log(local); */
			/* 	$.ajax({ 
					url : "./cinemaList", 
					type : "POST", 
					data : {"local":local},
					_csrf : $("#_csrf").val(),
					success : function(data) { 
						if(data>0){
					 		alert("전송 성공");
					 		console.log(data);
						}
					} 
				}); */

				/* $.post("./cinemaList",{"local":local, "_csrf": $("#_csrf").val()},function(data){
					
					$("#tb").html(data);
				});
            });  */
            
		</script>
</body>
</html>

        
