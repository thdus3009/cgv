<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/head.jsp"></c:import>
<link rel="stylesheet" href="/css/admin/movie/movie.css" />
<link rel="stylesheet" href="/css/admin/cinema/cinemaList.css" />

<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />


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

					<h1>Movie Update</h1>
					<p>영화 등록</p>

					<div>
						<div class="contents">
							<div>
								<div class="col_content">
									<div class="col_detail">


										<form action="./movieUpdate" method="post" enctype="multipart/form-data">
										<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />

											<fieldset>
												<div class="tbl_write">
												<input type="hidden" value="${vo.movieImageVOs.num}" id="num1" > <!-- imgaeVO의 AI인 num -->
												<input type="text" value="${vo.num}" name="num">
												<input type="hidden" value="${vo.movieImageVOs.fileName}" id="fileName"> 
													<table class="tbl_bbs_write">
														<tbody>
															<div class="form-group">
																<label for="files">타이틀 이미지:</label> <input type="file"
																	class="form-control files" id="files"
																	placeholder="타이틀 이미지 선택" name="files">
															</div>

															<c:if test="${path  eq 'Update'}">
																<p>${vo.movieImageVOs.originName}<i id="${vo.num}"
																		class=" fileDelete"></i>
																</p>
															</c:if>


															<div class="form-group">
																<label for="videolink">예고 영상:</label> <input type="text"
																	class="form-control videolink" id="videolink"
																	placeholder="예고편 영상 링크" name="videolink" value="${vo.movieVideoVOs.videolink}">
															</div>
															<div class="form-group">
																<label for="title">제목:</label> <input type="text"
																	class="form-control" id="title" name="title" value="${vo.title}">
															</div>
															<div class="form-group">


																<label for="titleEng">영문제목:</label> <input
																	type="text" class="form-control" id="titleEng"
																	name="titleEng" value="${vo.titleEng}">


															</div>
															<div class="form-group">
																<label for="runtime">러닝타임:</label> <input type="text"
																	class="form-control" id="runtime" name="runtime" value="${vo.runtime}">
															</div>
															<div class="form-group">
																<label for="director">감독:</label> <input type="text"
																	class="form-control" id="director" name="director" value="${vo.director}">
															</div>
															<div class="form-group">
																<label for="actor">출연 배우:</label> <input type="text"
																	class="form-control" id="actor" name="actor" value="${vo.actor}">
															</div>
															<div class="form-group">
																<label for="ganre">장르:</label> <input type="text"
																	class="form-control" id="ganre" name="ganre" value="${vo.ganre}">
															</div>
															<div class="form-group">
																<label for="ageLimit">연령제한:</label> <input type="text"
																	class="form-control" id="ageLimit" name="ageLimit" value="${vo.ageLimit}">
															</div>
															<div class="form-group">
																<label for="country">국가:</label> <input type="text"
																	class="form-control" id="country" name="country" value="${vo.country}">
															</div>
															<div class="form-group">
																<label for="openDate">개봉일:</label> <input type="date"
																	class="form-control" id="openDate" name="openDate" value="${vo.openDate}">
															</div>

															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysYear">
																<fmt:formatDate value="${now}" pattern="yyyy" />
															</c:set>
															<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
																var="i" />

															<c:if test="${path eq 'Write' }">
																<div class="form-group">
																	<label for="createAt">생성일:</label> <input type="date"
																		class="form-control" id="createAt" name="createAt"
																		value="${i}" readonly="readonly">
																</div>
															</c:if>

															<div class="form-group">
																<label for="contents">Contents:</label>
																<textarea rows="" cols="" class="form-control"
																	id="contents" name="contents">${vo.contents}</textarea>

															</div>

														</tbody>

													</table>

												</div>
												<div class="btn_s">


													<a href="./movieSelect?num=${vo.num}" class="round gray" id="cancle"> 
														<span>취소</span>


													</a>
													<button id="btn" type="submit" class="round inred">
														<span>등록하기</span>
													</button>
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
	<c:import url="../template/scripts.jsp"></c:import>
	<script type="text/javascript">
	count = 1;
	$(".fileDelete").click(function(){
		var check = confirm("삭제하시겠습니까?");
		if(check){
			var s = $("#num1").val();
			var fileName=$("#fileName").val();
			
			console.log(s);//o
			console.log(fileName);//o

			$.post("../../movieImage/movieImageDelete",{num:s,fileName:fileName,_csrf : $("#_csrf").val()},function(data){
				console.log(data+"dd");//null
				
				if(data>0){
					$(".fileDelete").parent().remove();
					

					}
				});

			}

		});


</script>
	
</body>
</html>