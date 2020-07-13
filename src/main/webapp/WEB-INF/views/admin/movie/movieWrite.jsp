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
					<h1>Movie ${path}</h1>
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
										<form action="./movie${path}" method="post" enctype="multipart/form-data">
										<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<fieldset>
												<input type="hidden" id="trailerCount" value="0" name="trailerCount"><!-- 카운트 값이 들어옴 -->
												<input type="hidden" id="steelCutCount" value="0" name="steelCutCount">
												<div class="tbl_write">

													<input type="hidden" value="${vo.movieImageVOs.num}"
														id="num1">
													<!-- imgaeVO의 AI인 num -->
													<input type="hidden" value="${vo.num}" name="num"> 
													<input
														type="hidden" value="${vo.movieImageVOs.fileName}"
														id="fileName">

													<table class="tbl_bbs_write">
														<colgroup>
															<col style="width: 100px;">
															<col style="width: 320px;">
														</colgroup>
														<tbody>
															
					
															<div class="form-group" >
																<label for="files">타이틀 이미지:</label> <input type="file"
																	class="form-control files check" id="files"
																	placeholder="타이틀 이미지 선택" name="files">
															</div>
															
															
																<div class="form-group"  style="width: 650px;" id="d1">
																	<label for="files">트레일러</label>
																	<img alt="" src="../../images/theater/plus.png" 
																	style="width: 20px; height: 20px;" id="addI"> 
																<div id="tt" >
																	<div class="form-group"  id="f" style="float: left;" >
																	
																	</div>
																	
																</div>
																 </div>
															
																
																<!-- <div class="form-group" style="width: 650px; float: left; margin-left: 80px;margin-right: 50px;" id="d2">
																	<label for="files">트레일러</label> <br>
																	<label for="videolink">video:</label>
																	 <img alt="" src="../../images/theater/plus.png" 
																	style="width: 20px; height: 20px;" id="addV">
																	
																</div> -->
														
															
															
															<br><br><br>
															<div class="form-group"  style="clear: both;">
																<label for="title" >제목:</label> <input type="text"
																	class="form-control check" id="title" name="title"
																	value="${vo.title }">
															</div>
															<div class="form-group">
																<label for="titleEng">영문제목:</label> <input
																	type="text" class="form-control check"  id="titleEng"
																	name="titleEng" value="${vo.titleEng }">
															</div>
															<div class="form-group">
																<label for="runtime">러닝타임:</label> <input type="text"
																	class="form-control check" id="runtime" name="runtime"
																	value="${vo.runtime }">
															</div>
															<div class="form-group">
																<label for="director">감독:</label> <input type="text"
																	class="form-control check" id="director" name="director"
																	value="${vo.director }">
															</div>
															<div class="form-group">
																<label for="actor">출연 배우:</label> <input type="text"
																	class="form-control check" id="actor" name="actor"
																	value="${vo.actor }">
															</div>
															<div class="form-group">
																<label for="ganre">장르:</label> <input type="text"
																	class="form-control check" id="ganre" name="ganre"
																	value="${vo.ganre }">
															</div>
															<div class="form-group">
																<label for="ageLimit">연령제한:</label> <input type="text"
																	class="form-control check" id="ageLimit" name="ageLimit"
																	value="${vo.ageLimit }">
															</div>
															<div class="form-group">
																<label for="country">국가:</label> <input type="text"
																	class="form-control check" id="country" name="country"
																	value="${vo.country }">
															</div>
															
															<div class="form-group" style="width: 650px; " >
																<label for="files">스틸컷</label> <br>
																<img alt="" src="../../images/theater/plus.png" 
																style="width: 20px; height: 20px;" id="addS"> 
																<div class="form-group" id="st">
																
																</div>
															</div>
															
															<div class="form-group">
																<label for="openDate">개봉일:</label> <input type="date"
																	class="form-control check" id="openDate" name="openDate"
																	value="${vo.openDate}">
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
																<label for="contents" >Contents:</label>
																<textarea rows="" cols="" class="form-control check"
																	id="contents" name="contents">${vo.contents }</textarea>

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
	<script type="text/javascript" src="../../js/movie/movieWrite.js"></script>
	
	<script type="text/javascript">

	var num=0;
	var count =1;
	var tcount =0;
	var trailerCount = $("#trailerCount").val();
	
	var num2=0;
	var count2=1;

	var numS =0;
	var countS=1;
	var scount =0;
	var steelCutCount = $("#steelCutCount").val();
	//트레일러 이미지
	$("#addI").click(function(){
		if(num<3){
			//이미지
			$("#f").append(
					'<div class="group1">'+
					'<input type="file" multiple="multiple" style="width:45%!important; float:left;"'+
					' class="form-control files check form-control2" id="files"placeholder="트레일러 이미지 선택" name="files">'+
					'<input type="text" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="예고편 영상 링크" name="videolink"'+
					'style="padding: 12px; width: 45%!important;display: inline-block;">'+
					'<span class="x" style="width: 10%!important;">X</span>'+
					'</div>');

		
		
			num++;
			count++;
			
			tcount = count-1; //트레일러 이미지 type을 위해 count하는 값
			trailerCount=tcount;
		
			$("#trailerCount").val(trailerCount);
			console.log(trailerCount);
			
			
			}else{
				alert("최대 3개까지 가능합니다.")
			}
		
		});	
	//트레일러 영상 링크
	/*
	$("#addV").click(function(){
		if(num2<3){
			$("#f2").append('<div><input type="text" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="예고편 영상 링크" name="videolink"'+
					'style="padding: 12px; width: 100%;"> <span class="x2">X</span></div>');
			num2++;
			count2++;
			}else{
				alert("최대 3개까지 가능합니다.")
			}
		
		});	*/

	// 스틸컷 이미지
	$("#addS").click(function(){
		if(numS<5){
			$("#st").append('<div><input type="file" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="스틸컷 이미지 " name="files"'+
					'style=" width: 1500px;"> <span class="xS">X</span></div>');
			numS++;
			countS++;

			scount = countS-1;
			steelCutCount=scount;
			$("#steelCutCount").val(steelCutCount);
			
			}else{
				alert("최대 5개까지 가능합니다.")
				}
		
		});

	
 	$("#f").on("click",".x",function(){ //추가된 파일 필요없을 시 삭제
		$(this).parent().remove();
 		num--;
 		 
		});

   $("#f2").on("click",".x",function(){ //추가된 비디오링크 필요없을 시 삭제
		$(this).parent().remove();
		num2--;

		});   
	$("#st").on("click",".xS",function(){
		$(this).parent().remove();
		numS--;
		});

	
	</script>
	
</body>
</html>