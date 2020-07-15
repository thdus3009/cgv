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
					<div>
						<div class="contents">
							<div>
								<div class="col_content">
									<div class="col_detail">
										<form action="./movieUpdate" method="post" enctype="multipart/form-data">
										<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<fieldset>
												<div class="tbl_write">
												
												<input type="text" id="trailerCount" value="${tco}" name="trailerCount"><!-- 카운트 값이 들어옴 -->
												<input type="text" id="steelCutCount" value="${sco}" name="steelCutCount">
												
												
												<input type="hidden" value="${vo.num}" id="num" name="num">
												<input type="hidden" value="${vo.movieImageVOs[0].num}" id="num1" > <!-- imgaeVO의 AI인 num -->
												<input type="hidden" value="${vo.movieImageVOs[0].fileName}" id="fileName1">
												
												<c:forEach var="ar" items="${ar}" >
													<c:if test="${ar.type eq 2 }">
													<input type="hidden" value="${ar.num}" id="numT" > <!-- type 2 imageNum -->
													<input type="hidden" value="${ar.fileName}" id="fileNameT"> 
													</c:if>
												</c:forEach>
												<c:forEach var="ar" items="${ar}" >
													<c:if test="${ar.type eq 3 }">
													<input type="hidden" value="${ar.num}" id="numS" > <!-- type 3 imageNum -->
													<input type="hidden" value="${ar.fileName}" id="fileNameS"> 
													</c:if>
												</c:forEach>
												
												<%-- <input type="text" value="${vo.num}" name="num"> --%>
												 
												
													<table class="tbl_bbs_write">
														<tbody>
															<div class="form-group">
																<label for="files">타이틀 이미지:</label> <input type="file"
																	class="form-control files check" id="files"
																	placeholder="타이틀 이미지 선택" name="files">
															</div>

															<c:if test="${path  eq 'Update'}">
																<p>${vo.movieImageVOs[0].originName}
																<%-- <i id="${vo.num}" class=" fileDelete"></i> --%>
																<img alt="" src="../../images/movie/movieList/x.png" 
																style="width: 20px; height: 20px;" class="fileDelete" id="${vo.movieImageVOs[0].num}"><!-- 썸네일 num -->
																</p>
															</c:if>
															<!-- ============== -->
															
															<div style="float: left;" id="tra">
															<div class="form-group" style="float: left; width: 650px;" id="1d">
																<label for="files">트레일러 img:</label>
																<input type="button" id="addI" value="추가">
																
																	<c:forEach var="ar" items="${ar}" varStatus="i">
																		<c:if test="${ar.type eq 2 }">
																		<div>
																		<label for="files"></label> 
																		<input type="file"
																		class="form-control files check" id="files${i.index}"
																		placeholder="타이틀 이미지 선택" name="files">
																		<p>${ar.originName}
																			<img alt="" src="../../images/movie/movieList/x.png"
																			data-imgpath ="${ar.fileName}"
																			style="width: 20px; height: 20px;" data-imagenum="${ar.num}" class="fileDeleteT" > <!-- 트레일러  num -->
																		</p>
																		</div>
																		</c:if>
																	</c:forEach>
																	<div class="form-group"  id="f">
																	
																	</div>
															</div>
															
															
															<div class="form-group" style="float: left; width: 650px; margin-left: 80px;margin-right: 50px;" id="2d">
																<label for="videolink">예고 영상:</label>
																	
																	<c:forEach var="ar" items="${ar}" varStatus="i" >
																		<c:if test="${ar.type eq 2 }">
																		 <input type="text"
																			class="form-control videolink check " id="videolink${i.index}"
																			placeholder="예고편 영상 링크" name="videolink" value="${ar.movieVideoVOs[0].videolink}"><br>
																	</c:if>	
																</c:forEach>
																<div class="form-group"  id="f2">
																	
																</div>
															</div>
															
															</div>
															<!-- ============== -->
															
															
															<div class="form-group">
																<label for="title">제목:</label> <input type="text"
																	class="form-control check" id="title" name="title" value="${vo.title}">
															</div>
															<div class="form-group">
																<label for="titleEng">영문제목:</label> <input
																	type="text" class="form-control check" id="titleEng"
																	name="titleEng" value="${vo.titleEng}">
															</div>
															<div class="form-group">
																<label for="runtime">러닝타임:</label> <input type="text"
																	class="form-control check" id="runtime" name="runtime" value="${vo.runtime}">
															</div>
															<div class="form-group">
																<label for="director">감독:</label> <input type="text"
																	class="form-control check" id="director" name="director" value="${vo.director}">
															</div>
															<div class="form-group">
																<label for="actor">출연 배우:</label> <input type="text"
																	class="form-control check" id="actor" name="actor" value="${vo.actor}">
															</div>
															<div class="form-group">
																<label for="ganre">장르:</label> <input type="text"
																	class="form-control check" id="ganre" name="ganre" value="${vo.ganre}">
															</div>
															<div class="form-group">
																<label for="ageLimit">연령제한:</label> <input type="text"
																	class="form-control check" id="ageLimit" name="ageLimit" value="${vo.ageLimit}">
															</div>
															<div class="form-group">
																<label for="country">국가:</label> <input type="text"
																	class="form-control check" id="country" name="country" value="${vo.country}">
															</div>
															
															
															<div class="form-group" >
																<label for="files">스틸컷:</label>
																<input type="button" id="addS" value="추가">
																	<c:forEach var="ar" items="${ar}" varStatus="i">
																		<c:if test="${ar.type eq 3 }">
																		<div>
																		<label for="files"></label> 
																		<input type="file"
																			class="form-control files check" id="files"
																			placeholder="타이틀 이미지 선택" name="files">
																		<p>${ar.originName}
																			<img alt="" src="../../images/movie/movieList/x.png"
																			data-imgpaths ="${ar.fileName}"
																			style="width: 20px; height: 20px;" class="fileDeleteS" data-imagenums="${ar.num}"> <!-- 삭제할 id를 뭘로 주지... -->
																		</p>
																		</div>
																		</c:if>
																	</c:forEach>
																	<div class="form-group" id="st">
																
																</div>
															</div>
															
															
															<div class="form-group">
																<label for="openDate">개봉일:</label> <input type="date"
																	class="form-control check" id="openDate" name="openDate" value="${vo.openDate}">
															</div>

															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysYear">
																<fmt:formatDate value="${now}" pattern="yyyy" />
															</c:set>
															<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="i" />

															<c:if test="${path eq 'Write' }">
																<div class="form-group">
																	<label for="createAt">생성일:</label> <input type="date"
																		class="form-control" id="createAt" name="createAt"
																		value="${i}" readonly="readonly">
																</div>
															</c:if>

															<div class="form-group">
																<label for="contents">Contents:</label>
																<textarea rows="" cols="" class="form-control check"
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
			<c:import url="../template/footer.jsp"></c:import>
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	// ====썸네일 =====
	$(".fileDelete").click(function(){
		var check = confirm("삭제하시겠습니까?");
		if(check){
			var s = $("#num1").val();
			console.log(s+"썸네일 num");
			var fileName1=$("#fileName1").val();
			console.log(fileName1 +"썸 파일이름")
			
			$.post("../../movieImage/movieImageDelete",{num:s,fileName:fileName1,_csrf : $("#_csrf").val()},function(data){
				console.log(data+"dd");//null
				
				if(data>0){
					$(".fileDelete").parent().remove();
					

					}
				});

			}

		});


	// ====트레일러 =====
	//기존 파일
	//var count = 0; //삭제버튼 카운트
	var count = $("#trailerCount").val();
	console.log(count+" :현재 1");

	
	$(".fileDeleteT").each(function(index){
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var numt = $(this).data("imagenum");	
				var fileNameT=$(this).data("imgpath");
				console.log(fileNameT+"파일이름");
				
				var img = $(this).parent().prev().attr('id');
				console.log(img);
				
				var vi=$("#videolink"+index);
				console.log(vi);
				vi.remove();
				
				count--;
				console.log("init Count : "+count);
				$("#trailerCount").val(count);
				

				var th = $(this);
				
				$.post("../../movieImage/movieImageDelete",{num:numt,fileName:fileNameT,_csrf : $("#_csrf").val()},function(data){
					console.log(data+"dd");//null
					
					if(data>0){
						th.parent().parent().remove();	
					}
				});
			}
		});
	});

	 
	//추가버튼 클릭시
	$("#addI").click(function(){
	 	var numT=$("#trailerCount").val();
		var nn =Number(numT); 

		
		
		if(count <3){
			$("#f").append('<div class="group2">'+
					'<input type="file" multiple="multiple" style="width: 45%!important; float:left; "'+
					' class="form-control files check form-control2" id="files"placeholder="트레일러 이미지 선택" name="files">'+
					'<input type="text" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="예고편 영상 링크" name="videolink"'+
					'style="padding: 12px; width: 45%!important;display: inline-block;">'+
					'<span class="x" style="width: 10%!important;" >X</span>' +
					'</div>');
		

			$("#trailerCount").val(count);
			count++;
			console.log("init Count : "+count);

			console.log(count+"count");
			$("#trailerCount").val(count);
			
			}else{
				alert("최대 3개까지 가능합니다.")
			}
		
		});	
	
	 $("#f").on("click",".x",function(){ //추가된 파일 필요없을 시 삭제
		$(this).parent().remove();

		count--;
		console.log(count+"count");
		$("#trailerCount").val(count);
		
	}); 

	
	//=== 스틸컷 ====

	var counts =$("#steelCutCount").val();
	console.log(counts+"counts");
		
	$(".fileDeleteS").each(function(index){
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var nums = $(this).data("imagenums");	
				console.log(nums+"썸네일");
				var fileNameS=$(this).data("imgpaths");
				console.log(fileNameS+"파일이름");
				
				counts--;
				console.log("init Count : "+counts);
				$("#steelCutCount").val(counts);
				
				var thi = $(this);
				
				$.post("../../movieImage/movieImageDelete",{num:nums,fileName:fileNameS,_csrf : $("#_csrf").val()},function(data){
					console.log(data+"dd");//null
					
					if(data>0){
						thi.parent().parent().remove();
						
						}
					});
				}
			});
	});

	
	$("#addS").click(function(){
		if(counts<5){
			$("#st").append('<div><input type="file" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="스틸컷 이미지 " name="files"'+
					'style=" width: 1500px;"> <span class="xS">X</span></div>');
			
			
			$("#steelCutCount").val(counts);
			counts++;
			console.log("init Count : "+counts);

			console.log(counts+"count");
			$("#steelCutCount").val(counts);

			
			}else{
				alert("최대 5개까지 가능합니다.")
				}
		
		});
	$("#st").on("click",".xS",function(){
		$(this).parent().remove();
		
		counts--;
		console.log(counts+"counts");
		$("#steelCutCount").val(counts);
		
		});


</script>
<script type="text/javascript" src="../../js/movie/movieWrite.js"></script>
	
</body>
</html>