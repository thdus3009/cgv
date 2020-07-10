<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/movie/movieSelect.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/movie/movieSelect2.css" rel="stylesheet" type="text/css"><!-- review -->

<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/review/reviewList.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- chart CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />

<!-- BootStrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>

</head>
<body>


<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	<input type="hidden" id = "gTotal" value="${gTotal}">
	<input type="hidden" value="${vo.num}" class="num4">
	
	<input type="hidden" value="${uid}" class="username">
	<%-- <input type="hidden" value="${sessionScope.memberBasicVO.username}" class="username"> --%>
	
	<input type="hidden" id="_csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="container" >
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../" class="a">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="" class="a">영화</a>
					</li>
					<li class="last">
						영화상세
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div class="wrap-movie-detail" id="select_main">
				<div class="tit-heading-wrap">
					<h3>영화상세</h3>
					
				</div>
				<div class="sect-base-movie">
					<div class="box-image"  >
					<a href="" class="a">
						<span class="thumb-image">
							<img  class="box-image" alt="" src="../images/movie/movieList/filmCover/${vo.movieImageVOs.fileName}">
							<span class="icon-grade grade-${list.ageLimit}">${list.ageLimit}</span>
						</span>
					</a>
					</div>
					<div class="box-contents">
						<div class="title">
							<span id="title1">${vo.title}</span>
							<em class="round lightblue">
								<span>현재 상영중</span>
							</em>
							<p>${vo.titleEng}</p>
						</div>
						
						<div class="score" >
							<span class="strong percent">
								예매율&nbsp;
								<span>${vo.rate}</span>
							</span>
						
						
							<div class="egg-gage small" style="background: url('../images/movie/movieList/bg_writeinfo.gif') 0 12px no-repeat;">
									<!--   <img alt="" src="../images/movie/movieList/sprite_egg.png">-->
									
									<!-- <div class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png')" ></div> -->
									<c:if test="${vo.errRate lt 50 }">
									<!-- 터진  계란  -->
									<span class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png') no-repeat -0px -47px"></span>
									</c:if>
									
									<c:if test="${vo.errRate lt 70 && vo.errRate ge 50 }">
									<!-- 왕관없는 계란  -->
									<span class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png') no-repeat -18px -47px"></span>
									</c:if>
									
									<c:if test="${vo.errRate ge 70 }">
									<!-- 왕관있는 계란 -->
									 <span class="egg great" id="this" style="background:url('../images/movie/movieList/sprite_egg.png') no-repeat -38px -47px"></span> 
									</c:if>
								<span class="percent">${vo.errRate}</span>
							</div>
						</div>
						
						
						<div class="spec">
							<dl>
								<dt>감독 :&nbsp;</dt>
								<dd><a href="" class="a">${vo.director}</a></dd>
								<dd></dd>
								<dt>&nbsp;/ 배우 :&nbsp;</dt>
								<dd class="on">
									<a href="" class="a">${vo.actor}</a>
								</dd>
								<dt>장르 :&nbsp;${vo.ganre}</dt>
								<dd></dd>
								<dt>&nbsp;/ 기본 : &nbsp;</dt>
								<dd class="">${vo.ageLimit}세 이상,&nbsp;${vo.runtime},&nbsp;${vo.country}</dd>
								<br>
								<dt>개봉 : &nbsp;</dt>
								<dd class="on">${vo.openDate}</dd>
							</dl>
						</div>
						<span class="screentype">
						
						</span>
						
						
						<span class="like">
							<a class="link-count" href="" class="a">
								<i class="sprite_preegg1 btn_md default"></i>
								프리에그
							</a>
							<a class="link-reservation a" href="" style="background-image: url('../images/movie/movieList/sprite_btn.png')">예매</a>
						</span>
						
					</div>
					</div>
					<!--여기까지가 상영시간, 감독 등등 나오는 곳----------------------------------------------------------------------------------------------------->

					<!----------------------------------------------------------------------------------------------------- contents detail -->
					<div class="cols-content" id="menu" >
					<div class="col_detail">
					
					<ul class="tab-menu" style="padding-top: 40px;" >
						<li class="on" >
							<a title="현재 선택됨" href="" class="a">주요정보</a>
						</li>
						<li>
							<a href="" class="a">트레일러</a>
						</li>
						<li>
							<a href="" class="a">스틸컷</a>
						</li>
						<li>
							<a href="" class="a">평점/리뷰</a>
						</li>
						<li class="last">
							<a href="" class="a">상영시간표</a>
						</li>
					</ul>
					
					<div class="sect-story-movie" >
						<span class="strong">${vo.contents}</span>
					</div>
					
					<div id="showchart">
					<div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion" style="margin-top: 40px;">
						<ul class="graph">
							<li>
								<span class="strong">성별 예매 분포</span>
								<div id="qplot_sex" class="chart jqplot-target" style="position: relative">
								 <div id="chart_div" style="position: absolute; left: -20px;">
								 	
								 </div>
								</div>
							</li>
							<li>
								<span class="strong">연령별 예매 분포</span>
								<div id="qplot_sex" class="chart jqplot-target" style="position: relative">
								<div id="columnchart_values" style="width: 900px; height: 300px; position: absolute; left: -71px;" >
								
								</div>
								</div>
							</li>
						</ul>
					</div>
					</div>
					
					
					<div class="movie-detail-ad">
						<iframe src="" width="100%" height="90px"> </iframe>
					</div>
					
					<div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer" >
						<div class="heading">
							<span class="hh">&ensp; 트레일러</span>
							<span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">4건</span>
						</div>
						<ul>
							<li>
							<div class="box-image">
								<a href="${vo.movieVideoVOs.videolink }" class="a">
									<img alt="메인예고편" src="../images/movie/movieList/filmCover/rr.JPG" class="box-image">
								</a>
							</div>
							<div class="box-contents">
								<a href="" class="a">
									<span class="strong title">
										<span class="ico-trailer hd">HD</span>
										메인 예고편 영상
									</span>
								</a>
								
							</div>
							</li>
						</ul>
					</div>
					<!-- 여기까지가 트레일러 -->
					
					<div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
						<div class="heading">
							<span class="hh">&ensp; 스틸컷</span>
							<span class="count">
								<span class="strong" id="stillcut_current">1</span>
								21건
							</span>
						</div>
						
						<div class="slider-wrap">
						
						</div>
					</div> 
					<!-- 여기까지가 스틸컷 -->
					<div class="sect-grade" style="margin-top: 40px;">
						<div class="movie_grade">
							<div class="egg_point">
								<div class="title">
									배우들의 연기가 메소드급인<br>
									몰입하여 보게 되는 영화
								</div>
								<div class="rating" id="rating" style="position: relative;">
									<div class="box" style="position: absolute; right: 150px;">
									
									<!-- pre egg -->
									<!-- <div class="sprite_preegg big default" style="background: url('../images/movie/movieList/sprite_preegg.png')no-repeat -25px -20px;" ></div> -->
										
										 <span class="sprite_preegg big default" style="background: url('../images/movie/movieList/sprite_preegg.png') no-repeat -4px -35px;"></span> 
										
										<span class="desc" >PreEgg</span>
										<span class="percent">94%</span>
										<span class="tooltip">사전기대지수</span>
										
									</div>
									<div class="box box_golden" style="position: absolute; right: 40px;">
										<span class="sprite_preegg big great" style="background: url('../images/movie/movieList/sprite_preegg.png') no-repeat -115px -135px;"></span>
										<span class="desc">GoldenEgg</span>
										<span class="percent">${vo.errRate}</span>
										<span class="tooltip">실관람평지수</span>
									</div>
								</div>
							</div>
							
							<div class="chart_total">
								<div class="box">
									<div class="title">매력 포인트</div>
									<div class="radar-graph" id="chart2">
										<div id="myChartTest">
											<canvas id="myChart" width="100" height="100">
											
											</canvas>
										</div>
									</div>
								</div>
								<div class="box">
									<div class="title">감정 포인트</div>
									<div class="radar-graph" id="chart3">
										<div id="myChartTest">
											<canvas id="myChart2" width="100" height="100">
											
											</canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="real-rating">
							<p class="title">관람일 포함 7일 이내 관람평을 남기시면 <span class="strong red">CJ ONE 20P</span>가 적립됩니다.</p>
							<p class="desc"><span><em id="reviewer"></em>명의 실관람객이 평가해주셨습니다.</span></p>
							<div class="wrap_btn">
								<a class="link-gradewrite a" href="javascript:void(0);" onclick="review_Modal();"><span>평점작성</span></a>
								<a class="link-reviewwrite a" href="../review/reviewLook"><span>내 평점</span></a>
							</div>
						</div>
						
						<ul class="sort" id="sortTab">
							<!-- 최신순 -->
							<li class="sortTab on" data-order-type="0" id="test">
								<a href="javascript:void(0);" title="현재선택" class="a newBtn" onclick="newBtn();">
									최신순
									<span class="arrow-down"></span>
								</a>	
							</li>
							<!-- 추천순 -->
							<li class="sortTab" data-order-type="3" >
								<a href="javascript:void(0);" class="a recBtn" onclick="recBtn();">
									추천순
									<span class="arrow-down"></span>
								</a>
							</li>
							
						</ul>
						

						<!-- 리뷰 시작 / ajax_movieSelect.jsp 참고-->
						<div id="ajax_ms">
						
						
						</div>



					</div>
						

					</div>
				</div>
			
			</div>
		</div>
	</div>
	
		
	<!-- Modal ------------------------------------------------------------------------------------->
	<c:import url="../template/modal.jsp"></c:import>	

	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>


<!-- 스크립트 모음 ---------------------------------------------------------------------------------------------->
<script type="text/javascript" src="../js/bbsWrite.js"></script>
<!-- 글자 byte 체크 -->
<script type="text/javascript" src="../js/review/checkByte.js"></script>

<!-- 리뷰관련 script > 나중에 movieReview.js로 옮기기 -->
<script type="text/javascript">

var page1 = "";
var num4 = $(".num4").val(); //영화번호
var uid = $(".username").val(); //아이디 세션값

var select1 = "../review/movieSelect2";
var reservationNum = 0;

var g_num = 0;
var g_title = "";
var g_egg = 0;
var g_contents = "";


//페이지 들어가면 바로 실행(리뷰리스트)
window.onload = function () {
	$.ajax({
		type:"GET",
		url:"../review/movieSelect2",
		data:{
			movieNum : num4,
			
		},
		success:function(data){
			//html로 받음
			$("#ajax_ms").html(data);

			
			var totalCount = $("#totalCount").val();
			console.log("토탈:"+totalCount);
			$("#reviewer").html(totalCount);
			

		}
	})
}

 
 //페이지 버튼 > 이벤트 위임
$("#ajax_ms").on("click",".page1",function(){

	page1 =$(this).attr("data-page1");
	
	 	$.ajax({
			type:"GET",
			url:select1,
			data:{
				movieNum : num4,
				curPage : page1,
			},
			success:function(data){
				$("#ajax_ms").html(data);
			}
	
		})
		
}); 
 

/* ------------------------------------------------ */
//최신순
function newBtn(){
	select1="../review/movieSelect2";
	aa(select1);
	
}

//추천순
function recBtn(){
	select1="../review/movieSelect3";
	aa(select1);
}

function aa(url){
	$.ajax({
		type:"GET",
		url:url,
		data:{
			movieNum : num4,
			
		},
		success:function(data){
			//html로 받음
			$("#ajax_ms").html(data);

			
			var totalCount = $("#totalCount").val();
			console.log("토탈:"+totalCount);
			$("#reviewer").html(totalCount);

		}
	})
}


/* ------------------------------------------------ */
//... 버튼을 클릭하면 신고버튼 켜짐
var btn_delete = true;

 $("#ajax_ms").on("click",".btn_notify",function(){

	reservationNum =$(this).attr("data-reservation");
	var reservationNum1 = String(reservationNum); //숫자>문자

	if(btn_delete){
		$('#btn'+reservationNum).addClass('btn_on');
		btn_delete=false;	
	}else{
		$('#btn'+reservationNum).removeClass('btn_on');
		btn_delete=true;
	}
}); 

/* ------------------------------------------------ */
//checkLike > 1.like 2.spoiler 3.swearword
//스포일러 신고
$("#ajax_ms").on("click",".lii1",function(){
	reservationNum =$(this).attr("data-reservation");

	if(uid!=""){
		if(confirm("평점 내용에 스포일러가 포함되어 있습니까?")){
			$.ajax({
				type: "GET",
				url: "../review/reviewSpoiler",
				data:{
					reservationNum : reservationNum,
					uid : uid,
					movieNum : num4,
				},
				success:function(data){
					if(data>0){
						alert("신고가 성공적으로 접수되었습니다.");
					
					}else{
					//alert(data.trim());
						alert("이미 스포일러 신고를 누르셨습니다.");
					}
	
				 }
			})	
		}		
	}else{
		if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")){
			window.location.href='http://localhost/member/login';
		}
	}
});

//욕설,비방 신고
$("#ajax_ms").on("click",".lii2",function(){
	reservationNum =$(this).attr("data-reservation");

	if(uid!=""){
		if(confirm("평점 내용에 욕설/비방성 내용이 포함되어 있습니까?")){
			$.ajax({
				type: "GET",
				url: "../review/reviewSwearWord",
				data:{
					reservationNum : reservationNum,
					uid : uid,
					movieNum : num4,
				},
				success:function(data){
					if(data>0){
						alert("신고가 성공적으로 접수되었습니다.");
					
					}else{
					//alert(data.trim());
						alert("이미 욕설/비방 신고를 누르셨습니다.");
					}
	
				 }
			})	
		}
	}else{
		if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")){
			window.location.href='http://localhost/member/login';
		}
	}
});

/* ------------------------------------------------ */

//좋아요 버튼 > 이벤트 위임
$("#ajax_ms").on("click",".date",function(){
	//좋아요 아이디당 한개만 가능 (좋아요 눌렀을때 현재 session값있는지 확인)
	

	if(uid!=""){
		reservationNum =$(this).attr("data-reservation");

	 	$.ajax({
			type: "GET",
			url: "../review/reviewLike",
			data:{
				reservationNum : reservationNum,
				uid : uid,
				movieNum : num4,
			},
			success:function(data){
				//alert("성공 "+"최신?추천?"+select1+"영화번호?"+num4+"현재페이지?"+page1);
				//../review/movieSelect3 + 1 + 1
				
				if(data>0){
				alert("등록성공");
				
				}else{
				//alert(data.trim());
				alert("이미 좋아요를 누르셨습니다.");
				}


				$.ajax({
					type:"GET",
					url: select1,
					data:{
						movieNum : num4,
						curPage : page1,
					},
					success:function(data){
						$("#ajax_ms").html(data);
					}
				})
				 
			}
		})
	}else{
		if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")){
			window.location.href='http://localhost/member/login';
		}
	}
	
});


/* ------------------------------------------------ */



//리뷰 update, write
function review_Modal(){
	//0. 로그인 확인
	if(uid!=""){
	//1. 이영화를 봤는지 확인(아이디와 영화번호에 해당하는 "reservation 정보"가 있는지 먼저 확인)
	//2. 해당 영화를 봤다면 리뷰가 한개이상인지 확인 (리뷰>0 = 수정 , 리뷰=0 = 작성)
 	 	$.ajax({
			type:"GET",
			url: "../review/review_Modal",
			data:{
				uid : uid,
				movieNum : num4
			},
			success:function(data){
				if(data==1000000){ //해당 영화를 보지 않았을 경우에
					if(confirm("실관람객에 한하여 관람평 작성이 가능합니다.\n실관람객 등록 페이지로 이동하시겠습니까?")){
						window.location.href='http://localhost/review/reviewList';
					}
				//가장 최신쓴 "리뷰"의 reservationNum구하기(createAt은 notnull deleteAt은 null) 
				//data가 0이면 작성, 숫자나오면 수정
				}else if(data>=1){
					if(confirm("이미 관람평 작성을 완료하셨습니다. 관람평을 수정하시겠습니까?\n(해당 영화의 리뷰를 2개 이상 작성하였을 시 가장 최신예매순의 리뷰가 수정됩니다.)")){
				 	 	$.ajax({
							type:"GET",
							url: "../review/movieSelect_reviewUpdate",
							data:{
								uid : uid,
								movieNum : num4
							},
							success:function(data){
								 //console.log(data);
								 //alert(data.contents);
								 g_num = data.reservationNum
								 g_title = data.title;
								 g_egg = data.egg;
								 g_contents = data.contents;

								 document.getElementById("title").innerHTML =g_title; 
								 document.getElementById("mContents").value =g_contents;
								 if(g_egg==1){
									 $('input:radio[name="egg"][value=1]').prop('checked', true);
								 }else{
								 	 $('input:radio[name="egg"][value=0]').prop('checked', true);
								 }
								//글자 byte조회
								CheckByte(document.getElementById("mContents"));
								 
								$("#myModal").modal({backdrop: 'static', keyboard: false});
							}	
						})
					}	
				}else if(data==0){
					//어떤 번호의 reservation의 num에다 review를 쓸건지(가장 최신순)
					
				}
			}
		})  

		
	}else{
		if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")){
			window.location.href='http://localhost/member/login';
		}
	}	

}


//모달 수정 >>> 첫번째 모달 확인버튼 클릭시
$("#submitBtn1").click(function(e){
var mContents = document.getElementById("mContents");
g_contents = mContents.value;

var eggList = document.getElementsByClassName("egg");
for(i=0; i<eggList.length; i++){
	if(eggList[i].checked == true){
		g_egg = eggList[i].value;
		console.log("egg:"+g_egg);
		break;
	}
}

if(mContents.value.length>=10){
	
	if(confirm("관람평이 수정되었습니다.\n관람하신 영화의 관람 포인트를\n선택하시겠습니까?")== true){

		var Up_popupBtn2List = document.getElementsByClassName('Up_popupBtn2');
		
		for(i=0; i<Up_popupBtn2List.length; i++){
			if(Up_popupBtn2List[i].dataset.num3 == g_num){
				console.log("list.dataset.num : "+Up_popupBtn2List[i].dataset.num3);
				//2번째 모달로 이동
				//(i번째 2번째모달 이동버튼 클릭)
				Up_popupBtn2List[i].click();
				break;
			} 
		}
		
	}else{
		//여기서는 reservationNum, contents, egg정보만을 넘겨준다.
		
		console.log("아니오");
		
		$.ajax({

			type:"GET",
			url:"../review/review_Update1",
			data:{
				reservationNum : g_num,
				egg : g_egg,
				contents : g_contents,
				_csrf : $("#_csrf").val(),
			},
			success:function(data){
				alert("수정이 완료되었습니다.");
				location.reload();
				
			}
		})
		
	}
	
	//팝업창 닫히고 내용 초기화(mContents, data-dismiss="modal")

	
	$("#exit").click();

						
}else{
	alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
	e.preventDefault();
	
}

 });

//모달 수정22 >>> 2번째 모달들어갈때 checked초기화
$(".Up_popupBtn2").click(function(){
	
	// init
	$(".charmPoint").prop("checked", false);
	$(".emotionPoint").prop("checked", false);
});

var g_emotionPoint = 0;
var g_charmPoint = 0;
//3. 두 번째 모달
	 $("#submitBtn2").click(function(e){
	 //null값
	 g_charmPoint = getCharmPoint();
	 g_emotionPoint = getEmotionPoint();
	 
	if(g_charmPoint!=null && g_emotionPoint!=null){
	
		if(g_charmPoint==0){
			alert("매력포인트를 1개 이상 선택해주세요.")	
		} else{
			if(g_emotionPoint==0){
				alert("감정포인트를 1개 이상 선택해주세요.")
			}else {
				//여기서는 reservationNum, contents, egg, emotionPoint, charmPoint 정보를 넘겨준다.

					$.ajax({

					type:"GET",
					url:"../review/review_Update2",
					data:{
						reservationNum : g_num,
						egg : g_egg,
						contents : g_contents,
						charmPoint: g_charmPoint,
						emotionPoint: g_emotionPoint,
						_csrf : $("#_csrf").val(),
					},
					success:function(data){
						alert("수정이 완료되었습니다.");
						location.reload();
						
					}
				}) 
				
				 $("#exit2").click();
				 
					
			}
		}
	}
 });


		
//	 ------------------------------------------------------------------------------
	 
	 //charmpoint
	 function getCharmPoint() {
		 
		var charmPoint = 0;
		 
		var values = document.getElementsByClassName("charmPoint");
		 
		for(var i=0; i<values.length; i++) {
			if(values[i].checked){
					
			charmPoint += values[i].dataset.charm * 1;
			}					
		}
		
		return charmPoint;
	 }
	 
	 //emotionpoint
	 function getEmotionPoint() {
		 
			var emotionPoint = 0;
			 
			var values = document.getElementsByClassName("emotionPoint");
			 
			for(var i=0; i<values.length; i++) {
				if(values[i].checked){
				emotionPoint += values[i].dataset.emotion * 1;
				}					
			}
			return emotionPoint;
		 }
	 
	 
//	 ------------------------------------------------------------------------------


</script>















<!-- 성별 그래프 1번 -->
<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

    var total =${gTotal};
    console.log(total+"total");
	var w=${gender}/${gTotal};
	console.log(w+"w");
	var M = 1-w;

	$(function() {

	if(!(total>0)) {
	
		$("#ctl00_PlaceHolderContent_Section_Chart").prop("style", "display:none;");
	}
		
	});
	
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['여성', w],
          ['남성', M],
         
        ]);


        // Set chart options
        var options = {'title':'',
                       'width':450,
                       'height':320,
                       backgroundColor : '#fdfcf0'};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      </script>
<!-- 연령별 그래프 2번 -->

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
	var ageTotal=${ageTotal};
	console.log(ageTotal+"agetotal");
	
	var age10 =${age10}/${ageTotal};
	console.log(age10+"age10");
	var age20 =${age20}/${ageTotal};
	console.log(age20+"age20");
	var age30 =${age30}/${ageTotal};
	console.log(age30+"age30");
	var age40 =${age40}/${ageTotal};
	console.log(age40+"age40");
	var age50 =${age50}/${ageTotal};
	console.log(age50+"age50");
  
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["10대", ${age10}, "#b87333"],
        ["20대", ${age20}, "silver"],
        ["30대", ${age30}, "gold"],
        ["40대", ${age40}, "color: #e5e4e2"],
        ["50대", ${age50}, "color: #e5e4e2"],
        
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",	
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation",
                        },
                       2]);

      var options = {
        title: "",
        width: 530,
        height: 330,
        backgroundColor : '#fdfcf0',
        bar: {groupWidth: "75%"},
        legend: { position: "none" ,
        },
        
        hAxis : {
        	 gridlines: {
                 color: 'transparent'
             },
             
        },
        vAxis: {
            gridlines: {
                color: 'transparent'
            },
            textPosition:'none',
        },
      	
        
        
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>
<!-- 방사형 chart  -->
<script type="text/javascript">

console.log(${cdirector}+"direc");
console.log(${cstory}+"story");
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
	type: 'radar',
    data: {
        labels: ['감독연출', '스토리', '영상미', '배우연기', 'OST'],
        datasets: [{
            label: 'Charm',
            data: [${cdirector}, ${cstory}, ${cvisual}, ${cactor}, ${cost}],
             backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                
            ], 
             borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
               
            ], 
            borderWidth: 1
        }]
    },
    options: {		
        
        scales: { 
        			           	
            xAxes:[{
            	gridLines:{
					 display:false,
				},
            	ticks:{
					display:false
                },
            }],
        	 
            yAxes: [{
				gridLines:{
					 display:false,
				},
                ticks: {
                    beginAtZero: true,
                    display:false
                }
            }]
        }
    }
});
</script>
<script>

var ctx = document.getElementById('myChart2');
var myChart = new Chart(ctx, {
	type: 'radar',
    data: {
        labels: ['스트레스해소', '즐거움', '긴장감', '몰입감', '감동'],
        datasets: [{
            label: 'Emotion',
            data: [${cstr}, ${cfun},${cten},${cimm}, ${cimp}],
            scaleShowLabels : false,
            omitXLabels: true,
             backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                
            ], 
             borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
               
            ], 
            borderWidth: 1,
            
            
        }]
    },
    options: {		
        
        scales: { 
        			           	
            xAxes:[{
            	gridLines:{
					 display:false,
				},
				
            	ticks:{
					display:false
					
                },
               
            }],
        	 
            yAxes: [{
				gridLines:{
					 display:false,
				},
                
                ticks: {
                    beginAtZero: true,
                    display:false
                  
                    
                }
            }]
        }
    }
});
</script>

</body>
</html>