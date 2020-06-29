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
			</div>
		</div>
		
		
<!-- ----------------------------------------------------------------------------------------------------------------  -->
	<!-- 쓰기 전용 -->
	
	<!-- Modal -->
		
	<div class="container"> <!-- Write, Update -->
		<h4>내가 본 영화</h4><br>
<!--   		<table>
			<tr>
			<td style="width: 20px;"><div style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -0px -50px" class="egg3"></div></td>
			<td>좋았어요</td>
			</tr>
		</table>   -->
		<button style="display: none;" id="test">
			
		</button>
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<form id="form" name="form" method="post"
						action="./review/review_Write">
						<div class="modal-header" style="background-color: #333;">
							<h4 class="modal-title"
								style="color: #F2F0E5; font-size: X-large;">평점작성</h4>
							<button id="exit" type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div id="title"></div><br>   <!-- reviewSubmit.js / reviewMore / $(".popupBtn1").click 참고 -->
							
							<div style="text-align: center;">
							
									<div class="group_radio" id="egg" >	
										<label class="label_radio"> 
											<input type="radio" name="egg" value=1 class="egg" checked="checked">
											<span class="text_position">좋았어요~^^</span>
										</label>
										&ensp;&ensp;
										<label class="label_radio">
											<input type="radio" name="egg" value=0 class="egg">
											<span class="text_position">흠~좀 별로였어요;;;</span>
										</label>	
									</div>
							
							</div><br>
							
							<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
							<textarea id="mContents" name="contents" rows="5" cols="70" onkeyup="CheckByte(this)"
								placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." 
								style="font-size: small;"></textarea>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<span id="bytes" style="color: black;">0</span>/280(byte)
							&emsp;
							<input type="button" class="btn btn-danger" id="submitBtn1" value="확인">
						</div>
					</form>
				</div>
			</div>
		</div>


<!-- ----------------------------------------------------------------------------------------------------------------  -->


		<!-- The Modal2 -->
		
		<div class="modal" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<form id="form" name="form" method="post"
						action="./review/review_Write">
						<div class="modal-header" style="background-color: #333;">
							<h4 class="modal-title"
								style="color: #F2F0E5; font-size: X-large;">관람 포인트 선택</h4>
							<button id="exit2" type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div style="width: 100%; height: 100px; text-align: center; padding-top: 20px;"><span style="font-size: large; color: #333333">이 영화의 관람포인트를 선택해 주세요!</span><br>
							<span style="color: red;">중복선택</span>이 가능합니다.</div>
							
							<!-- label과 id가 같으면 글씨만 클릭해도 체크박스를 클릭할수 있다. -->
							
							<div style="border-top: 1px solid #cccccc;"><div style="font-weight: bold; padding: 15px 0;">매력 포인트</div>
								<div style="font-weight: lighter;">
								<input type="checkbox" value="감독연출" id="a" class="charmPoint" data-charm="1"> <label for="a">감독연출</label> &emsp; &emsp; &emsp; &emsp;
								<input type="checkbox" value="스토리" id="b" class="charmPoint" data-charm="2"> <label for="b">스토리</label> &emsp; &emsp; &emsp; &emsp;
								<input type="checkbox" value="영상미" id="c" class="charmPoint" data-charm="4"> <label for="c">영상미</label>
								<br>
								<input type="checkbox" value="배우연기" id="d" class="charmPoint" data-charm="8"> <label for="d">배우연기</label> &emsp; &emsp; &emsp; &emsp;
								<input type="checkbox" value="OST" id="e" class="charmPoint" data-charm="16"> <label for="e">OST</label>
								<br><br>
								</div>
							</div>
							
							<div style="border-top: 1px solid #cccccc;"><div style="font-weight: bold; padding: 15px 0;">감정 포인트</div>
								<div style="font-weight: lighter;">
								<input type="checkbox" value="몰입감" id="f" class="emotionPoint" data-emotion="1"> <label for="f">몰입감</label> &emsp; &emsp; &emsp; &emsp; &ensp;
								<input type="checkbox" value="감동" id="g" class="emotionPoint" data-emotion="2"> <label for="g">감동</label> &emsp; &emsp; &emsp; &emsp; &ensp;
								<input type="checkbox" value="스트레스 해소" id="h" class="emotionPoint" data-emotion="4"> <label for="h">스트레스 해소</label>
								<br>
								<input type="checkbox" value="즐거움" id="i" class="emotionPoint" data-emotion="8"> <label for="i">즐거움</label> &emsp; &emsp; &emsp; &emsp; &ensp;
								<input type="checkbox" value="공감" id="j" class="emotionPoint" data-emotion="16"> <label for="j">공감</label>
								<br><br>
								</div>
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<input type="button" class="btn btn-danger" id="submitBtn2" value="확인">
						</div>
						
					</form>
				</div>
			</div>
		</div>
		
		
<!-- ----------------------------------------------------------------------------------------------------------------  -->
	<!-- 읽기 전용 -->
			
	<!-- OnlyRead Modal -->
		
	<div class="modal" id="myModal3">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->

					<div class="modal-header" style="background-color: #333;">
						<h4 class="modal-title"
							style="color: #F2F0E5; font-size: X-large;">평점 보기</h4>
						<button id="exit3" type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" >

						<div id="photo" class="list_p_photo11">
						<!-- reviewSubmit.js에서 ajax로 review_Select에서 json형태의 데이터값을 $("#read").html()형태로 가져온다. (아이디값이 read라서 이 div밑으로 값이 꾸려진다.)-->
						</div>
						
						<div style="font-size: small;" class="list_p_contents11">
							<div id="title1" style="font-size: large; font-weight: bold;"></div>
							<div id="egg1"> <!-- c:set의 value값이 1,0(int값넣기) -->
							</div>
							<div id="contents"></div>
							<br>
							<span id="uid"></span> | 
							<span id="createAt"></span> | <button id="t1" style="border: 0; outline:0; background-color: transparent !important;">삭제</button>
					
						</div>
	
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="button" class="btn btn-danger" id="submitBtn3" value="확인">
					</div>

			</div>
		</div>
	</div>	
		
		
		
		
		

		<!-- 더보기란 10개씩 노출-------------------------------------------------------------------------------------->

		<div id="result">

		</div>

		<button id="more">더보기</button>
	



	</div>	
		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
</div>

<!-- 스크립트 -->

	<script type="text/javascript" src="../js/review/checkByte.js"></script>

	<script type="text/javascript" src="../js/review/reviewSubmit.js"></script>

</body>
</html>