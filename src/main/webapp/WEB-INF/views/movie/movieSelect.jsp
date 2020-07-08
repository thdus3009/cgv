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
							<span id="title">${vo.title}</span>
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
					<!--  class="active" -->

						<!-- 리뷰 끝 -->
						
						<!-- 리뷰 시작 test -->
<!-- 						<div class="wrap-persongrade">
							<ul id="movie_point_list_container" class="point_col2">
								<li class="liCommentFirst" data-spoilercnt="0" data-reportcnt="0">
									<a href="" class="screen_spoiler">&nbsp;</a>
									
									리뷰 이미지 (movieSelect2.css참고)
									<div class="box-image2">
									
									</div>
											
									계란,아이디								
									<div class="writer-name" style="position: relative;">										 
											<div class="id id_image" style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -20px -45px;"></div>   
											<div class="id id_name">admin</div>
									</div>
									
									리뷰 컨텐츠	
									<div class="box-comment" style="padding-top: 20px;">
										<p>좋아요 재밌어요!!</p>
									</div>
									
									날짜, 좋아요
 									<div class="box-contents"> 									
										<ul class="writerinfo">											
											<li class="writer-etc">
												<span class="day">
													<span class="date"> 2020-06-23</span> &ensp;|&ensp; <img class="date" alt="" src="../../images/like.png">
												</span>
												<span class="like1">0</span>
											</li>
										</ul>
									</div> 
									
								</li>
							</ul>
						</div> -->
						<!-- 리뷰 끝 -->
						
					</div>
						
						
						<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->

							
						
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


<!-- 스크립트 모음 ---------------------------------------------------------------------------------------------->
<script type="text/javascript" src="../js/bbsWrite.js"></script>

<!-- 리뷰관련 script > 나중에 movieReview.js로 옮기기 -->
<script type="text/javascript">

var page1 = "";
var num4 = $(".num4").val();
var uid = "admin"; //아이디 세션값

var select1 = "../review/movieSelect2";

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


 //좋아요 버튼 > 이벤트 위임
$("#ajax_ms").on("click",".date",function(){
	//좋아요 아이디당 한개만 가능 (좋아요 눌렀을때 현재 session값있는지 확인)
	

	if(uid!=null){
		var reservationNum =$(this).attr("data-reservation");

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
			alert("로그인 페이지로 이동");
		}
	}
	
});






//리뷰 update, write
function review_Modal(){
//	alert(uid); //로그인한 session정보 넣기
//	alert(num4);
 	$.ajax({
		type:"GET",
		url: "../review/review_Modal",
		data:{
			uid : uid,
			movieNum : num4
		},
		success:function(data){
			
		}
	})  
//ajax로 해당 영화(var num4)의 review > count() 조회
		
//success:function(data){}안에 if문

	/* 영화를 보고, 영화 리뷰를 작성하였을 시 > 수정 */
	//해당영화의 리뷰가 1개만 있을 경우
	
	//해당영화의 리뷰가 2개이상 있을 경우
	confirm("해당 영화의 리뷰를 2개 이상 작성하였으므로 \n제일 마지막 리뷰가 수정됩니다. 리뷰를 수정하시겠습니까? ");

	/* 영화를 보고, 영화 리뷰를 아직 미작성하였을 시  */

	/* 로그인한 아이디가 (httpSession) 해당영화를 아직 보지 않았을 시에(reservation정보가 있어야 review를 쓸 수 있다.) */
	
}


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