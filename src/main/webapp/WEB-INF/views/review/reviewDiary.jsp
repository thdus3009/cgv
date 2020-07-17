<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/myPage.css" rel="stylesheet" type="text/css">
<link href="../css/review/reviewDiary.css" rel="stylesheet" type="text/css">
<!-- review/reviewDiary -->
<title>내가 본 영화 < 무비로그 | 무비 다이어리 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="root">
		<!-- 헤더 -->
		<c:import url="../template/header.jsp"></c:import>

		<!-- 컨테이너 -->
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


			<div class="contents">
				<div class="col_content">
					<!----------------- contents aside -->
					<div class="col_aside">
					
						<div>
							<div class="snb_box">
								<img alt="프로필 사진" src="/images/profile.gif">
								<div class="myinfo">
									<strong>이름님</strong>
									<a href="" alt="수정버튼"></a>
									<em>닉네임</em>
								</div>
							</div>
							<div class="snb_box">
								<a href="" class="snb_menu">
									<em>1</em>
									<strong>기대되는 영화</strong>
								</a>
							</div>
							<div class="snb_box">
								<a href="" class="snb_menu">
									<em>2</em>
									<strong>내가 본 영화</strong>
								</a>
							</div>
							<div class="snb_box">
								<a href="" class="snb_menu">
									<em>3</em>
									<strong>무비 다이어리</strong>
								</a>
							</div>						
						</div>
						
					</div>

					<!------contents detail -->
					<div class="col_detail">

						<!-- Modal -->
						<div class="container">
						
							<!-- top bar -->
							<div class="top-bar" style="margin-bottom: 10px;">
								<h4>무비다이어리</h4>
								<div class="td1" id="total" title="${m_count}"
								style="margin: 0;">
									CGV와 함께한 추억들
									<c:out value="${m_count}" />
									건
								</div>
								<!-- el태그 -->
								<select class="el-sel">
									<option>전체</option>
									<option>년도</option>
								</select>
								<button class="go-look">GO</button>
							</div>
							
							<!-- 쓰기 -->
							<form action="" method="get" class="diary-form">
								<!-- 누르면... 영화목록 -->
								<div class="mv-div" id="mv-m" style="cursor: pointer;" >
									<img alt="icon" src="/images/review/ico_how_movie.gif" class="mv-con">
									<span class="mv-span">어떤 영화를 보셨나요?</span>
									<img alt="열기" src="/images/review/ico_spread.png" class="li-open">
									<a class="li-close"></a>
								</div>
								<!-- 반복, 모달 -->
								<div class="modal-div">
								<c:forEach items="${diary}" var="vo">
									<ul>
										<li class="mv-li">
											<img alt="프로필 사진" src="/images/movie/movieList/filmCover/${vo.fileName}">
											<div class="mv-li-info">
												<strong>${vo.title}</strong>
												<p>${vo.titleEng}</p>
												<p style="margin-top: 10px; font-weight: 600;">${vo.screenDate}&emsp;${vo.screenTime}</p>
												<p>${vo.cinemaName}&ensp;${vo.theaterName}</p>
											</div>
											<button type="button" class="go-look mv-c" data-num="${vo.num}">선택</button>
										</li>
									</ul>
								</c:forEach>
								</div>
								<div class="mv-div">
									<img alt="icon" src="/images/review/ico_how_together.gif">
									<input type="text" id="with1" placeholder="누구와 함께 영화를 보셨나요?">
								</div>
								<div class="mv-div" style="height: 130px;">
									<img alt="icon" src="/images/review/ico_how_see.gif">
									<textarea placeholder="영화 어떻게 보셨나요?" id="opinion" rows="6;"></textarea>
								</div>
								<div class="mv-btn">
									<button type="button" class="mv-sub" style="background-color: #e71a0f; color: #fff;">게시</button>
									<button type="reset" class="mv-can" style="background-color: #7b7b7b; color: #fff;">취소</button>
								</div>
							</form>

						</div>
					
					<!-- Diary List -->						
					dddddddddddddd
					
					</div>
				</div>
			</div>
		</div>

		<!-- 푸터 -->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 -->
		<c:import url="../template/sidebar.jsp"></c:import>
	</div>

	<!-- 스크립트 -->
	<script type="text/javascript" src="../js/review/checkByte.js"></script>
	<script type="text/javascript" src="../js/review/reviewSubmit.js"></script>
	<script type="text/javascript">
	var num = 0;
	var w = "";
	var o = "";
	
	//모달 켜짐
	   $("#mv-m").click(function(){
	      if($("#mv-m").children('.mv-li').length!=0){
	         console.log("stop");
	      }else{
	      $(".li-open").toggle();
	      $(".li-close").toggle();
	      $(".modal-div").toggle();
	      }
	   });

	//모달 꺼짐
	$(".li-close").click(function(){
		$(".li-open").toggle();
		$(".li-close").toggle();
		$(".modal-div").toggle();
	});
	
	//영화 누르면 제목에 출력
	$(".mv-c").click(function(){
		console.log($(this).parent());
		$("#mv-m").prepend($(this).parent());
		$(".mv-li").css('border-bottom','none');
		$(".modal-div").toggle();
		$(".li-close").toggle();
		$(".mv-con").toggle();
		$(".mv-c").toggle();
		$(".mv-span").toggle();

		//커서 변경
		$('#mv-m').css('cursor', 'default');
		
		num = $(this).attr("data-num");
		
	});
	
	// 등록 버튼 (영화 선택 필수)
	$(".mv-sub").click(function(e){
		console.log($("#mv-m").children('.mv-li').length);
		if($("#mv-m").children('.mv-li').length==0){ //li가 없으면?
			alert("영화선택은 필수입니다!");
			e.preventDefault();
		}else{
			if(confirm("등록하시겠습니까?")){
				console.log("num: "+num);
				w = document.getElementById("with1").value;
				o = document.getElementById("opinion").value;
				console.log(w);
				console.log(o);

				$.ajax({
                    type : "GET",
                    url : "./reviewDiary_Write",
                    data : {
                       reservationNum : num,
                       with1 : w,
                       opinion : o,
                    },
                    success : function(data){
						alert("등록되었습니다.");
						location.reload();
                    }
				})
				
				//alert("등록되었습니다.");
			}else{
				e.preventDefault();
			}
		}
	});
	/* 취소 버튼 */
	$(".mv-can").click(function(){
		//alert($("#mv-m").children('.mv-li').length);
		location.reload();
	});

	</script>

</body>
</html>
