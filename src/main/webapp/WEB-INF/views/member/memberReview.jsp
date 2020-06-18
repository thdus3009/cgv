<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bbsLayout.css" rel="stylesheet"
	type="text/css">
<link href="../css/layout.css" rel="stylesheet"
	type="text/css">

<link href="../css/myPage.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>


<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
		
		
	<div class="container"> <!-- Write, Update -->
		<h2>Modal Example</h2>
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Open modal</button>

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
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
							<textarea id="mContents" name="contents" rows="5" cols="70" onkeyup="CheckByte(this)"
								placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."
								style="font-size: small;"></textarea>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<span id="bytes" style="color: black;">0</span>/280(byte)
							&emsp;
							<button type="submit" class="btn btn-danger" id="popupBtn">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>


		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
</div>

<!-- 스크립트 -->
	<script type="text/javascript">//1.글자수 초과 제한(280byte) 2.글자수 최소 제한(10글자이상)

	function CheckByte(obj){//obj=this

		    var maxByte = 280; //최대 입력 바이트 수
		    var str = obj.value;
		    var str_len = str.length;
		 
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		 
		    for (var i = 0; i < str_len; i++) {
		        one_char = str.charAt(i);
		 
		        if (escape(one_char).length > 4) { //escape : 유니코드 형식으로 인코딩 //한글의 유니코드 길이는 6 (가 = %uAC00)
		            rbyte += 2; //한글2Byte
		        } else {
		            rbyte++; //영문 등 나머지 1Byte
		        }
		 
		        if (rbyte <= maxByte) {
		            rlen = i + 1; //return할 문자열 갯수
		        }
		    }
		 
		    if (rbyte > maxByte) {
		        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		        document.getElementById('bytes').innerText = 280;
		        
		        str2 = str.substr(0, rlen); //문자열 자르기
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		    } else {
		        document.getElementById('bytes').innerText = rbyte;

		    }

		}
	
	 /* $("#mContents").keyup(function(){
			bytesHandler(this);
		 })
		 
		function getTextLength(str) {
		var len = 0;
		
		for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
				len++;
			}
			len++;
		}
		return len;
		}
		
		function bytesHandler(obj){
		//텍스트길이를 bytes클래스에 담기
		var text = $(obj).val();
		$('.bytes').text(getTextLength(text));

		//280bytes를 넘으면 alert창띄우기
		var text2 = getTextLength(text);
		if(text2>280){
			alert("입력가능한 글자수를 초과하였습니다.");
			//문자열 자르기
			
			}
		}  */
		 
	</script>

	<script type="text/javascript"> //
	/* 만약 글자 수를 일정이상 채우지 않으면 팝업창o & 클릭x */
	
	 $("#popupBtn").click(function(e){

		var mContents = document.getElementById("mContents");
		 
		if(mContents.value.length>=10){
			alert("작성완료");				
			
		}else{
			alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
			e.preventDefault();
		}
	
		 })
	
	</script>

</body>
</html>