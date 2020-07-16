<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- movieWrite -->
<title>관리자 페이지</title>

<link rel="stylesheet" href="/css/styles.css" />
<link rel="stylesheet" href="/css/admin/movie/movie.css" />
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

<style type="text/css">
	.minus	{
		width:16px;
		height:16px;
		margin-left:7px;
	}
	

</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- 로고 -->
		<a href="/admin"><img src="/images/header/h1_cgv.png"
			class="admin-logo" /></a>
		<!-- 검색 바-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색어를 입력"
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- 로그인-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/">메인 페이지로</a> <a
						class="dropdown-item" href="#">관리자 설정</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">로그아웃</a>
				</div></li>
		</ul>
	</nav>

	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공지사항
						</a>
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="./admin/movie/movieWrite">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 영화 관리
						</a> <a class="nav-link" href="./admin/cinema/cinemaList">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 극장 관리
						</a> <a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 예매 관리
						</a> <a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 리뷰 관리
						</a> <a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 배너 관리
						</a>
					</div>
				</div>
			</nav>
		</div>

		<!-- 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1>Event ${path}</h1>
					<div>

						<div class="contents">
							<div>

								<div class="col_content">

									<!----------------------------------------------------------------------------------------------------- contents detail -->

									<div class="col_detail">

										<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
										<div class="customer_top">
											<!-- 뭐하는 부분일까요..? -->
											
											
										</div>

										<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
										<form action="./event${path}" method="post" enctype="multipart/form-data" id="fo">
										<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<c:if test="${path eq 'Update'}">
											<input type="hidden" name="num" value="${vo.num}"> 
										</c:if>
											<fieldset>

												<div class="tbl_write">
													<!-- imgaeVO의 AI인 num -->
													<%-- <input type="hidden" value="${vo.num}" name="num"> 
													<input type="hidden" value="${vo.movieImageVOs.fileName}" id="fileName"> --%>

													<table class="tbl_bbs_write">
														<colgroup>
															<col style="width: 100px;">
															<col style="width: 320px;">
														</colgroup>
														<tbody>
															<div class="form-group">
														   	 <label for="local">분류:</label>
														   	 <select class="" id="" name="kind">
														   	 	<option value="special">스페셜이벤트</option>
														   	 	<option value="movie">영화/예매</option>
														   	 	<option value="discount">제휴/할인</option>
														   	 	<option value="membership">멤버십</option>
														   	 	<option value="pub">PUB이벤트</option>
															 </select>
														  	</div>


															<div class="form-group">
																<label for="title">제목:</label>
																<input type="text" class="form-control" id="title" name="title" value="${vo.title}">
															</div>
															
															<div class="form-group">
																<label for="files">배너 이미지:</label> 
																<span>
																<span>
																	<c:if test="${path  eq 'Insert'}">
																		<input type="file" class="form-control files" id="files" placeholder="배너 이미지 선택" name="files">
																	</c:if>
																	<c:if test="${path  eq 'Update' and vo.eventImageVOs[0].type eq 0}">
																		<input type="text" class="form-control files" value="${vo.eventImageVOs[0].originName}" placeholder="배너 이미지 선택" name="files">
																		
																		<i id="${vo.eventImageVOs[0].num}" class="glyphicon glyphicon-remove remove fileDelete fd0"  data-type="0" name="${vo.eventImageVOs[0].fileName}">
																	    		<img alt="" class="minus" src="/images/theater/minus.png">
																	    </i>
																	</c:if>
																</span>
																</span>
															</div>
															
														<%-- 	<div class="form-group">
																<label for="files">배너 이미지:</label> <input type="text"
																	class="form-control files" value="${vo.eventImageVOs[0].originName}" 
																	placeholder="배너 이미지 선택" name="files"><img alt="" class="minus" src="/images/theater/minus.png">
																	<c:if test="${path  eq 'Update' and !empty vo.eventImageVOs[0]}">
																	    <p style="margin-left:110px;">${vo.eventImageVOs[0].originName}
																	    	<i id="${vo.eventImageVOs[0].num}" class="glyphicon glyphicon-remove remove fileDelete fd0"
																	    	name="${vo.eventImageVOs[0].fileName}">
																	    		<img alt="" class="minus" src="/images/theater/minus.png">
																	    	</i>
																		</p>
																	</c:if>
															</div> --%>
															
															<div class="form-group">
																<label for="files">컨텐츠 이미지:</label>
																<span>
																<span>
																	<c:if test="${path  eq 'Insert'}">
																		<input type="file" class="form-control files" id="files" placeholder="컨텐츠 이미지 선택" name="files" data-type="1">
																	</c:if>
																	<c:if test="${path  eq 'Update' and vo.eventImageVOs[1].type eq 1}">
																		<input type="text" class="form-control files" value="${vo.eventImageVOs[1].originName}" placeholder="배너 이미지 선택" name="files">
																		
																		<i id="${vo.eventImageVOs[1].num}" class="glyphicon glyphicon-remove remove fileDelete fd1"  data-type="1" name="${vo.eventImageVOs[1].fileName}">
																	    		<img alt="" class="minus" src="/images/theater/minus.png">
																	    </i>
																	</c:if>
																</span>
																</span>
															</div>
															
															


															<div class="form-group">
																<label for="startDate">시작일:</label>
																<input type="date"
																	class="form-control" id="startDate" name="startDate"
																	value="${vo.startDate}">
															</div>

															<div class="form-group">
																<label for="endDate">마감일:</label> <input type="date"
																	class="form-control" id="endDate" name="endDate"
																	value="${vo.endDate}">
															</div>
														<%-- 	<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysYear">
																<fmt:formatDate value="${now}" pattern="yyyy" />
															</c:set>
															<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="i" /> --%>

															<%-- <c:if test="${path eq 'Write' }">
																<div class="form-group">
																	<label for="createAt">생성일:</label> <input type="date"
																		class="form-control" id="createAt" name="createAt"
																		value="${i}" readonly="readonly">
																</div>
															</c:if> --%>

															<div class="form-group">
																<label for="contents">Contents:</label>
																<textarea rows="" cols="" class="form-control"
																	id="contents" name="contents">${vo.contents}</textarea>

															</div>

														</tbody>

													</table>

												</div>
												<div class="btn_s">
													<a href="./movieList" class="round gray" id="cancle"> 
														<span>취소</span>
													</a>
													<button id="btn" type="submit" class="round inred">
														<span>등록하기</span>
													</button>
													<span class="test" id="test1">●●●●●</span>
												</div>
											</fieldset>
										</form>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!-- 스크립트 -->
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
	<script type="text/javascript">

		var deleteImage = [];

	
		$(".fileDelete").each(function(index){
			$(this).click(function(){

				
				
				//var test = 
			  	var check = confirm("파일을 삭제하시겠습니까?");

				if(check){
					var s = $(".fd"+index);
					var tp = s.data("type");
					alert("tp :" + tp)
					
					
				/* 	$.get("./fileDelete",{num:$(this).attr("id"),fileName:$(this).attr("name")}, function(data){
						alert(data);
						
						if(data>0){
							alert("성공");
							alert(data);
							s.parent().find('input').remove();
							s.parent().parent().html('<input type="file" class="form-control files" id="files" placeholder="배너 이미지 선택" name="files">');
							$("#fo").append('<input type="hidden" name="type" value="'+ tp +'">');
						
						}else{
							alert(data);
							alert("파일 삭제 실패ㅠㅠ");
						}
					}); */
					s.parent().find('input').remove();
					s.parent().parent().html('<input type="file" class="form-control files" id="files" placeholder="배너 이미지 선택" name="files">');
					
					deleteImage.push(s.attr('id'));
					alert(deleteImage);
					$("#fo").append('<input type="hidden" name="delNum" value="'+ deleteImage[deleteImage.length-1] +'">');
					
				}  
				
			});
		});

		$("#test1").click(function(){
			$("#fo").append('<input type="text" value=">.<">');
		})

		

	</script>

</body>
</html>