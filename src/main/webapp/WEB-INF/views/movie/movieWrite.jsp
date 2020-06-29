<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<link href="../css/bbsForm.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">고겍센터</a>
					</li>
					<li class="last">
						글쓰기
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div>
				
				<div class="col_content">
					<!----------------------------------------------------------------------------------------------------- contents aside -->
					<div class="col_aside">
						<div class="snb">
							<ul>
								<li><a href="">고객센터 메인<i></i></a></li>
								<li><a href="">자주찾는 질문<i></i></a></li>
								<li><a href="/bbs/boardList">공지/뉴스<i></i></a></li>
								<li class="on"><a href="#">이메일 문의<i></i></a></li>
								<li><a href="">분실문 문의<i></i></a></li>
								<li><a href="">단체/대관 문의<i></i></a></li>
								<li><a href="">대학로 옥탑 예약<i></i></a></li>
							</ul>
						
						</div>
						<div class="ad_area">
							<div class="ad_panner_1">
								<a href="">
									<img alt="" src="../images/bbsList/200313_160x300.jpg">
								</a>
							</div>
							<div class="ad_panner_2">
								<a href="">
									<img alt="" src="../images/bbsList/0325_160x35.png">
								</a>
							</div>
						</div>
					</div>
					
					<!----------------------------------------------------------------------------------------------------- contents detail -->
					
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="customer_top">
							<h2 class="tit">Movie${path} </h2>
							<p class="stit">CGV이용과 관련된 사항에 대하여서 작성가능합니다.</p>
						</div>
						
						<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
						<form action="./${board}${path}" method="post" enctype="multipart/form-data">
							<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<fieldset>
								
								<div class="tbl_write">
																
									<input type="text" value="${vo.movieImageVOs.num}" id="num1" > <!-- imgaeVO의 AI인 num -->
									<input type="text" value="${vo.num}" name="num">
									<input type="text" value="${vo.movieImageVOs.fileName}" id="fileName"> 
									
									<table class="tbl_bbs_write">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 320px;">
										</colgroup>
										<tbody>
											
										
											 <div class="form-group">
										      <label for="files">타이틀 이미지:</label>
										      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
										    </div>
										    
										    <c:if test="${path  eq 'Update'}">
												<p>${vo.movieImageVOs.originName}<i id="${vo.num}" class="glyphicon glyphicon-remove remove fileDelete"></i></p>
										    </c:if>
										    
										    
										     <div class="form-group">
										      <label for="videolink">예고 영상:</label>
										      <input type="text" class="form-control videolink" id="videolink" placeholder="예고편 영상 링크" name="videolink" value="${vo.movieVideoVOs.videolink }" >
										    </div>
											 <div class="form-group">
											    <label for="title">Title:</label>
											    <input type="text" class="form-control" id="title" name="title" value="${vo.title }">
											  </div>
											   <div class="form-group">
											    <label for="titleEng">TitleEng:</label>
											    <input type="text" class="form-control" id="titleEng" name="titleEng"  value="${vo.titleEng }">
											  </div>
											   <div class="form-group">
											    <label for="runtime">runtime:</label>
											    <input type="text" class="form-control" id="runtime" name="runtime" value="${vo.runtime }">
											  </div>
											   <div class="form-group">
											    <label for="director">감독:</label>
											    <input type="text" class="form-control" id="director" name="director" value="${vo.director }">
											  </div>
											  <div class="form-group">
											    <label for="actor">출연 배우:</label>
											    <input type="text" class="form-control" id="actor" name="actor" value="${vo.actor }">
											  </div>
											  <div class="form-group">
											    <label for="ganre">장르:</label>
											    <input type="text" class="form-control" id="ganre" name="ganre" value="${vo.ganre }">
											  </div>
											  <div class="form-group">
											    <label for="ageLimit">연령제한:</label>
											    <input type="text" class="form-control" id="ageLimit" name="ageLimit" value="${vo.ageLimit }" >
											  </div>
											   <div class="form-group">
											    <label for="country">국가:</label>
											    <input type="text" class="form-control" id="country" name="country" value="${vo.country }">
											  </div>
											   <div class="form-group">
											    <label for="openDate">개봉일:</label>
											    <input type="date" class="form-control" id="openDate" name="openDate" value="${vo.openDate }">
											  </div>
											  
											  <c:set var="now" value="<%=new java.util.Date()%>" />
											<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"  var="i" />
											
											  <c:if test="${path eq 'Write' }" >
												  <div class="form-group">
												    <label for="createAt">생성일:</label> 
												    <input type="date" class="form-control" id="createAt" name="createAt" value="${i}" readonly="readonly" >
												  </div>
											  </c:if>
											  
											  <div class="form-group">
											    <label for="contents">Contents:</label>
											    <textarea rows="" cols="" class="form-control" id="contents" name="contents" >${vo.contents }</textarea>
											 
											  </div>
											  
										</tbody>
									
									</table>
									
								</div>
								<div class="btn_s">
									<a href="./movieList" class="round gray">
										<span>취소</span>
									</a>
									<button id="btn" type="submit" class="round inred"><span>등록하기</span></button>
								</div>
							</fieldset>
						</form>
						
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript" src="../js/bbsWrite.js"></script>
<script type="text/javascript">
	count = 1;
	$(".fileDelete").click(function(){
		var check = confirm("삭제하시겠습니까?");
		if(check){
			var s = $("#num1").val();
			var fileName=$("#fileName").val();
			
			console.log(s);//o
			console.log(fileName);//o

			$.post("../movieImage/movieImageDelete",{num:s,fileName:fileName,_csrf : $("#_csrf").val()},function(data){
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