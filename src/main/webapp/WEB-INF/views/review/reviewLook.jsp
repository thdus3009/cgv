<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/myPage.css" rel="stylesheet" type="text/css">

<link href="../css/review/reviewList.css" rel="stylesheet" type="text/css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>


<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="root">
<c:import url="../template/header.jsp"></c:import>
<div class="container">
			<div class="c_nav">
				<div class="nav_linemap">
					<ul>
						<li><a href="../"> <img alt="go to Home"
								src="../images/login/btn_home.png">
						</a></li>
						<li><a href="">MY CGV</a></li>
						<li class="last">MY CGV HOME</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
				<div>
					<div class="col_content">
						<!----------------- contents aside -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">MY CGV HOME<i></i></a></li>
									<li><a href="./memberUpdate?id=${sessionScope.memberVO.id}">회원정보 수정<i></i></a></li>
									<li><a href="#" id="memberDelete">회원 탈퇴<i></i></a></li>
									<li><a href="">예매 영화 관리<i></i></a></li>
									<li><a href="../review/reviewPopup" style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
								</ul>

							</div>
							<div class="ad_area">
								<div class="ad_panner_1">
									<a href=""> <img alt="" src="../images/bbsList/200313_160x300.jpg">
									</a>
								</div>
								<div class="ad_panner_2">
									<a href=""> <img alt="" src="../images/bbsList/0325_160x35.png">
									</a>
								</div>
							</div>
						</div>

						<!------contents detail -->
						<div class="col_detail"></div>

					</div>
				</div>

		
		
<!-- ----------------------------------------------------------------------------------------------------------------  -->
	<!-- 쓰기 전용 -->
	
	<!-- Modal -->
		
	<div class="container"> <!-- 내 평점 모아보기 -->
   		
   		<h1 style="border-bottom: 3px solid black; font-weight: bold; padding-bottom: 10px">내가 쓴 평점</h1>

		<div id="result">
			<c:forEach items="${look}" var="vo">
				<div class="list_p2"><!-- dd -->
					<div class="list_p_content">
						<!-- 이미지 주소부분 나중에 수정해야함 -->
						<div class="list_p_photo">
							<img alt=""	src="${pageContext.request.contextPath}/images/${vo.fileName}" width="110px" height="154.6px">
						</div>
						<div class="list_p_contents1">
							<!-- 타이틀(제목)/리뷰삭제 -->
							<div>
								<div class="td1" style="font-weight: bold; font-size: large;">${vo.title}</div> <!-- 제목 -->
								<button class="td1 td2 delete2" data-num3="${vo.reservationNum}"> <!-- x 표시 -->
									<div class="td_image" style="background: url('../images/movie/movieList/sprite_icon.png') no-repeat -195px -40px"></div>
								</button>
								<span class="check">${vo.reservationNum}</span>
							</div>

							<!-- egg/uid/날짜 -->
							<c:if test="${vo.egg eq 1}">
								<div class="egg3 egg4" style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -20px -45px"></div>
							</c:if>
							<c:if test="${vo.egg eq 0}">
								<div class="egg3 egg4" style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -0px -45px"></div>
							</c:if>
							<div class="egg4">${vo.uid}</div>
							<div class="egg4"> | ${vo.createAt}</div>
							
							<!-- 컨텐츠(내용) -->
							<div style="font-size: 13px; height: 68px">${vo.contents}</div>							
							
							<!-- 수정하기/like -->   
							<!-- data-toggle="modal" data-target="#myModal" -->
							
							<button id="review_update" data-num3="${vo.reservationNum}" data-title="${vo.title}" data-contents="${vo.contents}" data-egg="${vo.egg}"
							 class="ud update Up_popupBtn1" >수정하기</button>
							<span class="ud" > ㆍ </span>
							<img class="ud" alt="" src="${pageContext.request.contextPath}/images/like.png">
							<span class="ud" >&nbsp; ${vo.like1}</span>							

							<!-- Modal 2 Button-->
							<!-- data-toggle="modal" data-target="#myModal2"  -->
							<button type="button" class="Up_popupBtn2" data-toggle="modal" data-target="#myModal2" style="display: none;" data-num3="${vo.reservationNum}"></button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>	
	
	
		<!-- Modal ------------------------------------------------------------------------------------->
		<c:import url="../template/modal.jsp"></c:import>	
	
	
		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>


	<!-- 스크립트 ------------------------------------------------------------------------->
	
	<!-- 리뷰수정 -->
	<script type="text/javascript">
		 var g_num = 0;
		 var g_title = "";
		 var g_contents = ""; 
		 var g_egg = 0;

		 var g_charmPoint = 0;
		 var g_emotionPoint = 0;
		 

		//모달1 영역밖 클릭시 닫힘방지 (foreach문이기 때문에 꼭 class로 이벤트를 주어야 한다.)
		 $(".Up_popupBtn1").click(function(){
		     $("#myModal").modal({backdrop: 'static', keyboard: false});
		 });
/* 		//모달2 영역밖 클릭시 닫힘방지 (foreach문이기 때문에 꼭 class로 이벤트를 주어야 한다.)
		 $(".Up_popupBtn2").click(function(){
		     $("#myModal2").modal({backdrop: 'static', keyboard: false});
		 });
 */
		
		//1.첫 번째 모달     /* 수정button(.Up_popupBtn1)을 클릭했을때 초기화된 상태로 */  /* x버튼 눌렀을때 초기화되면 자잘한 문제들이 생김 */
		$(".Up_popupBtn1").click(function(){
			//contents부분 정보 다시 불러오기
			
			g_num=$(this).data("num3");
			console.log(g_num);

			g_title=$(this).data("title");
			console.log(g_title);
			document.getElementById("title").innerHTML =g_title; 

			g_contents=$(this).data("contents");
			console.log(g_contents);
			document.getElementById("mContents").value =g_contents; //innerHTML로 하면 값이 안바뀐다.

			console.log("aaa");
			//egg적용
			g_egg=$(this).data("egg");
			console.log(g_egg);
			
			if(g_egg==1){
				$('input:radio[name="egg"][value=1]').prop('checked', true);
			}else{
				$('input:radio[name="egg"][value=0]').prop('checked', true);
				}

			//글자 byte조회
			CheckByte(document.getElementById("mContents"));
			
		});


/* 		//1-1. x버튼 누르면 reload >> x버튼 말고 바탕누르면 초기화 안됨...
		$("#exit").click(function(){
			location.reload();
			}); 
  */
		
		//2.첫번째 모달 확인버튼 클릭시
		$("#submitBtn1").click(function(e){
 		var mContents = document.getElementById("mContents");
		g_contents = mContents.value;
		console.log("content:"+g_contents);
		console.log("g_num:"+g_num);
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
					url:"./review_Update1",
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

  	//2번째 모달들어갈때 checked초기화
	$(".Up_popupBtn2").click(function(){
		
		// init
		$(".charmPoint").prop("checked", false);
		$(".emotionPoint").prop("checked", false);
	});
	


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
						url:"./review_Update2",
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


			
//		 ------------------------------------------------------------------------------
		 
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
		 
		 
//		 ------------------------------------------------------------------------------


			
	</script>
	
	
	<!-- 리뷰 삭제 -->
	<script type="text/javascript">
	var g_num = 0;
	
	$(".delete2").click(function(){
		g_num=$(this).data("num3");
		console.log(g_num);
		
		if(confirm("작성한 관람평을 삭제하시겠습니까?")== true){
			$.ajax({
				type:"GET",
				url:"./review_Delete",
				data:{
					reservationNum : g_num,
					},
				success:function(data){
					if(data!=null){
						if(confirm("삭제가 완료되었습니다.\n새로 작성하시겠습니까?")== true){
							window.location.href='http://localhost/review/reviewList';
						}else{
							location.reload();
							}
						}
					},
				error:function(){
					alert("삭제권한이 없습니다.")
					}
	
				})
		
			}
		});
		
	</script>
	
	
	<!-- 글자 byte 체크 -->
	<script type="text/javascript" src="../js/review/checkByte.js"></script>
	

</body>
</html>